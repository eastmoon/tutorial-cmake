docker run -ti --rm -v %cd%\out:/app debian:buster-slim bash -l -c "cp /app/lib/* /usr/local/lib && ldconfig && ldd /app/bin/exec && ./app/bin/exec"
