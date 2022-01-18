if [ -d ${1} ]; then
    [ ! -d ./${1}/out ] && mkdir -p ./${1}/out
    cmake -S ./${1} -B ./${1}/out
    make -C ./${1}/out
    echo ">> Execute example"
    echo ""
    find ./${1} -name exec -exec {} \;
    echo ""
fi
