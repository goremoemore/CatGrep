#include "print_errors.h"

void PrintErrorNoSuchFile(char* filename, char* utility_name) {
  printf("%s: %s: No such file or directory\n", utility_name, filename);
}

void PrintFilenameIsDir(char* filename, char* utility_name) {
  printf("%s: \"%s\" is a directory\n", utility_name, filename);
}

void PrintErrorNullPtrFile(char* filename) {
  printf("The file \"%s\" is not opened. The program was finished\n", filename);
}

void PrintErrorIllegalFlag(char* text, char* option) {
  printf(text, option);
  printf("*** Multiple options are not supported ***");
}