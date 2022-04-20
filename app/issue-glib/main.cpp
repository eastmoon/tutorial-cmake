#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <gnu/libc-version.h>

//__asm__(".symver realpath, realpath@GLIBC_2.2.5");

int main(int argc, char *argv[]) {
	char* unresolved = "/lib64";
  char  resolved[PATH_MAX+1];

  if(!realpath(unresolved, resolved))
	{ return 1; }

  printf("%s\n", resolved);
  printf("GNU libc version: %s\n", gnu_get_libc_version());
  exit(EXIT_SUCCESS);
}
