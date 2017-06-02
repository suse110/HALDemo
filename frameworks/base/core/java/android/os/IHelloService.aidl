/*
到frameworks/base目录，打开Android.mk文件，修改LOCAL_SRC_FILES变量的值，
增加下面一行
`core/java/android/os/IHelloService.aidl /`
*/
package android.os;
 
interface IHelloService {
    void setVal(int val);
    int getVal();
}