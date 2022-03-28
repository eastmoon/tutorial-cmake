# Linux ARM CMake 專案

此專案為 C / C++ 應用程式專案，其專案架構如下：

+ Operating System : Debian Linux & Qemu
+ Language : C / C++
+ Compiler tool : CMake

對應專案目錄設計如下：

```
<project name>
    └ src
    └ libs
```

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

qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine type=virt -nographic -smp 1 -m 2048 -kernel /image  --append "console=ttyAMA0"

## 參考

+ [Ubuntu 16.04.7 LTS (Xenial Xerus) (ARMv8/AArch64)](https://cdimage.ubuntu.com/ubuntu/releases/16.04/release/)
+ [QEMU](https://www.qemu.org/docs/master/)
    - [Ubunut wiki - QEMU](https://wiki.ubuntu.com/ARM64/QEMU)
    - [QEMU ARM64 guide](https://www.cntofu.com/book/46/qemu/76.md)
    - [cross compiler install](https://www.cntofu.com/book/46/toolchain/171.md)
+ Docker
    - [透過Qemu在X86機器上執行Pi](https://peihsinsu.gitbooks.io/docker-note-book/content/run_pi_over_qemu_on_x86.html)
    - [Github - docker-qemu](https://github.com/tianon/docker-qemu)
    - [Github - dockcross](https://github.com/dockcross/dockcross)
+ Virtual Machine
    - [Run Ubuntu (Aarch64) on Ubuntu (x86–64) with QEMU](https://medium.com/@a24230928_45036/run-ubuntu-aarch64-on-ubuntu-x86-64-on-windows-10-with-qemu-7206eab0330c)
