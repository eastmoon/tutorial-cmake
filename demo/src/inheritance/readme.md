# CMake Public、Privete、Interface 範例

對應專案目錄設計如下：

```
<project name>
    └ main_public.cpp
    └ main_interface.cpp
    └ main_private.cpp
    └ classes
        └ class_public.cpp
        └ class_interface.cpp
        └ class_private.cpp
        └ public
            └ public.h
        └ interface
            └ interface.h
        └ private
            └ private.h
```

+ 可執行檔
    - exec1 使用 ```main_public.cpp```
    - exec2 使用 ```main_interface.cpp```
    - exec3 使用 ```main_private.cpp```
+ 動態函式庫
    - classes 使用 ```class_public.cpp```、```class_interface.cpp```、```class_private.cpp```
    - classes 設定 PUBLIC 目錄 ```classes/public```
    - classes 設定 INTERFACE 目錄 ```classes/interface```
    - classes 設定 PRIVATE 目錄 ```classes/private```

## 測試說明

依據 Public、Privete、Interface 設定如同繼承概念的說明，在 ```classes/CMakeList.txt``` 的設定後擷取了此目標檔的屬性，得到如下資訊：

```
>> Show target classes INCLUDE_DIRECTORIES
-- dir='/repo/inheritance'
-- dir='/repo/inheritance/classes/public'
-- dir='/repo/inheritance/classes/private'
>> Show target classes INTERFACE_INCLUDE_DIRECTORIES
-- dir='/repo/inheritance/classes/public'
-- dir='/repo/inheritance/classes/interface'
```

而這兩個變數分別意思如下：

+ INCLUDE_DIRECTORIES：Library classes 內部可使用的標頭檔搜尋目錄
+ INTERFACE_INCLUDE_DIRECTORIES：連結 Library classes 的可執行檔，能使用的標頭檔搜尋目錄

根據這兩個目錄列表，可執行檔 exec1、exec2 則可藉由動態連結庫公開的目錄 ```INTERFACE_INCLUDE_DIRECTORIES``` 取得 ```public.h```、```interface.h``` 並設定對應的 ```_PROJECT_VERSION_``` 變數

```
./inheritance/out/bin/exec1
Call library PUBLIC include_directories
1.1.2.2
./inheritance/out/bin/exec2
Call library INTERFACE include_directories
1.1.2.1
```

而 exec3 則無法直接取得 ```private.h```，因為 ```INTERFACE_INCLUDE_DIRECTORIES``` 並沒有提供搜尋目錄，若設定 ```#include <private.h>``` 則會出現如下訊息

```
/repo/inheritance/main_private.cpp:3:10: fatal error: private.h: No such file or directory
```

因此在範例中，exec3 使用動態函式庫提供的物件來呼叫函式庫內容，而根據動態連結庫內可使用的目錄 ```INCLUDE_DIRECTORIES```，其內部函數可取得 ```public.h```、```private.h``` 並設定對應的 ```_PROJECT_VERSION_``` 變數

```
./inheritance/out/bin/exec3
Call library class tclass action
1.1.2.2
Library can't use INTERFACE include_directories
1.1.2.0
```

同理於 ```INTERFACE_INCLUDE_DIRECTORIES``` 無法搜尋到 ```private.h```，```INCLUDE_DIRECTORIES``` 也無法搜尋到 ```interface.h```
