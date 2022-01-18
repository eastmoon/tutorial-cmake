# Visual Studio CMake 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Windows
+ Language : C / C++
+ Compiler tool : CMake
    - Windows cmake for Windows Compiler

對應專案目錄設計如下：

```
<project name>
    └ app
    └ lib
    └ test
```
## 操作流程

+ 使用 vcpkg 安裝第三方相依

```
install
```

+ 使用 Visual Studio 開啟專案 CMakeApp

+ 執行編譯專案

## 參考

+ [Visual Studio 中的 CMake 專案](https://docs.microsoft.com/zh-tw/cpp/build/cmake-projects-in-visual-studio?view=msvc-170#editing-cmakeliststxt-files)
+ Vcpkg
    - [Install vcpkg with linux](https://vcpkg.io/en/getting-started.html)
        + [bullet安装之——Ubuntu中安装vcpkg](https://blog.csdn.net/m0_43436602/article/details/104563093)
        + [Vcpkg telemetry and privacy](https://vcpkg.readthedocs.io/en/latest/about/privacy/)，基於目錄操作安全問題，會需要使用 ```./vcpkg/bootstrap-vcpkg.sh -disableMetrics``` 來規避隱私檢查
    - [Installing and Using Packages Example: SQLite](https://vcpkg.readthedocs.io/en/latest/examples/installing-and-using-packages/)
        + [vcpkg install error:in triplet x64-windows: Unable to find a valid Visual Studio instance Could not locate a complete Visual Studio instance](https://github.com/microsoft/vcpkg/issues/22074)
            - [How to change language in Visual Studio 2019 (after installation)](https://agirlamonggeeks.com/2019/03/10/how-to-change-language-in-visual-studio-2019-after-installation/)
            - 使用 ```Tools -> Get Tools and Features``` 來安裝語言套件，確保當前版本具有 English 版本的 Visual Studio
        + [cmake cannot find libraries installed with vcpkg](https://stackoverflow.com/questions/55496611)，vcpkg 安裝完後，需要透過設定 CMakePresets.json 的工具鏈 ( toolchain ) 讓 Visual Studio 透過 vcpkg 來解析下載的套件，並透過 CMakeList 設定 ```find_package``` 方式來提取目標函式庫的相關路徑；需注意，若透過 vcpkg 自行偵測系統架構 ( architecture ) 並安裝的第三方，若與 CMakePresets.json 的系統架構不一致會使得 CMake 無法正確找到目標函式庫
    - [Pin old Boost versions](https://vcpkg.readthedocs.io/en/latest/examples/modify-baseline-to-pin-old-boost/)
    - [Packaging Github Repos Example: libogg](https://vcpkg.readthedocs.io/en/latest/examples/packaging-github-repos/)
    - [Getting started with versioning](https://vcpkg.readthedocs.io/en/latest/examples/versioning.getting-started/)
        - [How to specify a version of a library](https://github.com/microsoft/vcpkg/issues/1681)
        - Vcpkg 對於指定第三方版本的作法仍有待研究
+ [Visual Studio Code Variables Reference](https://code.visualstudio.com/docs/editor/variables-reference)
