# Linux CMake 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Debian Linux
+ Language : C / C++
+ Compiler tool : CMake

對應專案目錄設計如下：

```
<project name>
    └ src
    └ libs
```

## 操作流程

+ 啟用編譯服務主機

```
dockerw start
```
> 於 Windows 環境執行此指令

+ 進入編譯服務主機

```
dockerw into
```
> 於 Windows 環境執行此指令

+ 執行編譯服務

```
dockerw build
```
> 於 Windows 環境執行此指令

## 參考

+ [arm-linux-gnueabihf、aarch64-linux-gnu等ARM交叉编译GCC的区别](https://blog.csdn.net/Namcodream521/article/details/88379307)
+ [gcc編譯參數-fPIC的一些問題](https://jasonblog.github.io/note/linked_and_loader/gccbian_yi_can_6570-_fpic_de_yi_xie_wen_ti.html)
+ [gcc -ldl 选项作用](https://www.cnblogs.com/SZxiaochun/p/7718621.html)
+ [Check if a Library is 32-Bit or 64-Bit](https://www.baeldung.com/linux/check-library-32-or-64-bit)
