# GLIBCXX、GLIBC

+ GLIBC 是指 ```libc.so``` 中使用的 GNU C Library 語法版本
+ GLIBCXX 是指 ```libstdc++.so``` 中使用的 GNU CXX Library 語法版本

而當編譯環境與執行環境的 ```libc.so```、```libstdc++.so``` 版本不同，會導致執行檔的動態連結此兩檔案後，出現 ```GLIBC_x.xx not found```、```GLIBCXX_x.xx.xxx not found``` 的錯誤。

## 固定作業系統與編譯器版本

應對目標最簡單的做法是鎖定作業系統版本，因不同作業系統版本可使用的函式庫上限會有差別，例如：

+ Ubuntu 16.04：gcc 5、libc-2.23、libstdc++.so.6.0.21
+ Ubuntu 18.04：gcc 7、libc-2.27、libstdc++.so.6.0.25

在這之中，各自的編譯限制來自於

+ GLIBC，依據編譯環境的 libc 決定會用到的字符版本，可使用範例程式 ```main.cpp``` 中的 ```__asm__``` 語法逐一函數替換版本
+ GLIBCXX，依據編譯時選用的 gcc 決定會用到的字符版本；亦即將 libstdc++ 安裝至最高版本，不同的 gcc 可使用範圍會有限制

## 文獻

+ [GLIBC_2.14 兼容问题 version `GLIBC_2.14′ not found](https://blog.csdn.net/baidu_32526299/article/details/79883985)
+ [ABI Policy and Guidelines](https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html)
