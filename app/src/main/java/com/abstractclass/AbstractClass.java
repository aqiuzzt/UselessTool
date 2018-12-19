package com.abstractclass;

import android.util.Log;


public abstract class AbstractClass {

    public void doHandler() {
        Log.e("AbstractClass", "do Handler");
    }

    public void doNoUseHandler() {
        Log.e("AbstractClass", "doNoUseHandler");
    }

    public abstract void doAbstractHandler();
}
