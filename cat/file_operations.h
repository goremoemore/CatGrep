#ifndef SRC_CAT_FILE_OP_H
#define SRC_CAT_FILE_OP_H

#include "../common/file_common_operations.h"
#include "cat_arg_checker.h"

void ValidateFileNamesAndOpen(int argc, char* argv[], int current_flag,
                              int is_GNU_option);

void PrintContentOfFile(char* filename, int current_flag, int is_GNU_option);

void NoFlagPrintContentOfFile(FILE* file);
void BFlagPrintContentOfFile(FILE* file);
void EFlagPrintContentOfFile(FILE* file, int is_GNU_option);
void NFlagPrintContentOfFile(FILE* file);
void SFlagPrintContentOfFile(FILE* file);
void TFlagPrintContentOfFile(FILE* file, int is_GNU_option);
void VFlagPrintContentOfFile(FILE* file);

#endif