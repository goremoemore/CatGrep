#ifndef SRC_CAT_ARG_CH_H
#define SRC_CAT_ARG_CH_H

#include "../common/print_errors.h"

enum FlagInitialization {
  kILLEGAL_FLAG = -1,
  kNO_FLAG,
  kb,
  ke,
  kn,
  ks,
  kt,
  kv
};

void ArgcValidation(int argc, char* argv[], int* current_flag,
                    int* is_GNU_option);

void FlagHandler(char* argvflag, int* current_flag, int* is_GNU_option);

#endif