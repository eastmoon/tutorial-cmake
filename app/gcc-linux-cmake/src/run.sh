[ ! -d ./out ] && mkdir -p ./out
cmake -S . -B ./out
make -C ./out
echo ">> Execute example"
echo ""
./out/exec
echo ""
