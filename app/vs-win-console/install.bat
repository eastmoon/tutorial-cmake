@rem create library directory
mkdir libs

@rem download source code
@rem boost, ref : https://www.boost.org/users/history/version_1_69_0.html
@rem boost for windows, ref : https://www.boost.org/doc/libs/1_69_0/more/getting_started/windows.html
curl --insecure --location -o libs/boost.zip https://boostorg.jfrog.io/artifactory/main/release/1.69.0/source/boost_1_69_0.zip
powershell -nologo -noprofile -command "Expand-Archive -Path .\boost.zip -DestinationPath ."
