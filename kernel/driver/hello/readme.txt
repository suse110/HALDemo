在Kconfig文件中，tristate表示编译选项HELLO支持在编译内核时，hello模块支持以模块、内建和不编译三种编译方法，默认是不编译，因此，在编译内核前，我们还需要执行make menuconfig命令来配置编译选项，使得hello可以以模块或者内建的方法进行编译

