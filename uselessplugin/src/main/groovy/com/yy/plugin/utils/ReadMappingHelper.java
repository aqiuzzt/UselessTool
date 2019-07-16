package com.yy.plugin.utils;

import com.yy.plugin.entry.ClassMappingInfo;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

/**
 * mapping文件解析类
 */

public class ReadMappingHelper {
    private static ReadMappingHelper instance;

    /**
     * 所有创建的classMapping
     */
    private Map<String, ClassMappingInfo> usedInModifiedClassMappingInfo = new HashMap<String, ClassMappingInfo>();

    public static ReadMappingHelper getInstance() {
        if (instance == null) {
            instance = new ReadMappingHelper();
        }
        return instance;
    }

    public static void init() {
        instance = new ReadMappingHelper();
    }

    private ReadMappingHelper() {

    }

    /***
     * 解析所有class信息
     *
     * @return
     */
    public void initMappingInfo(String mappingFilePath) {
        //查找mapping文件
        Logger.i("mappingFilePath = " + mappingFilePath);
        InputStream is = null;
        boolean needBacktrace = true;
        String line;
        String className, methodName;
        int methodCount = 0;
        try {
            //按行读取mapping文件
            is = new FileInputStream(mappingFilePath);
            BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"), 1024);
            // 读取一行，存储于字符串列表中
            line = reader.readLine().trim();
            while (line != null) {
                line = line.trim();
                if (!needBacktrace) {
                    line = reader.readLine();
                    if (line == null) {
                        break;
                    }
                    line = line.trim();
                }
                needBacktrace = false;
                //通过->和:来判断该行是否为类信息行
                if (line.indexOf("->") > 0 && line.indexOf(":") == line.length() - 1) {
                    ClassMappingInfo classMapping = new ClassMappingInfo();
                    className = line.substring(0, line.indexOf("->") - 1).trim();
//                    Logger.i("className:" + className);
                    classMapping.setClassName(className);

                    //com.abstractclass.AbstractClass -> com.a.a:
                    //然后按->进行split，拿到前面原始的类名路径，放到新创建的classMapping中
                    classMapping.setValueName(line.split("->")[1].substring(0, line.split("->")[1].length() - 1).trim());
                    line = reader.readLine();
                    while (line != null) {
                        //void doHandler() -> a
                        line = line.trim();
                        if (line.endsWith(":")) {
                            needBacktrace = true;
                            break;
                        }
                        String[] lineinfo = line.split(" ");
                        if (lineinfo.length != 4) {
                            throw new RuntimeException("mapping line info is error  " + line);
                        }
                        if (lineinfo[1].contains("(") && lineinfo[1].contains(")")) {//判断是否是方法
                            String strMethod = lineinfo[0].trim();
                            //混淆后的map文件中，方法都会在前面加上数字，格式类似于10:10:void function() -> a
                            if (strMethod.contains(":")) {
                                strMethod = strMethod.substring(strMethod.lastIndexOf(":"));
                            }
                            methodName = getMethodSigureWithReturnTypeInMapping(strMethod, lineinfo[1].trim());
                            //Logger.i("mapping methodName = " + methodName);
                            methodCount++;
                            classMapping.getMemberMapping().put(methodName, lineinfo[3].trim());
                        }
//                      else {
//                            //fields
//                            classMapping.getMemberMapping().put(lineinfo[1].trim(), lineinfo[3].trim());
//                        }
                        line = reader.readLine();
                        if (line == null) {
                            break;
                        }
                        line = line.trim();
                    }
                    usedInModifiedClassMappingInfo.put(classMapping.getClassName(), classMapping);
                }
            }
            Logger.i("method total count = " + methodCount);
        } catch (IOException ioe) {
            ioe.printStackTrace();
            Logger.i("get Mapping info Failed");
//            throw new RuntimeException("get Mapping info Failed");
        } finally {
            try {
                if (is != null) {
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * null 表示类无用
     *
     * @param classname
     * @return
     */
    public ClassMappingInfo getClassMapping(String classname) {
        return usedInModifiedClassMappingInfo.get(classname);
    }

    public void setClassMapping(String classname, ClassMappingInfo classMapping) {
        usedInModifiedClassMappingInfo.put(classname, classMapping);
    }

    public ClassMappingInfo getClassMappingOrDefault(String classname) {
        ClassMappingInfo defaultClassMapping = new ClassMappingInfo();
        return usedInModifiedClassMappingInfo.getOrDefault(classname, defaultClassMapping);
    }

    /***
     * @param returnTypeWithNumber
     * @param methodSignure
     * @return returnType+" "+methodSignure,just one blank
     */

    public String getMethodSigureWithReturnTypeInMapping(String returnTypeWithNumber, String methodSignure) {
        //初步观察mapping文件，使用":"来截取返回值，还可以通过寻找第一个字符，
        return getMethodSignureWithReturnType(returnTypeWithNumber.substring(returnTypeWithNumber.lastIndexOf(":") + 1), methodSignure);
    }

    public String getMethodSignureWithReturnType(String returnType, String methodSignure) {
        //只有一个空格
        return returnType + " " + methodSignure;
    }

    public boolean classHasNoUsed(String className) {
        ClassMappingInfo classMapping = getClassMapping(className);
        if (classMapping == null) {
            return true;
        }
        return false;
    }

    public boolean methodHasNoUsed(String className, String methodName) {
        ClassMappingInfo classMapping = getClassMapping(className);
        if (classMapping == null) {
            return true;
        }
        if (classMapping.getMemberMapping().get(methodName) == null) {
            return true;
        }
        return false;
    }
}