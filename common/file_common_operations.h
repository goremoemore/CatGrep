#ifndef SRC_COMMON_FILE_COMMON_OP
#define SRC_COMMON_FILE_COMMON_OP

#include "print_errors.h"

void NullFilePtrChecker(FILE* file, char* filename);

int CheckFileNameIsDir(char* filename);

void CloseFile(FILE* file);

int IsFileExists(char* filename);

FILE* OpenFileToRead(char* filename);

#endif