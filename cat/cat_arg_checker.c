#include "cat_arg_checker.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_OPTIONS 6

void ArgcValidation(int argc, char* argv[], int* current_flag,
                    int* is_GNU_option) {
  if (argc > 1) {
    if (argv[1][0] == '-') FlagHandler(argv[1], current_flag, is_GNU_option);
  }
}

void FlagHandler(char* argvflag, int* current_flag, int* is_GNU_option) {
  *current_flag = kILLEGAL_FLAG;

  const char* options[MAX_OPTIONS] = {"-b", "-e", "-n", "-s", "-t", "-v"};

  const char* GNU_options[MAX_OPTIONS] = {"--number-nonblank", "-E", "--number",
                                          "--squeeze-blank",   "-T", "-v"};

  for (int i = 0; i < MAX_OPTIONS; ++i) {
    *is_GNU_option = !strcmp(argvflag, GNU_options[i]);

    if (!strcmp(argvflag, options[i]) || *is_GNU_option) {
      *current_flag = i + 1;
      break;
    }
  }

  if (*current_flag == kILLEGAL_FLAG) {
    PrintErrorIllegalFlag(
        "s21_cat: illegal option %s\nusage: cat [-b -e -n -s -t -v] [file "
        "...]\n\n",
        argvflag);
    exit(1);
  }
}