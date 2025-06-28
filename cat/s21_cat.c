#include "file_operations.h"

int main(int argc, char* argv[]) {
  int current_flag = kNO_FLAG, is_GNU_option;

  ArgcValidation(argc, argv, &current_flag, &is_GNU_option);

  ValidateFileNamesAndOpen(argc, argv, current_flag, is_GNU_option);

  return 0;
}