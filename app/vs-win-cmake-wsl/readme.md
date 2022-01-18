# Visual Studio CMake 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Windows
+ Language : C / C++
+ Compiler tool : CMake
    - WSL cmake for Linux Compiler

對應專案目錄設計如下：

```
<project name>
    └ app
    └ lib
    └ test
```

## 操作流程

+ 經由 WSL 指令安裝第三方相依

```
install
```

+ 使用 Visual Studio 開啟專案 CMakeApp

+ 執行編譯專案

## 參考

+ [Visual Studio 中的 CMake 專案](https://docs.microsoft.com/zh-tw/cpp/build/cmake-projects-in-visual-studio?view=msvc-170#editing-cmakeliststxt-files)
    - [在 Visual Studio 中建立 CMake Linux 專案](https://docs.microsoft.com/zh-tw/cpp/linux/cmake-linux-project?view=msvc-170)
        + WSL
            - [安裝 WSL](https://docs.microsoft.com/zh-tw/windows/wsl/install)
                + [Setting up multiple WSL distribution instances](https://endjin.com/blog/2021/11/setting-up-multiple-wsl-distribution-instances)
                + [匯入任何要與 WSL 搭配使用的 Linux 散發套件](https://docs.microsoft.com/zh-tw/windows/wsl/use-custom-distro)
                    - 啟用 WSL-GCC-Debug 會使用 Windows 用戶下的 WSL 目錄，但若自行建立並匯入則其目錄並不回存在於此處
            - [逐步解說：使用 WSL 2 和 Visual Studio 2022 建立和調試 c + +](https://docs.microsoft.com/zh-tw/cpp/build/walkthrough-build-debug-wsl2?view=msvc-170)
                + [Advanced WSL 2 和 CMake projects 考慮](https://docs.microsoft.com/zh-tw/cpp/build/walkthrough-build-debug-wsl2?view=msvc-170#advanced-wsl-2-and-cmake-projects-considerations)，2022 年的 Windows 10 基準會安裝 WSL2，導致從 CMakeSettings.json 設定 WSL-GCC-Debug 會主動啟用 WSL2 相關設定的 CMakePresets.json，而在此之中可以直接設定本機的編譯 ( 相當於原本設定於 CMakeSettings.json 的 x64-debug ) 組態
            - [自訂 CMake 建置設定](https://docs.microsoft.com/zh-tw/cpp/build/customize-cmake-settings?view=msvc-170)
                + [在 Visual Studio 中設定 Linux CMake 專案](https://docs.microsoft.com/zh-tw/cpp/linux/cmake-linux-configure?view=msvc-170)，『Visual Studio 2019 版本 16.1當您以 WSL 為目標時，Visual Studio 不需要複製原始程式檔並維護組建樹狀結構的兩個同步複本，因為 Linux 上的編譯器可以直接存取裝載 Windows 檔案系統中的原始程式檔。』，由於此項規範，在 VS 2019 v16.1 可以注意到設定與 SSH 中最大差別是不再提供遠端通訊的設定，且基於這說明可以發現 WSL 內可以透過 ```/mnt/<disk name>/<windows directory name>``` 目錄存取 Windows 內的實際目錄
                + [CMakeSettings.json 架構參考](https://docs.microsoft.com/zh-tw/cpp/build/cmakesettings-reference?view=msvc-170)
                + [Cppproperties.json json 參考](https://docs.microsoft.com/zh-tw/cpp/build/cppproperties-schema-reference?view=msvc-170)，此文件的部分設定會引用自 CMakeSettings.json，是否適用於 CMake 專案仍待確認
        + Issue
            - Visual Studio 在 WSL 模式下，IntelliSense 無法存取安裝於 WSL 的標頭檔
                + [IntelliSense and WSL not working](https://github.com/Microsoft/vscode-cpptools/issues/2934)
                + [CMake Project with WSL-Debug: Intellisense not working](https://developercommunity.visualstudio.com/t/cmake-project-with-wsl-debug-intellisense-not-work/584659?viewtype=all)
                + 此議題最大問題在於 ```%USERPROFILE%\AppData\Local\Microsoft\Linux\HeaderCache\1.0\<WSL Instance name>\usr``` 目錄中並沒有將目標主機內的檔頭來源複製至此處，導致 Visual Studio 的 IntelliSense 沒法正確提取來源資料，因此在 IDE 顯示編輯錯誤，但執行編譯卻能正常執行
                + 依據文獻說明與測試，在 CMake 中設定 [include_directories](https://cmake.org/cmake/help/latest/command/include_directories.html)，於 VS 執行快取 ( CMake 生成 Makefile ) 時會依據內容提取資訊到目錄中
    - [Using VS2019 with WSL (Windows Subsystem for Linux)](https://docs.microsoft.com/en-us/answers/questions/72614/using-vs2019-with-wsl-windows-subsystem-for-linux.html)
        + Vcpkg
            - [Install vcpkg with linux](https://vcpkg.io/en/getting-started.html)
                + [bullet安装之——Ubuntu中安装vcpkg](https://blog.csdn.net/m0_43436602/article/details/104563093)
                + [Vcpkg telemetry and privacy](https://vcpkg.readthedocs.io/en/latest/about/privacy/)，基於目錄操作安全問題，會需要使用 ```./vcpkg/bootstrap-vcpkg.sh -disableMetrics``` 來規避隱私檢查
            - [Installing and Using Packages Example: SQLite](https://vcpkg.readthedocs.io/en/latest/examples/installing-and-using-packages/)
            - [Pin old Boost versions](https://vcpkg.readthedocs.io/en/latest/examples/modify-baseline-to-pin-old-boost/)
            - [Packaging Github Repos Example: libogg](https://vcpkg.readthedocs.io/en/latest/examples/packaging-github-repos/)
            - [Getting started with versioning](https://vcpkg.readthedocs.io/en/latest/examples/versioning.getting-started/)
                - [How to specify a version of a library](https://github.com/microsoft/vcpkg/issues/1681)
                - Vcpkg 對於指定第三方版本的作法仍有待研究
+ [Visual Studio 中的 CMake 預設值來設定和建立 - 在 Visual Studio 中啟用整合](https://docs.microsoft.com/zh-tw/cpp/build/cmake-presets-vs?view=msvc-170#-enable--cmakepresetsjson-integration-in-visual-studio)
+ [Visual Studio Code Variables Reference](https://code.visualstudio.com/docs/editor/variables-reference)
