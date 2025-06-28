#include "grep_arg_checker.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void ArgcValidation(int argc, char* argv[], int* current_flag,
                    int* first_filename_pos, char* pattern) {
  if (argc > 2) {
    int pattern_is_empty = 0;
    int first_E_pos = 0;

    for (int i = 1; i < argc; ++i) {
      if (!strcmp(argv[i], "-e")) {
        first_E_pos = i;
        break;
      }
    }

    for (int i = 1; i < argc; ++i) {
      if (!strcmp(argv[i], "-e")) {
        strncat(pattern, argv[i + 1], PATTERN_SIZE - strlen(pattern) - 1);
        strncat(pattern, "|", PATTERN_SIZE - strlen(pattern) - 1);
        *first_filename_pos = i + 2;
        ++i;
      } else if (argv[i][0] == '-') {
        size_t pattern_len = strlen(pattern);
        *first_filename_pos = i + 1 + (pattern_len == 0);

        if (pattern_len == 0 && i > first_E_pos) {
          strncat(pattern, argv[i + 1], PATTERN_SIZE - pattern_len - 1);
          pattern_is_empty = strlen(pattern) == 0;
        }

        FlagHandler(argv[i], current_flag);
      }
    }

    size_t len = strlen(pattern);
    if (len > 0 && pattern[len - 1] == '|') pattern[len - 1] = '\0';

    if (len == 0 && !pattern_is_empty)
      strncat(pattern, argv[1], PATTERN_SIZE - len - 1);

    if (strlen(pattern) == 0) {  // empty pattern
      if (*current_flag == kc) printf("0\n");
      exit(0);
    }
  }
}

void FlagHandler(char* argvflag, int* current_flag) {
  *current_flag = kILLEGAL_FLAG;

  const char* options[MAX_OPTIONS] = {"-i", "-v", "-c", "-l", "-n",
                                      "-h", "-s", "-f", "-o"};

  for (int i = 0; i < MAX_OPTIONS; ++i) {
    if (!strcmp(argvflag, options[i])) {
      *current_flag = i + 1;
      break;
    }
  }

  if (*current_flag == kILLEGAL_FLAG) {
    PrintErrorIllegalFlag(
        "s21_grep: illegal option %s\nusage: grep [-e -i -v -c -l -n -h -s] "
        "[pattern] [file "
        "...]\n\n",
        argvflag);
    exit(1);
  }
}