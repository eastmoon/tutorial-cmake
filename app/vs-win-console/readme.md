# Visual Studio C++ Console 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Windows
+ Language : C / C++
+ Compiler tool : Visual studio MSBuild

對應專案目錄設計如下：

```
<project name>
    └ app
    └ lib
    └ test
```

## 操作流程

+ 經由指令下載第三方相依

```
install
```

+ 使用 Visual Studio 開啟專案 ConsoleApp

+ 執行編譯專案

## 參考

+ [Visual Studio 專案 - C++](https://docs.microsoft.com/zh-tw/cpp/build/creating-and-managing-visual-cpp-projects?view=msvc-170)
    - [Set compiler and build properties (設定編譯器及組建屬性)](https://docs.microsoft.com/zh-tw/cpp/build/working-with-project-properties?view=msvc-170)
+ 函式庫
    - [Boost](https://github.com/boostorg/boost)
        + [Boost Getting Started on Windows](https://www.boost.org/doc/libs/1_69_0/more/getting_started/windows.html)
        + [The definitive guide on compiling and linking Boost C++ libraries for Visual Studio projects](https://levelup.gitconnected.com/the-definite-guide-on-compiling-and-linking-boost-c-libraries-for-visual-studio-projects-c79464d7282d)
    - [Date](https://github.com/HowardHinnant/date)
    - [Mongo C](https://github.com/mongodb/mongo-c-driver)、[Mongo Cxx](https://github.com/mongodb/mongo-cxx-driver)
    - [Paho MQTT C](https://github.com/eclipse/paho.mqtt.c)、[Paho MQTT Cpp](https://github.com/eclipse/paho.mqtt.cpp)
    - [SQLP11](https://github.com/rbock/sqlpp11)、[SQLP11 Connector MySQL](https://github.com/rbock/sqlpp11-connector-mysql)
    - [XLNT](https://github.com/tfussell/xlnt)
