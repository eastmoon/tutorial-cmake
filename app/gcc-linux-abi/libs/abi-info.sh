echo "> GCC version"
gcc -v
echo ""
echo "> Libstdc++.6 version"
apt-cache policy libstdc++6
echo ""
echo "> Strings in libstdc++"
strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX
