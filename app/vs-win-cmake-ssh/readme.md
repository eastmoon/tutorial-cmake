# Visual Studio CMake 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Windows
+ Language : C / C++
+ Compiler tool : CMake
    - Docker cmake for Linux Compiler

對應專案目錄設計如下：

```
<project name>
    └ app
    └ lib
    └ test
```

## 操作流程

+ 啟用編譯服務主機

```
dockerw start
```

+ 使用 Visual Studio 開啟專案 CMakeApp

+ 設定遠端連線，並取得通訊驗證 ( SSH )

```
Tools -> Options -> Cross Platform -> Connection Manager
工具 -> 選項 -> 跨平台 -> 連線管理員
```

+ 執行編譯專案

## 參考

+ [Visual Studio 中的 CMake 專案](https://docs.microsoft.com/zh-tw/cpp/build/cmake-projects-in-visual-studio?view=msvc-170#editing-cmakeliststxt-files)
    - [在 Visual Studio 中建立 CMake Linux 專案](https://docs.microsoft.com/zh-tw/cpp/linux/cmake-linux-project?view=msvc-170)
        + Docker
            - [Build C++ Applications in a Linux Docker Container with Visual Studio](https://devblogs.microsoft.com/cppblog/build-c-applications-in-a-linux-docker-container-with-visual-studio/)
                + 環境安裝需比照 WSL 的設定
                + [Ubuntu Linux install OpenSSH server](https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/)
            - [連線至 Visual Studio 中的目標 Linux 系統](https://docs.microsoft.com/zh-tw/cpp/linux/connect-to-your-remote-linux-computer?view=msvc-170)
