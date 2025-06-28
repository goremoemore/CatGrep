#ifndef SRC_GREP_FINDER
#define SRC_GREP_FINDER

#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#include "../common/print_errors.h"
#include "grep_arg_checker.h"

void ValidateFileNamesAndOpen(int argc, char* argv[], int current_flag,
                              char* pattern, int first_filename_pos);

void ShowResults(char* filename, int current_flag, char* pattern,
                 int multiple_files);

void PrintContentByOption(char* str, char* filename, int matched_line,
                          int matched_lines_counter, int current_flag,
                          int multiple_files);

#endif