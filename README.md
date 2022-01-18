# CMake

C / C++ 編譯工具 CMake 練習專案。

**『CMake是個一個開源的跨平台自動化建構系統，用來管理軟體建置的程式，並不依賴於某特定編譯器，並可支援多層目錄、多個應用程式與多個函式庫。』**
> From [CMake wiki](https://zh.wikipedia.org/wiki/CMake)

## 指令

## 目錄

+ CMake Project
    - [GCC - compile at linux server](/app/gcc-linux-cmake)
    - [Visual Studio - compile at Windows OS](/app/vs-win-cmake-win)
        + [Visual Studio - MSBuild at Windows OS](/app/vs-win-console)
    - [Visual Studio - compile at WSL virtual machine](/app/vs-win-cmake-wsl)
    - [Visual Studio - compile at remote server](/app/vs-win-cmake-ssh)

+ [CMake demo code](/demo)
    - ```./run.sh project```：[code](/demo/src/project)，設定專案資訊
        + [reference : project](https://cmake.org/cmake/help/latest/command/project.html)
    - ```./run.sh executable```：[code](/demo/src/executable)，設定可執行檔
        + [reference : add_executable](https://cmake.org/cmake/help/latest/command/add_executable.html)
    - ```./run.sh info```：[code](/demo/src/info)，輸出訊息與設定變數
        + [reference : message](https://cmake.org/cmake/help/latest/command/message.html)
        + [reference : set](https://cmake.org/cmake/help/latest/command/set.html)
        + [reference : cmake-variables](https://cmake.org/cmake/help/latest/manual/cmake-variables.7.html)，CMake 系統提供變數
    - ```./run.sh coonfigure```：[code](/demo/src/coonfigure)，複製目標檔並替換變數值後，產生指定檔案
        + [reference : configure_file](https://cmake.org/cmake/help/latest/command/configure_file.html)

## 文獻探討

### CMake 簡介

CMake 是依據組態檔 CMakeList.txt 建構編譯程序 ( build process )；其處理流程最終並非生成軟體，而是產生對應環境的建構流程與檔案，再由環境對應的編譯器依循建構流程與檔案進行編譯程序，因此如下圖所示，CMake 可以對應用於 Linux、Windows、Mac 不同作業系統環境的再編譯。

![CMake flow](https://logins.github.io/assets/img/posts/2020-05-17-CMakeInVisualStudio/CMakeGeneral_Diagram.jpg)
> from [Why Using CMake](https://logins.github.io/programming/2020/05/17/CMakeInVisualStudio.html)

原則上 CMake 可以於不同作業系統編譯，但對應流程中的相關設定、引用來源等若無適當提供資訊，仍會讓編譯失敗；其編譯流程如下圖所示：

![CMake Stages](https://logins.github.io/assets/img/posts/2020-05-17-CMakeInVisualStudio/CMakeStages_Diagram.jpg)
> from [Why Using CMake](https://logins.github.io/programming/2020/05/17/CMakeInVisualStudio.html)

+ CMake 解析 CMakeList.txt，並產生環境所需的編譯檔

```
mkdir build
cmake -S <source directory> -B ./build/<native tool's project directory>
```
+ 執行編譯檔，並產生二進制執行檔案

```
make -C ./build/<native tool's project directory>
```
> linux 編譯指令 make

+ 執行編譯檔安裝

```
make install
```

### 第三方依賴編譯與安裝

基於交叉編譯器 ( Cross compiler ) 目的，可以追朔兩個關於第三方編譯與安裝的議題：

+ C++ 編譯程序會因系統架構 ( CPU、OS、Complier ) 不同而有導致輸出內容差異

在 C++ 編譯程序中共包括四個階段，其中 Assemble、Linker 兩階段會基於編譯器、作業系統、硬體架構，合併入不同的相依函式庫，這也造就 C++ 原始碼在不同電腦系統 ( x86、ARM )、不同作業系統 ( Windows、Linux、Mac )、不同編譯器 ( gcc、visual studio ) 時彙編的程式有著不相同的內容；因此，若確定使用的電腦系統、作業系統、編譯工具，在此情況下無許重複編譯。

![C++ Build Process](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/Images/build.png)
> from [The C++ Build Process](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/build.html)

+ C++ 函式庫引用

依據文獻所述，在不額外規範的情況下，C++ 編譯會基於原始碼中引用的檔頭，如 ```<iostream>``` 其中的函數、類別使用與宣告，自對應的函式庫 ```xxxx.o``` 檔案中提取自編譯最終輸出的可執行檔案；這提取與整合機械碼自可執行檔的部分，就是彙編中導致可執行檔案無法跨系統、平台使用的主因。

```
nm -C ./publish/bin/Application
```
> 此命令，可列出執行檔案中的宣告函數

而若編譯時指定函式庫連結，則會基於連結而減少彙整至可執行檔案的內容，進而達到模組化的函式庫設計；然而，若執行程式時無法找到可連結的函式庫，將導致程式無法運作。

```
ldd ./publish/bin/Application
```
> 此命令，可列出執行檔案所需連結的函式庫

## 參考

+ [CMake](https://cmake.org/)
    + [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
    + [Quick CMake tutorial](https://www.jetbrains.com/help/clion/quick-cmake-tutorial.html)
    + [Why Using CMake](https://logins.github.io/programming/2020/05/17/CMakeInVisualStudio.html)
    + [CGold: The Hitchhiker’s Guide to the CMake](https://cgold.readthedocs.io/en/latest/index.html)
        - [CMake初识](https://zhangyuyu.github.io/cmake-hello/)
    + [CMake 入門/建置執行檔](https://zh.m.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80/%E5%BB%BA%E7%BD%AE%E5%9F%B7%E8%A1%8C%E6%AA%94)
    - [CMake 入門/建置與連結程式庫](https://zh.m.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80/%E5%BB%BA%E7%BD%AE%E8%88%87%E9%80%A3%E7%B5%90%E7%A8%8B%E5%BC%8F%E5%BA%AB)
    + [CMake學習筆記（一）基本概念介紹、入門教程及CLion安裝配置](https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/712067/)
    + [CMake 常用指令](https://www.cntofu.com/book/46/cmake/cmake_chang_yong_zhi_ling.md)
    + [CMake 教學](https://ithelp.ithome.com.tw/articles/10221101)
    + [CMake 教程文獻](https://sfumecjf.github.io/cmake-examples-Chinese/01-basic/)
+ C++ 編譯結構
    - Cross Compile
        + 議題
            - [Why do you need to recompile C/C++ for each OS?](https://stackoverflow.com/questions/61644911)
            - [Why do we need to compile for different platforms](https://stackoverflow.com/questions/48235579)
            - [為什麼說c,c++不能跨平臺，編譯器是在計算機作業系統上的嗎，難道說編譯器不在c,c++程式裡嗎？](https://www.juduo.cc/club/1278541.html)
            - [交叉編譯器（英語：Cross compiler）](https://zh.wikipedia.org/wiki/%E4%BA%A4%E5%8F%89%E7%B7%A8%E8%AD%AF%E5%99%A8)
        + [Cross Compiling With CMake](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Cross%20Compiling%20With%20CMake.html)
        + [How to Build a GCC Cross-Compiler](https://jasonblog.github.io/note/raspberry_pi/how_to_build_a_gcc_cross-compiler.html)
    - 動態連結函式庫
        + [Header Files in C/C++](https://data-flair.training/blogs/header-files-in-c-cpp/)
        + [使用 gcc 自製 C/C++ 靜態、共享與動態載入函式庫教學](https://blog.gtwang.org/programming/howto-create-library-using-gcc/)
        + [C and C++ library naming conventions](https://developer.arm.com/documentation/100073/0616/The-Arm-C-and-C---Libraries/C-and-C---library-naming-conventions)
        + [cmake：target_** 中的 PUBLIC，PRIVATE，INTERFACE](https://zhuanlan.zhihu.com/p/82244559)
    - 編譯架構
        + [The Programming Process](http://www2.hawaii.edu/~takebaya/ics111/process_of_programming/process_of_programming.html)
        + [The C++ Build Process](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/build.html)
        + [Separate Compilation and Linking of CUDA C++ Device Code](https://developer.nvidia.com/blog/separate-compilation-linking-cuda-device-code/)
        + [C and Cpp - Application qualification specifics](https://doc.castsoftware.com/display/TECHNOS/C+and+Cpp+-+Application+qualification+specifics)
        + [Compile/Link a Simple C Program](https://vdemir.github.io/linux/C-Compling-and-Linking/)
            - [編譯器(Compiler)與連結器(Linker)的運作原理](https://rexpighj123.pixnet.net/blog/post/207609288)
            - [Compiling, linking, Makefile, header files](https://gribblelab.org/teaching/CBootCamp/12_Compiling_linking_Makefile_header_files.html)
            - [Libraries in C++](https://www.oracle.com/technical-resources/articles/it-infrastructure/dev-linkinglibraries5.html)      
+ Compiler libraray
    - [configure、 make、 make install 背后的原理(翻译)](https://zhuanlan.zhihu.com/p/77813702)
        + configure：原始碼編譯設定
        + make：依循 configure 執行編譯，並產生二進制檔案
        + make install：依循 configure 將編譯輸出內容複製至設定的檔案目錄
        + 參考
            - [linux下如何使用configure/make/make install命令編譯安裝解除安裝程式](https://www.itread01.com/content/1545059522.html)
