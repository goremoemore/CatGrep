#ifndef SRC_CAT_ERRORS_H
#define SRC_CAT_ERRORS_H

#include <stdio.h>

void PrintErrorNoSuchFile(char* filename, char* utility_name);
void PrintFilenameIsDir(char* filename, char* utility_name);
void PrintErrorNullPtrFile(char* filename);
void PrintErrorIllegalFlag(char* text, char* option);
#endif