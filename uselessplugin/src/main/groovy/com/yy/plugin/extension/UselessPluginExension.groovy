package com.yy.plugin.extension

class UselessPluginExension {
    def injectEnable = true
    List<String> injectPackagesKey = new ArrayList<String>()
    List<String> disinjectClassSuffix = new ArrayList<String>()
    String logTag = "YYUseless"

    public UselessPluginExension injectPackagesKey(String...filters) {
        if (filters != null) {
            injectPackagesKey.addAll(filters)
        }
        return this
    }

    public List<String> getInjectPackagesKey() {
        return injectPackagesKey;
    }

    public String getLogTag() {
        return logTag;
    }

    public UselessPluginExension disinjectClassSuffix(String...filters) {
        if (filters != null) {
            disinjectClassSuffix.addAll(filters)
        }

        return this
    }
}
