#ifndef SRC_GREP_ARG_CH_H
#define SRC_GREP_ARG_CH_H

#include "../common/print_errors.h"

#define MAX_OPTIONS 9
#define PATTERN_SIZE 4096

enum FlagInitialization {
  kILLEGAL_FLAG = -1,
  kNO_FLAG,
  ki,
  kv,
  kc,
  kl,
  kn,
  kh,
  ks,
  kf,
  ko
};

void ArgcValidation(int argc, char* argv[], int* current_flag,
                    int* first_filename_pos, char* pattern);

void FlagHandler(char* argvflag, int* current_flag);

#endif