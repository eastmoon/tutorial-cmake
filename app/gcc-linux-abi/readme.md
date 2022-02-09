# Linux Compile 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Ubuntu 18.04
+ Language : C / C++
+ Compiler tool : CMake

本專案是針對 GCC 與 GLIBCXX 不一致導致編譯與執行的軟體異常，進行文獻討論與環境建置設計；針對此項議題，最佳解決方案是

**『開發與目標使用一致的 GCC 版本 ( 包括 libstdc++ 版本)』**

然而需要注意，實務上使用多版本安裝，會依據安裝方式不同出現如下狀況：

+ 安裝高於作業系統指定版本的 GCC
    - libstdc++ 會安裝至作業系統可對應的最新版本
    - GCC 版本可選擇高於預設版本
+ 安裝低於作業系統指定版本的 GCC
    - libstdc++ 維持預設版本
    - GCC 版本最高為預設版本

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

## 指令說明

+ 檢查目前安裝 GCC 相關套件
```
apt list --installed | grep gcc
```

+ 檢查目前 libstdc++ 的版本與可安裝版本
```
apt-cache policy libstdc++6               // libstdc++6 版本資訊
dpkg -l "libstdc++*"                      // libstdc++ 安裝與可安裝的套件資訊
```

+ 檢查目前 libstdc++ 字符
```
strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX
```

+ 安裝多版本 GCC
```
add-apt-repository ppa:ubuntu-toolchain-r/test -y && apt-get update -y  && \
apt-get upgrade -y gcc-5 g++-5 && \
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5
```

+ 檢查 GCC 多版本的資訊
```
update-alternatives --display gcc
```

## 參考

+ GCC 版本與 GLIBCXX 版本議題
      - [解决C/C++依赖库不兼容的问题](https://zzqcn.github.io/misc/clib-abi.html#ref4)
      - [ABI Policy and Guidelines](https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html)，文獻內附有 GCC 與 GLIBCXX 版本對照
+ [how-to-install-latest-gcc-on-ubuntu-lts](https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91)
+ [Ubuntu 安裝 gcc/g++，gcc/g++ 多版本切換](https://shengyu7697.github.io/ubuntu-gcc/)
+ [update-alternatives︰管理指令和檔案的多個版本](https://documentation.suse.com/zh-tw/sles/15-GA/html/SLES-all/cha-update-alternative.html)
+ 套件版本檢查指令
    - [How do I see what packages are installed on Ubuntu Linux?](https://www.cyberciti.biz/faq/apt-get-list-packages-are-installed-on-ubuntu-linux/)
    - [How can I check the available version of a package in the repositories?](https://askubuntu.com/questions/340530)
