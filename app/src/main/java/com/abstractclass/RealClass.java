package com.abstractclass;

import android.util.Log;


public class RealClass extends AbstractClass {
    ITestInterface mTestInterface;
    @Override
    public void doAbstractHandler() {
        Log.e("RealClass", "doAbstractHandler");
    }

    public void doSelfHandler() {
        Log.e("RealClass", " doSelfHandler ");
        if (mTestInterface != null) {
            mTestInterface.onTestInterface();
        }
    }

    public void setTestInterface(ITestInterface testInterface) {
        mTestInterface = testInterface;
        TestBean testBean = new TestBean();
        testBean.setA(10);
        testBean.getA();
        TestUtil.doTestUtil();
    }
}
