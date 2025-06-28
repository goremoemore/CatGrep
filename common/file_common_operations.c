#include "file_common_operations.h"

#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int IsFileExists(char* filename) { return (1 + access(filename, F_OK)); }

int CheckFileNameIsDir(char* filename) {
  struct stat path;
  stat(filename, &path);

  return S_ISREG(path.st_mode) == 0;
}

void NullFilePtrChecker(FILE* file, char* filename) {
  if (file == NULL) {
    PrintErrorNullPtrFile(filename);
    exit(1);
  }
}

FILE* OpenFileToRead(char* filename) {
  FILE* file = fopen(filename, "r");

  NullFilePtrChecker(file, filename);

  return file;
}

void CloseFile(FILE* file) { fclose(file); }