package com.yy.plugin.method;

import java.util.HashMap;
import java.util.Map;

/**
 * 保存mappping信息相关数据
 * method 存储的信息有：返回值，方法名，参数列表，混淆后的名字
 * 字段 存储的信息有：字段名，混淆后的名字
 */
public class ClassMapping {
    /**
     * 混淆前的类全路径
     */
    private String className;
    /**
     * 混淆后的类全路径
     */
    private String valueName;
    /**
     * 字段和方法的混淆前后信息
     */
    private Map<String, String> memberMapping = new HashMap<>();

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    public Map<String, String> getMemberMapping() {
        return memberMapping;
    }

    public void setMemberMapping(Map<String, String> memberMapping) {
        this.memberMapping = memberMapping;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ClassMapping)) return false;

        ClassMapping classMapping = (ClassMapping) o;

        return getClassName() != null ? getClassName().equals(classMapping.getClassName()) : classMapping.getClassName() == null;

    }

    @Override
    public int hashCode() {
        return getClassName() != null ? getClassName().hashCode() : 0;
    }
}
