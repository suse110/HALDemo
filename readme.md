* 修改 \frameworks\base\services\jni\ 目录下的onload.cpp文件  
首先在namespace android增加 register_android_server_HelloService 函数声明：
```
    namespace android {
        ....
        int register_android_server_HelloService(JNIEnv *env);
    };
```  

在JNI_onLoad增加register_android_server_HelloService函数调用
```
    extern "C" jint JNI_onLoad(JavaVM* vm, void* reserved)
    {
        ...
        register_android_server_HelloService(env);
        ...
    }
```
这样，在Android系统初始化时，就会自动加载该JNI方法调用表

* 修改\frameworks\base\services\jni\目录下的Android.mk文件，在LOCAL_SRC_FILES变量中增加一行
    `com_android_server_HelloService.cpp /` 

* 修改\frameworks\base\services\java\com\android\server\目录的SystemServer.java文件，在ServerThread::run函数中增加加载HelloService的代码
```
try {
    Slog.i(TAG, "Hello Service");
    ServiceManager.addService("hello", new HelloService());
} catch (Throwable e) {
    Slog.e(TAG, "Failure starting Hello Service", e);
}
```

* 修改arch/arm/Kconfig和drivers/kconfig两个文件，在menu "Device Drivers"和endmenu之间添加一行   
    `source "drivers/hello/Kconfig"`  
    这样，执行make menuconfig时，就可以配置hello模块的编译选项了。


* 修改drivers/Makefile文件，添加一行  
    `obj-$(CONFIG_HELLO) += hello/`