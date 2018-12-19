package com.yy.plugin.extension

/**
 * 扩展类
 */
class CheckMethodUsedExtension {
    /**
     * mapping文件路径
     */
    String mappingFilePath
    /**
     * 无用方法输出路径
     */
    String outFilePath

    public String getMappingFilePath() {
        return mappingFilePath;
    }

    public String getOutFilePath() {
        return outFilePath;
    }
}
