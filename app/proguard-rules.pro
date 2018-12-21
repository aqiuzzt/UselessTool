

-applymapping mapping.txt
-obfuscationdictionary obfuscationdictionary.txt
-classobfuscationdictionary obfuscationdictionary.txt

-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontskipnonpubliclibraryclassmembers
-dontpreverify
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
-dontwarn android.support.v4.**
-dontwarn javax.microedition.khronos.**
#-keepattributes InnerClasses
-keepattributes JavascriptInterface
-keepattributes Signature
-keepattributes *Annotation*
-ignorewarnings

-dontoptimize
-dontwarn All

-keep public class * extends com.yy.live.basic.ELAbsModule
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.preference.Preference


#-keep class android.support.v4.** { *; }
#-keep class * extends android.support.v4.**


-keepclasseswithmembers class * {
    native <methods>;
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
    public static ** valueOf(int);
}

-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
    <fields>;
    <methods>;
}

-keep class * implements java.io.Serializable {
    *;
}

-keepattributes SourceFile,LineNumberTable

-keep class * extends android.view.View




################### entmobile sdk #########################

##----- yyprotosdk begin -----
-keep class com.yyproto.jni.** { *; }

-keep class com.duowan.mobile.media.** { *; }

-keep class com.duowan.mobile.mediaproxy.** {
    <fields>;
    <methods>;
}

-keep class * extends com.yy.mobile.YYHandler

-keepclassmembers class * {
	@com.yy.mobile.YYHandler$MessageHandler <methods>;
}

-keepclassmembers class * {
	@com.duowan.mobile.service.EventNotifyCenter$MessageHandler <methods>;
}

-keep class org.webrtc.audioengine.** { *; }
##----- yyprotosdk end -----

##----- yyprotosdk_IMsdk begin -----
-keep class com.im.jni.** { *; }
##----- yyprotosdk IMsdk end -----

##----- yypushsvc begin -----
-keep class com.yy.pushsvc.** { *; }
-keep public class com.yy.sdk.crashreport.CrashHandler{<methods>;}
#-keep class com.yy.pushsvc.jni.** { *; }

##--yyvideolib begin----
-keep class com.yy.mediaframework.** { *; }
##---yyvideolib end----

-dontwarn com.taobao.**
-dontwarn anet.channel.**
-dontwarn anetwork.channel.**
-dontwarn org.android.**
-dontwarn org.apache.thrift.**
-dontwarn com.xiaomi.**
-dontwarn com.huawei.**

-keepattributes *Annotation*

-keep class com.taobao.** {*;}
-keep class org.android.** {*;}
-keep class anet.channel.** {*;}
-keep class com.umeng.** {*;}
-keep class com.xiaomi.** {*;}
-keep class com.huawei.** {*;}
-keep class org.apache.thrift.** {*;}

-keep class com.alibaba.sdk.android.**{*;}
-keep class com.ut.**{*;}
-keep class com.ta.**{*;}

-keep class com.yy.mobile.common.YYGlideModule

-keep public class **.R$*{
   public static final int *;
}
##----- yypushsvc end -----

##----- androiditnaso begin -----
-keep class com.dw.android.itna.** {
    <fields>;
    <methods>;
}
##----- androiditnaso end -----

##----- alipay begin -----
-keep class com.alipay.android.app.IAlixPay { *; }
-keep class com.alipay.android.app.IAlixPay$Stub { *; }
-keep class com.alipay.android.app.IRemoteServiceCallback { *; }
-keep class com.alipay.android.app.IRemoteServiceCallback$Stub { *; }
-keep class com.alipay.sdk.app.PayTask { public *; }
-keep class com.alipay.sdk.auth.AlipaySDK { public *; }
-keep class com.alipay.sdk.auth.APAuthInfo { public *; }
-keep class com.alipay.mobilesecuritysdk.*
-keep class com.ut.*
##----- alipay end -----

##----- ormlite begin -----
-keep class com.j256.ormlite.** { *; }
##----- ormlite end -----

##----- hiidosdk begin -----
-keep public class com.yy.hiidostatis.defs.handler.CrashHandler{*;}
##----- hiidosdk end -----


############################## yymobile ######################################

##----- yymobile_core begin -----
-keep class com.yy.mobile.plugin.homepage.core.ICoreClient {
    #<fields>;
    <methods>;
}

-keep class * implements com.yy.mobile.plugin.homepage.core.ICoreClient {
	#<fields>;
    public <methods>;
}
##----- yymobile_core end -----

##----- client begin -----
-keep class com.yy.mobile.ui.utils.js.bridge.JSBridge {
	<fields>;
    <methods>;
}

-keep class com.yy.mobile.ui.mobilelive.BindPhoneJsInterface {
	<fields>;
    <methods>;
}

-keep class com.yy.mobile.ui.accounts.overseasregister.RegisterUserJsInterface {
	<fields>;
    <methods>;
}

-keep public class com.yy.mobile.ui.utils.js.bridge.WVJSBridgeClient$BridgeWebChromeClient {
    <fields>;
    <methods>;
}
##----- client end -----

##----- huanjubao_yongjin_start -----
##-libraryjars libs/hjbsdk-1.0.1.jar
-keep class com.yy.hjb.aidl.** { *; }
-keep class com.yy.hjbsdk.** { *; }
##----- huanjubao_yongjin_end -----

##----- framework begin -----
-keep public @interface com.yy.mobile.util.DontProguardClass

-keep public @interface com.yy.mobile.util.DontProguardMethod

-keep @com.yy.mobile.util.DontProguardClass class * { *; }

-keepclassmembers class * {
    @com.yy.mobile.util.DontProguardMethod <methods>;
}

-keepclassmembers class * {
    @com.yymobile.core.CoreEvent <methods>;
}

-keep class com.yy.mobile.util.javascript.ResultData{
    <fields>;
}

-keep class com.yy.mobile.util.javascript.JavaScriptInterface{
    <methods>;
}

#modify by cheng@2016-06-17 for zip apk
#-keep class com.dw.android.yyextracom.Yyextracom{
#    <methods>;
#}
##----- framework end -----

################################momo_plus##########################
##-----momo_plus begin-------------------

#lib
-keep class * implements com.yy.core.IHelloBaseClient{
    <fields>;
    public <methods>;
}

-keepclasseswithmembers class * {
    native <methods>;
}


# 音视频SDK
-keep class com.yysdk.mobile.audio.render.AudioPlayThread {
    <methods>;
}

-keep class com.yysdk.mobile.audio.cap.AudioRecordThread {
    <methods>;
}

-keep class com.yysdk.mobile.audio.cap.AudioParams {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.videosdk.YYVideoJniProxy {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.mediasdk.YYMediaJniProxy {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.util.SdkEnvironment {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.video.codec.MediaCodecEncoder2 {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.video.codec.MediaCodecDecoder2 {
    <fields>;
    <methods>;
}
##------momo_plus end--------



################################ 3rd #########################################
##----- android_gif_drawable begin ------
-keep class pl.droidsonroids.gif.** { *; }
##----- android_gif_drawable end ------

##----- ndk_crash_catch_log begin -----
-keep class com.yy.crash.** { *; }
##----- ndk_crash_catch_log end -----

##----- begin vlc sdk ------
-keep class org.videolan.libvlc.** { *; }
-keep class org.media.playercore.** {*;}
##----- end vlc sdk ------

##----- begin share sdk ------
-keep class cn.sharesdk.**{*;}
-keep class com.sina.**{*;}
-keep class **.R$* {*;}
-keep class **.R{*;}
-dontwarn cn.sharesdk.**
-dontwarn **.R$*
##----- end share sdk ------

##----- begin heap ------
-keep class com.yy.mobile.hardwareencoder.softwareencoder.** { *; }
##----- end heap ------

##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
#-keepattributes Signature

# For using GSON @Expose annotation
#-keepattributes *Annotation*

# Gson specific classes
-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
#-keep class com.google.gson.examples.android.model.** { *; }

#-keep class com.google.gson.** { *; }

##---------------End: proguard configuration for Gson  ----------


##----- begin gamecenter ------
#-keep class com.yy.sdk.common.** { *; }
#-keep class com.yy.sdk.report.** { *; }

#-keep class android.net.http.** {*;}

#-keep class com.google.gson.**{ *;}

#-keep class com.yy.protobuf.**{*;}

##----- end gamecenter ------

##----- begin mediarecord ------

-keep class com.ycloud.mediacodec.videocodec.**{*;}
-keep class com.ycloud.utils.** { *; }
-keep class com.ycloud.mediarecord.** { *; }
-keep class com.ycloud.mediarecord2.** { *; }
-keep class com.ycloud.common.CPUMemUtils
-keep class com.ycloud.common.CPUMemUtils.CPUInfo
-keep class com.ycloud.mrlog.MRLog
-keep class com.ycloud.player.** { *; }
-keep class com.ycloud.player.IjkMediaPlayer
-keep class com.ycloud.player.IjkMediaPlayer.** { *; }
-keep class com.ycloud.player.ffmpeg.** { *; }
-keep class com.ycloud.yuv.YUV{ *; }
-keep class com.ycloud.gpufilter.LibGpuFilter{ *; }
##----- end mediarecord ------


##----- gamecenter begin  ------
-keep class com.duowan.plugin.** { *;}
-keep class com.duowan.multidex.** { *;}
#-keep class android.support.v4.** { *;}
-keep class com.duowan.gamecenter.**{*;}
##----- gamecenter end  ------

##----- amap begin  ------
-dontwarn com.amap.api.**
-dontwarn com.aps.**
-keep class com.amap.api.location.**{*;}
-keep class com.amap.api.fence.**{*;}
-keep class com.autonavi.aps.amapapi.model.**{*;}
-keep class com.amap.api.services.**{*;}
##----- amap end  ------

##----http begin---------------
-keep class  org.apache.http.**{
   *;
}


##------http end----------

##------AndFix----------
-keep class * extends java.lang.annotation.Annotation
-keepclasseswithmembernames class * { native <methods>; }
-keep class com.alipay.euler.andfix.** { *; }

-keep class com.dodola.rocoofix.** {*;}
-keep class com.lody.legend.** {*;}
-keepclassmembers class com.dodola.rocoosample.** {
  public <init>();
}

-keep class com.yy.mobile.ylink.** { *; }

##------share info----------
-keep class com.yymobile.core.share.ShareInfoCoreImpl$ShareDetailInfo{
     <fields>;
     <methods>;
}


##------keep support-----------
# GameCenter use
-keep class android.support.v4.util.LruCache{*;}
-keep class * extends android.support.v4.app.Fragment{}
-keep class android.support.v4.app.Fragment{*;}
-keep class android.support.v4.app.FragmentManager{*;}
-keep class android.support.v4.app.FragmentPagerAdapter{*;}
-keep class android.support.v4.app.FragmentActivity {*;}
#-keep class android.support.v4.view.**{*;}
-keep class android.support.v4.view.ViewPager{*;}
-keep class android.support.v4.view.ViewPager$* {*;}
-keep class android.support.v4.view.PagerAdapter{*;}

-keep class android.app.ActivityThread{*;}
-keep class android.app.Instrumentation{*;}
#-keep class android.support.v4.view.ViewPager.OnPageChangeListener{*;}

# ZMCert_SDK
-keep class com.megvii.**{*;}
-keep class com.zmxy.**{*;}
-keep class com.huawei.android.pushagent.**{*;}
-keep class com.huawei.android.pushselfshow.**{*;}
-keep class com.huawei.android.microkernel.**{*;}
-keep class com.baidu.mapapi.**{*;}


-keep class com.yy.yyplayersdk_lib.BuildConfig

# for plugin
-keep class com.yy.android.small.** { *; }
-keep class com.yy.android.jniHooker.** { *; }

-keep, allowobfuscation, includedescriptorclasses public class ** { *; }
-keep, allowobfuscation, includedescriptorclasses public interface ** { *; }
##--yyvideolib begin----
-keep class com.yy.mediaframework.** { *; }
-keep class com.sensetime.stmobileapi.** { *; }
-keep class com.sun.jna.** { *; }

-keep class com.orangefilter.** { *;}

##---amap start----
-keep class com.amap.api.location.**{*;}
-keep class com.amap.api.fence.**{*;}
-keep class com.autonavi.aps.amapapi.model.**{*;}
##---amap end----

-keep class com.alibaba.android.arouter.**{*;}
-keep class * implements com.alibaba.android.arouter.facade.template.ISyringe{*;}
-keep class android.app.** {*;}

-keep class * implements com.duowan.mobile.main.feature.FeatureMapSyringe{*;}

## unicom wspx
-keep class com.mato.** {*; }
-keep class com.loopj.a.a.** {*; }
-dontwarn com.loopj.a.a.**
-dontwarn com.mato.**
-keep class com.tm.** {*; }
-dontwarn com.tm.**
-keepattributes Exceptions, Signature, InnerClasses, Enclosing-Method

-keep class * {
    @com.alibaba.android.arouter.facade.annotation.Autowired <fields>;
}
-keep class com.yy.mobile.YYMobileApp {*;}

-keep public class * extends com.yy.live.basic.ELAbsModule
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.preference.Preference
#-keep class android.support.v4.** { *; }
#-keep class * extends android.support.v4.**


-keepclasseswithmembers class * {
    native <methods>;
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
    public static ** valueOf(int);
}

-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
    <fields>;
    <methods>;
}

-keep class * implements java.io.Serializable {
    *;
}

-keepattributes SourceFile,LineNumberTable

-keep class * extends android.view.View


################### entmobile sdk #########################

##----- yyprotosdk begin -----
-keep class com.yyproto.jni.** { *; }

-keep class com.duowan.mobile.media.** { *; }

-keep class com.duowan.mobile.mediaproxy.** {
    <fields>;
    <methods>;
}

-keep class * extends com.yy.mobile.YYHandler

-keepclassmembers class * {
	@com.yy.mobile.YYHandler$MessageHandler <methods>;
}

-keepclassmembers class * {
	@com.duowan.mobile.service.EventNotifyCenter$MessageHandler <methods>;
}

-keep class org.webrtc.audioengine.** { *; }
##----- yyprotosdk end -----

##----- yyprotosdk_IMsdk begin -----
-keep class com.im.jni.** { *; }
##----- yyprotosdk IMsdk end -----

##----- yypushsvc begin -----
-keep class com.yy.pushsvc.** { *; }
-keep public class com.yy.sdk.crashreport.CrashHandler{<methods>;}
#-keep class com.yy.pushsvc.jni.** { *; }

-dontwarn com.taobao.**
-dontwarn anet.channel.**
-dontwarn anetwork.channel.**
-dontwarn org.android.**
-dontwarn org.apache.thrift.**
-dontwarn com.xiaomi.**
-dontwarn com.huawei.**

-keepattributes *Annotation*

-keep class com.taobao.** {*;}
-keep class org.android.** {*;}
-keep class anet.channel.** {*;}
-keep class com.umeng.** {*;}
-keep class com.xiaomi.** {*;}
-keep class com.huawei.** {*;}
-keep class org.apache.thrift.** {*;}

-keep class com.alibaba.sdk.android.**{*;}
-keep class com.ut.**{*;}
-keep class com.ta.**{*;}

-keep public class **.R$*{
   public static final int *;
}
##----- yypushsvc end -----

##----- androiditnaso begin -----
-keep class com.dw.android.itna.** {
    <fields>;
    <methods>;
}
##----- androiditnaso end -----

##----- alipay begin -----
-keep class com.alipay.android.app.IAlixPay { *; }
-keep class com.alipay.android.app.IAlixPay$Stub { *; }
-keep class com.alipay.android.app.IRemoteServiceCallback { *; }
-keep class com.alipay.android.app.IRemoteServiceCallback$Stub { *; }
-keep class com.alipay.sdk.app.PayTask { public *; }
-keep class com.alipay.sdk.auth.AlipaySDK { public *; }
-keep class com.alipay.sdk.auth.APAuthInfo { public *; }
-keep class com.alipay.mobilesecuritysdk.*
-keep class com.ut.*
##----- alipay end -----

##----- ormlite begin -----
-keep class com.j256.ormlite.** { *; }
##----- ormlite end -----

##----- hiidosdk begin -----
-keep public class com.yy.hiidostatis.defs.handler.CrashHandler{*;}
##----- hiidosdk end -----


############################## yymobile ######################################

##----- yymobile_core end -----

##----- client begin -----
-keep class com.yy.mobile.ui.utils.js.bridge.JSBridge {
	<fields>;
    <methods>;
}

-keep class com.yy.mobile.ui.mobilelive.BindPhoneJsInterface {
	<fields>;
    <methods>;
}

-keep class com.yy.mobile.ui.accounts.overseasregister.RegisterUserJsInterface {
	<fields>;
    <methods>;
}

-keep public class com.yy.mobile.ui.utils.js.bridge.WVJSBridgeClient$BridgeWebChromeClient {
    <fields>;
    <methods>;
}
##----- client end -----

##----- huanjubao_yongjin_start -----
##-libraryjars libs/hjbsdk-1.0.1.jar
-keep class com.yy.hjb.aidl.** { *; }
-keep class com.yy.hjbsdk.** { *; }
##----- huanjubao_yongjin_end -----

##----- framework begin -----
-keep public @interface com.yy.mobile.util.DontProguardClass

-keep public @interface com.yy.mobile.util.DontProguardMethod

-keep @com.yy.mobile.util.DontProguardClass class * { *; }

-keepclassmembers class * {
    @com.yy.mobile.util.DontProguardMethod <methods>;
}

-keepclassmembers class * {
    @com.yymobile.core.CoreEvent <methods>;
}

-keep class com.yy.mobile.util.javascript.ResultData{
    <fields>;
}

-keep class com.yy.mobile.util.javascript.JavaScriptInterface{
    <methods>;
}

#modify by cheng@2016-06-17 for zip apk
#-keep class com.dw.android.yyextracom.Yyextracom{
#    <methods>;
#}
##----- framework end -----

################################momo_plus##########################
##-----momo_plus begin-------------------

#lib
-keep class * implements com.yy.core.IHelloBaseClient{
    <fields>;
    public <methods>;
}

-keepclasseswithmembers class * {
    native <methods>;
}


# 闊宠棰慡DK
-keep class com.yysdk.mobile.audio.render.AudioPlayThread {
    <methods>;
}

-keep class com.yysdk.mobile.audio.cap.AudioRecordThread {
    <methods>;
}

-keep class com.yysdk.mobile.audio.cap.AudioParams {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.videosdk.YYVideoJniProxy {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.mediasdk.YYMediaJniProxy {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.util.SdkEnvironment {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.video.codec.MediaCodecEncoder2 {
    <fields>;
    <methods>;
}

-keep class com.yysdk.mobile.video.codec.MediaCodecDecoder2 {
    <fields>;
    <methods>;
}
##------momo_plus end--------



################################ 3rd #########################################
##----- android_gif_drawable begin ------
-keep class pl.droidsonroids.gif.** { *; }
##----- android_gif_drawable end ------

##----- ndk_crash_catch_log begin -----
-keep class com.yy.crash.** { *; }
##----- ndk_crash_catch_log end -----

##----- begin vlc sdk ------
-keep class org.videolan.libvlc.** { *; }
-keep class org.media.playercore.** {*;}
##----- end vlc sdk ------

##----- begin share sdk ------
-keep class cn.sharesdk.**{*;}
-keep class com.sina.**{*;}
-keep class **.R$* {*;}
-keep class **.R{*;}
-dontwarn cn.sharesdk.**
-dontwarn **.R$*
#-keep class com.yy.mobile.share.BaseCustomerLogo{ *; }
#-keep class com.yy.mobile.share.BasePlatformActionListener{ *; }
#-keep class com.yy.mobile.share.BasePlatform{ *; }
#-keep class com.yy.mobile.share.BasePlatformActionListener{ *; }
#-keep class com.yy.mobile.share.BaseShareContentCustomizeCallback{ *; }
-keep class com.yy.mobile.share.** {*;}
##----- end share sdk ------

##----- begin heap ------
-keep class com.yy.mobile.hardwareencoder.softwareencoder.** { *; }
##----- end heap ------

##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
#-keepattributes Signature

# For using GSON @Expose annotation
#-keepattributes *Annotation*

# Gson specific classes
-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
#-keep class com.google.gson.examples.android.model.** { *; }

#-keep class com.google.gson.** { *; }

##---------------End: proguard configuration for Gson  ----------


##----- begin gamecenter ------
#-keep class com.yy.sdk.common.** { *; }
#-keep class com.yy.sdk.report.** { *; }

#-keep class android.net.http.** {*;}

#-keep class com.google.gson.**{ *;}

#-keep class com.yy.protobuf.**{*;}

##----- end gamecenter ------

##----- begin mediarecord ------
-keep class com.ycloud.mediacodec.videocodec.**{*;}
-keep class com.ycloud.utils.** { *; }
-keep class com.ycloud.mediarecord.** { *; }
-keep class com.ycloud.mediarecord2.** { *; }
-keep class com.ycloud.common.CPUMemUtils
-keep class com.ycloud.common.CPUMemUtils.CPUInfo
-keep class com.ycloud.mrlog.MRLog
-keep class com.ycloud.player.** { *; }
-keep class com.ycloud.player.IjkMediaPlayer
-keep class com.ycloud.player.IjkMediaPlayer.** { *; }
-keep class com.ycloud.player.ffmpeg.** { *; }
-keep class com.ycloud.yuv.YUV{ *; }
-keep class com.ycloud.gpufilter.LibGpuFilter{ *; }
##----- end mediarecord ------


##----- gamecenter begin  ------
-keep class com.duowan.plugin.** { *;}
-keep class com.duowan.multidex.** { *;}
#-keep class android.support.v4.** { *;}
##----- gamecenter end  ------

##----- amap begin  ------
-dontwarn com.amap.api.**
-dontwarn com.aps.**
-keep class com.amap.api.location.**{*;}
-keep class com.amap.api.fence.**{*;}
-keep class com.autonavi.aps.amapapi.model.**{*;}
-keep class com.amap.api.services.**{*;}
##----- amap end  ------

##----http begin---------------
-keep class  org.apache.http.**{
   *;
}


##------http end----------

##------AndFix----------
-keep class * extends java.lang.annotation.Annotation
-keepclasseswithmembernames class * { native <methods>; }
-keep class com.alipay.euler.andfix.** { *; }

-keep class com.dodola.rocoofix.** {*;}
-keep class com.lody.legend.** {*;}
-keepclassmembers class com.dodola.rocoosample.** {
  public <init>();
}

-keep class com.yy.mobile.ylink.** { *; }

##------share info----------
-keep class com.yymobile.core.share.ShareInfoCoreImpl$ShareDetailInfo{
     <fields>;
     <methods>;
}


##------keep support-----------
# GameCenter use
-keep class android.support.v4.util.LruCache{*;}
-keep class android.support.v4.app.Fragment{*;}
-keep class android.support.v4.app.FragmentManager{*;}
-keep class android.support.v4.app.FragmentPagerAdapter{*;}
-keep class android.support.v4.app.FragmentActivity {*;}
#-keep class android.support.v4.view.**{*;}
-keep class android.support.v4.view.ViewPager{*;}
-keep class android.support.v4.view.ViewPager$* {*;}
-keep class android.support.v4.view.PagerAdapter{*;}
-keep class android.support.v4.widget.**{*;}
#-keep class android.support.v4.view.ViewPager.OnPageChangeListener{*;}

# zhimaCertify
-keep class com.alipayzhima.**{*;}
-keep class com.android.moblie.zmxy.antgroup.creditsdk.**{*;}
-keep class com.antgroup.zmxy.mobile.android.container.**{*;}
-keep class com.megvii.livenessdetection.**{*;}
-keep class org.json.alipayzhima.**{*;}
-keep class com.huawei.android.pushagent.**{*;}
-keep class com.huawei.android.pushselfshow.**{*;}
-keep class com.huawei.android.microkernel.**{*;}
-keep class com.baidu.mapapi.**{*;}


-keep class com.yy.yyplayersdk_lib.BuildConfig

# for plugin
-keep class com.yy.android.small.** { *; }
-keep class com.yy.android.jniHooker.** { *; }

-keep, allowobfuscation, includedescriptorclasses public class ** { *; }
-keep, allowobfuscation, includedescriptorclasses public interface ** { *; }

##--yyvideolib begin----
-keep class com.yy.mediaframework.** { *; }
-keep class com.sensetime.stmobileapi.** { *; }
-keep class com.sun.jna.** { *; }
##---yyvideolib end----

-keep class com.orangefilter.** { *;}

-keep class com.ycloud.statistics.** { *; }



-keep class com.yy.mobile.statistic.DurationStatisticDataModel {
    public <methods>;
}

-keep class com.yy.mobile.plugin.homepage.ui.DialogBaseActivity {
    public <methods>;
}

-keep class com.yy.mobile.ui.webview.purewebview.IPureWebview {
    public <methods>;
}

-keep class com.yy.mobile.ui.webview.purewebview.IWebviewCommonMethod {
    public <methods>;
}

-keep class com.yy.mobile.ui.common.IJsSupportWebApi{
    public <methods>;
}

-keep class com.yy.mobile.ui.widget.headerviewpager.ScrollableListener{
    public <methods>;
}

-keep class com.yy.mobile.ui.widget.headerviewpager.ScrollablePersonPageListener{
    public <methods>;
}

-keep class com.ycloud.playersdk.BasePlayer$OnMessageListener{
    public <methods>;
}

-keep class com.yy.mobile.ui.widget.headerviewpager.StickyViewListener{
    public <methods>;
}

-keep class com.handmark.pulltorefresh.library.PullToRefreshBase$OnRefreshListener2{
    public <methods>;
}

-keep class com.yy.mobile.ui.profile.anchor.UserMoreListentner{
    public <methods>;
}

-keep class com.yy.mobile.ui.widget.datetimepicker.DatePickerDialog$OnDateSetListener{
    public <methods>;
}

-keep class com.yy.mobile.util.javascript.apiModule.IApiModule$IApiMethod{
    public <methods>;
}

-keep class com.yymobile.core.auth.IAuthCore{
    public <methods>;
}

-keep class com.yymobile.core.moment.msgParser.msg.Msg{
    public <methods>;
}

-keep class com.yymobile.core.pcu.ITerminalAPPReportCore{
    public <methods>;
}

-keep class com.yymobile.core.sensitivewords.ISensitiveWordsCore{
    public <methods>;
}

-keep class com.yy.mobile.plugin.homepage.ui.BaseLinkFragment{
    *;
}

-keep class com.yy.mobile.plugin.homepage.core.AbstractBaseCore{
    <methods>;
}

-keep class com.yy.mobile.ui.basicchanneltemplate.BackPressedListener{
    <methods>;
}

-keepclasseswithmembernames  class * {
    public *** getComponent();
}

-keep class com.handmark.pulltorefresh.library.PullToRefreshBase$OnRefreshListener{
    <methods>;
}

-keep public class * extends com.yy.mobile.ui.basicchanneltemplate.component.IComponentBehavior {
    <methods>;
}

-keep class com.yy.mobile.ui.basicchanneltemplate.BackPressedDispatcher {
    <methods>;
}

-keep class com.yy.mobile.ui.basicchanneltemplate.FinishHandler {
    <methods>;
}

-keep class com.yy.mobile.ui.programinfo.mvp.IProgramInfoView {
    <methods>;
}

-keep class com.yy.mobile.ui.likelamp.ui.IAtmosphereView {
    <methods>;
}

-keep class com.yy.mobile.plugin.homepage.ui.widget.horizontallist.AdapterView$OnItemLongClickListener {
    <methods>;
}

-keep class com.yy.mobile.ui.profile.uicore.IPersonalInfoBehavior{
    <methods>;
}

-keep class com.yy.mobile.ui.turntable.IFillterPage{
    <methods>;
}

-keep class com.yymobile.core.media.IYYVideoView{
    <methods>;
}

-keep class com.yymobile.core.pcu.ITerminalChannelReportCore{
    <methods>;
}

-keep class com.yy.mobile.statistic.BaseEventStatisticDataModel{
    <methods>;
}

-keep class com.yy.mobile.plugin.homepage.ui.widget.horizontallist.AdapterView$OnItemClickListener{
    <methods>;
}

-keep class com.yyproto.base.YYSdkService {
}

-keep class com.yymobile.core.camera.IBaseCameraCore {
    <methods>;
}

-keep class okhttp3.** { *;}
-keep interface okhttp3.* { *;}
-dontwarn okhttp3.**
-keep class com.yy.mobile.ui.utils.dialog.DialogLinkManager$** { *;}
-keep class android.support.** { *;}
-keep class com.yy.mobile.YYHandler { *;}
-keep class okhttp3.** { *;}
-keep interface com.yy.mobile.util.log.LogCompressListener { *;}
-keep class com.trello.rxlifecycle2.LifecycleProvider { *;}
-keep class com.mob.tools.MobUIShell { *;}
-keep class com.yy.mobile.util.Base64Utils$** {*;}
-keep class com.yy.mobile.model.Reducer {*;}
-keep class com.yy.mobile.model.store.State$Builder {*;}
-keep class com.yy.mobile.model.Action  {*;}
-keep class com.yy.mobile.sdkwrapper.yylive.sdkadapt.SdkLogger {*;}

-keep class com.alibaba.android.arouter.**{*;}
-keep class * implements com.alibaba.android.arouter.facade.template.ISyringe{*;}
-keep class com.bumptech.glide.**{*;}
-keep class com.yymobile.core.live.gson.AnchorLiveInfo {
    <fields>;
}
-keep,allowobfuscation class com.yy.mobile.plugin.homepage.ui.home.MainActivity{void onEventHandle(java.lang.Object);}

#-dontwarn okio.**
#-dontwarn javax.annotation.**

-keepattributes InnerClasses
-keep class com.alibaba.android.vlayout.ExposeLinearLayoutManagerEx { *; }
-keep class android.support.v7.widget.RecyclerView$LayoutParams { *; }
-keep class android.support.v7.widget.RecyclerView$ViewHolder { *; }
-keep class android.support.v7.widget.ChildHelper { *; }
-keep class android.support.v7.widget.ChildHelper$Bucket { *; }
-keep class android.support.v7.widget.RecyclerView$LayoutManager { *; }
-keep, allowobfuscation class com.yy.mobile.plugin.main.PluginEntryPoint{com.duowan.gamecenter.pluginlib.transport.api.IHostApi getHostApi();}

#防止被混淆，因为使用反射做了线程池防护
-keep class com.unicom.xiaowo.inner.ipflow.f.a.a { *; }
-keep class com.loopj.a.a.a { *; }
##----sniper start-----
-keep class com.yy.android.sniper.**{*;}
-keep class com.yy.android.sniper.**$*{*;}
##----sniper end-----

-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    static void checkParameterIsNotNull(java.lang.Object, java.lang.String);
}

-keep public class * extends com.yy.mobile.plugin.homepage.ui.newhome.BaseViewHolderMapping

-keep class * implements com.duowan.mobile.main.kinds.KindMapSyringe

-keep class com.yy.mobile.plugin.homepage.ui.home.holder.SilentPlayBaseViewHolder{ *; }

-keep class com.yy.mobile.plugin.homepage.ui.home.holder.HomeBaseViewHolder{ *; }