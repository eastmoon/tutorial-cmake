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

+ 啟用編譯服務主機並進入 Docker 虛擬機內

```
dockerw start
```
> 於 Windows 環境執行此指令

+ 依據目錄編譯專案

```
./run.sh <demo code directory>
```
> 於 Linux 環境執行此指令
