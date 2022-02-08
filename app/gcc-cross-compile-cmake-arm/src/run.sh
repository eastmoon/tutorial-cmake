[ ! -d ./out ] && mkdir -p ./out
cmake -DBUILDSWIG=NO -DBUILDSWIGNODE=NO -DBUILDSWIGPYTHON=NO -DCMAKE_TOOLCHAIN_FILE=/arch-arm64.cmake -S . -B ./out
make -C ./out
echo ">> Execute example"
echo ""
./out/exec
echo ""
