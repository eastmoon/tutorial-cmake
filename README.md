# CMake

C / C++ 編譯工具 CMake 練習專案。

**『CMake是個一個開源的跨平台自動化建構系統，用來管理軟體建置的程式，並不依賴於某特定編譯器，並可支援多層目錄、多個應用程式與多個函式庫。』**
> From [CMake wiki](https://zh.wikipedia.org/wiki/CMake)

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
    - ```./run.sh executable```：[code](/demo/src/executable)，設定可執行檔 ( 可執行目標)
        + [reference : add_executable](https://cmake.org/cmake/help/latest/command/add_executable.html)
    - ```./run.sh info```：[code](/demo/src/info)，輸出訊息與設定變數
        + [reference : message](https://cmake.org/cmake/help/latest/command/message.html)
        + [reference : set](https://cmake.org/cmake/help/latest/command/set.html)
        + [reference : cmake-variables](https://cmake.org/cmake/help/latest/manual/cmake-variables.7.html)，CMake 系統提供變數
    - ```./run.sh filesystem```：[code](/demo/src/filesystem)，檔案與路徑處理系統
        + [reference : file](https://cmake.org/cmake/help/latest/command/file.html)，檔案管理，部分功能需要 CMake v3.18+
            - 依據文獻說明，CMake 並不建議用 GLOB 解析來搜尋檔案，主要是因為若 CMakeList 若未修改，而是增加搜尋目標檔案，CMake 快取會因此 CMakeList 未變更而忽略這些增加的目標，導致編譯錯誤
        + [reference : cmake_path](https://cmake.org/cmake/help/latest/command/cmake_path.html)，需要 CMake v3.20+
    - ```./run.sh configure```：[code](/demo/src/configure)，複製目標檔並替換變數值後，產生指定檔案
        + [reference : configure_file](https://cmake.org/cmake/help/latest/command/configure_file.html)、[CMake的configure_file指令](https://blog.csdn.net/qq_38410730/article/details/103741579)
        + [reference : include_directories](https://cmake.org/cmake/help/latest/command/include_directories.html)
            - [如何使用CMake正確添加包含目錄](https://ubuntuqa.com/zh-tw/article/9081.html)
            - [CMake之INCLUDE_DIRECTORIES](https://www.jianshu.com/p/9083ecaf03aa)
                + ```include_directories``` 默認情況是使用 AFTER 來追加到搜尋目標列表
                + 使用 ```AFTER```、```BEFORE``` 使指對搜尋目標列表追加或插入
                + 使用 ```SYSTEM``` 則增加的目錄被視為系統路徑，對權限、警告通知會有影響
    - ```./run.sh global-vs-target-include```：[code](/demo/src/global-vs-target-include)，CMake 依據指令對 include 設定全域 (include_directories) 與可執行目標域 (target_include_directories)
        + [reference : target_include_directories](https://cmake.org/cmake/help/latest/command/target_include_directories.html)
        + [What is the difference between include_directories and target_include_directories in CMake?](https://stackoverflow.com/questions/31969547)，[中譯](https://qastack.cn/programming/31969547)
        + [cmake：target_include_directories、include_directories、add_executable](https://blog.csdn.net/zhizhengguan/article/details/115331314)
        + 依據文獻說明，```include_directories``` 是設定給整個 CMakeList.txt 組態的目錄，```target_include_directories``` 是設定給目標 ( project 與 add_executable 所指定的目標 ) 的目錄
    - ```./run.sh library```：[code](/demo/src/library)，建立靜態、動態函式庫
        + [reference : add_library](https://cmake.org/cmake/help/latest/command/add_library.html)
            - [CMake 入門/建置與連結程式庫](https://zh.m.wikibooks.org/zh-tw/CMake_%E5%85%A5%E9%96%80/%E5%BB%BA%E7%BD%AE%E8%88%87%E9%80%A3%E7%B5%90%E7%A8%8B%E5%BC%8F%E5%BA%AB)
        + [reference : add_subdirectory](https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
            - [cmake：add_subdirectory 注意事项](https://zhuanlan.zhihu.com/p/85980099)
        + Header & Library
            - [Difference between Header file and Library](https://www.geeksforgeeks.org/difference-header-file-library/)
            - [What's the difference between a header file and a library?](https://stackoverflow.com/questions/924485/whats-the-difference-between-a-header-file-and-a-library)
                + The header is a phone number you can call
                + The library is the actual person you can reach there!
        + [Static Libraries vs. Dynamic Libraries](https://medium.com/@StueyGK/static-libraries-vs-dynamic-libraries-af78f0b5f1e4)
            - Static library is that it’s code is locked into the final executable file and cannot be modified without a re-compile. In contrast, a dynamic library can be modified without a need to re-compile.
            - 靜態函式庫是編譯期連結的函式集，編譯完後會合併至可執行檔；動態函式庫是執行期連結的函式集，編譯完後會等待可執行檔執行時才建立連結
    - ```./run.sh inheritance```：[code](/demo/src/inheritance)，CMake 在目標 include、libraries 中的 Public、Private、Interface 特性
        + [CMake: Public VS Private VS Interface](https://leimao.github.io/blog/CMake-Public-Private-Interface/)
        + [Modern CMake is like inheritance](https://kubasejdak.com/modern-cmake-is-like-inheritance)
        + [cmake：target_** 中的 PUBLIC，PRIVATE，INTERFACE](https://zhuanlan.zhihu.com/p/82244559)
        + 依據文獻說明，CMake 在編譯可執行目標時，會依據設定導入必要的標頭檔 ( Header file in includes directories )、函式庫 ( Library file in libraries directories )，因此，最終編譯的可執行檔，除了會包括必要的程式碼外，也會繼承標頭檔、函式庫的關係性。
            - Public，目標指定的目錄為公開，則相依此目標的皆可使用此目錄內容
            - Private，目標指定的目錄為私有，則僅有此目標可使用此目錄內容
            - INTERFACE，目標指定的目錄為介面，則當前目標並不會使用此目錄內容，但相依此目標的皆可使用此目錄內容
    - ```./run.sh find-package```：[code](/demo/src/find-package)，CMake 基於現有設定目錄搜尋存在的函式庫
        + [reference : find_package](https://cmake.org/cmake/help/latest/command/find_package.html)
        + [Cmake之深入理解find_package()的用法](https://zhuanlan.zhihu.com/p/97369704)
        + [“轻松搞定CMake”系列之find_package用法详解](https://blog.csdn.net/zhanghm1995/article/details/105466372)
        + [CMake find_package 使用](https://seanzhengw.github.io/blog/cmake/2018/04/23/cmake-find-package.html)
        + 依據文獻來看，搜尋找的是存在動態連結函式庫指定目錄的 Package，例如 Boost 在對應目錄下的 ```/usr/local/lib/boost```，並可以利用 COMPONENTS 來搜尋 Package 下的元件庫，例如 Boost 的 system 在對應目錄下的 ```/usr/local/lib/boost/libboost_system.so```，但需注意若指定的函式庫為 header-only 則因不存在 ```.so``` 或 ```.a``` 因此無法搜尋。
        + 在設計上，建議採用 ```find_package``` 搜尋對應目標庫與元件，避免直接指定目錄，依此來適應不同編譯主機與作業系統
    - ```./run.sh 3party-integrate-library```：[code](/demo/src/3party-integrate-library)，基於 [Standalone Application](https://medium.com/swlh/1764fd1f8a0c) 設計前提，將引用的第三方函式庫彙整至指定的輸出目錄，便於軟體安裝時將必要第三方匯入
        + 測試執行 ```standalone.bat```，啟動輕量 Linux 並複製函式庫後執行應用程式
        + 基於 [find-package](/demo/src/find-package) 範例延伸議題，並考量應用程式引用第三方無法於預期目標環境重編譯軟體，因此透過搜尋動態連結函式庫的方式複製其相依函式庫至指定目標
            - [CMake Copying imported libs](https://cmake.org/pipermail/cmake/2013-July/055207.html)
        + [reference : foreach](https://cmake.org/cmake/help/latest/command/foreach.html)、[reference : if](https://cmake.org/cmake/help/latest/command/if.html)，應用此文獻設計複雜條件與迴圈的邏輯處理
        + 由於 find_package 搜尋回來的函式庫有可能為 [Symbolic link](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/)，因此在透過 [CMake file COPY](https://cmake.org/cmake/help/latest/command/file.html#copy) 需額外使用 ```FOLLOW_SYMLINK_CHAIN``` 指令來複製到正確的動態連結函式庫；然而此指令僅適用 CMake 3.15+，當前範例並不滿足，因此利用 [CMake file GLOB](https://cmake.org/cmake/help/latest/command/file.html#glob) 將目標函式庫搜尋後複製；但此部分需注意，由於這設計是基於檔案命名結構來搜尋，並非正式的作法，最適當方式仍是依據 Symbolic link 指向的目標進行正確的複製
    - ```./run.sh 3party-header-only-library```：[code](/demo/src/3party-header-only-library)，基於 [Standalone Application](https://medium.com/swlh/1764fd1f8a0c) 與 [模組化](https://zh.wikipedia.org/wiki/%E6%A8%A1%E7%B5%84%E5%8C%96%E8%A8%AD%E8%A8%88) 設計前提，將 [Header-Only](https://en.wikipedia.org/wiki/Header-only) 函式庫封裝於自訂義的動態連結庫，便於軟體安裝時將必要引用庫匯入
        + 測試執行 ```standalone.bat```，啟動輕量 Linux 並複製函式庫後執行應用程式
        + Header-Only issue
            - [C++ header-only libraries are bad](https://schneide.blog/2018/04/30/c-header-only-libraries-are-bad/)
            - [Benefits of header-only libraries](https://stackoverflow.com/questions/12671383)
            - Header-Only 函式庫其結構簡單，且開發環境無須額外編譯動態連結庫；但其缺點是函式庫不易閱讀、會以 inline 方式合併入可執行檔。
        + 實驗用自訂義動態函式庫，並以模組方式提供函數供給主程式使用，確保 Header-Only 函式庫被自訂義動態函式庫封裝
        + 此設計概念如 [Domain Driven Design](https://zh.wikipedia.org/wiki/%E9%A0%98%E5%9F%9F%E9%A9%85%E5%8B%95%E8%A8%AD%E8%A8%88) 中的 Repository，將對 Header-Only 函式庫的應用與操作封裝

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
    - 編譯架構
        + [The Programming Process](http://www2.hawaii.edu/~takebaya/ics111/process_of_programming/process_of_programming.html)
        + [The C++ Build Process](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/build.html)
        + [Separate Compilation and Linking of CUDA C++ Device Code](https://developer.nvidia.com/blog/separate-compilation-linking-cuda-device-code/)
        + [C and Cpp - Application qualification specifics](https://doc.castsoftware.com/display/TECHNOS/C+and+Cpp+-+Application+qualification+specifics)
        + [Compile/Link a Simple C Program](https://vdemir.github.io/linux/C-Compling-and-Linking/)
            - [編譯器(Compiler)與連結器(Linker)的運作原理](https://rexpighj123.pixnet.net/blog/post/207609288)
            - [Compiling, linking, Makefile, header files](https://gribblelab.org/teaching/CBootCamp/12_Compiling_linking_Makefile_header_files.html)
            - [Libraries in C++](https://www.oracle.com/technical-resources/articles/it-infrastructure/dev-linkinglibraries5.html)      
+ Linux 文獻
    - [configure、 make、 make install 背后的原理(翻译)](https://zhuanlan.zhihu.com/p/77813702)
        + configure：原始碼編譯設定
        + make：依循 configure 執行編譯，並產生二進制檔案
        + make install：依循 configure 將編譯輸出內容複製至設定的檔案目錄
        + 參考
            - [linux下如何使用configure/make/make install命令編譯安裝解除安裝程式](https://www.itread01.com/content/1545059522.html)
    - [Linux 工具參考篇](https://www.cntofu.com/book/46/linux_tools/ref_tool.md)
