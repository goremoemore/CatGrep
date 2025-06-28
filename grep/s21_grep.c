#include "finder_module.h"

int main(int argc, char* argv[]) {
  int current_flag = kNO_FLAG;
  char pattern[PATTERN_SIZE] = {0};
  int first_filename_pos = 2;

  ArgcValidation(argc, argv, &current_flag, &first_filename_pos, pattern);

  ValidateFileNamesAndOpen(argc, argv, current_flag, pattern,
                           first_filename_pos);

  return 0;
}