#include "file_operations.h"

void ValidateFileNamesAndOpen(int argc, char* argv[], int current_flag,
                              int is_GNU_option) {
  char* filename;

  if (argc > 1) {
    for (int i = 1 + (current_flag > 0); i < argc; ++i) {
      filename = argv[i];

      if (IsFileExists(filename)) {
        if (!CheckFileNameIsDir(filename))
          PrintContentOfFile(filename, current_flag, is_GNU_option);
        else
          PrintFilenameIsDir(filename, argv[0]);
      } else
        PrintErrorNoSuchFile(filename, argv[0]);
    }
  } else
    while (1) {
      char echo[10];
      scanf("%s", echo);
      printf("%s\n", echo);
    }
}

void NoFlagPrintContentOfFile(FILE* file) {
  int size = 255;
  char str[size];

  while (fgets(str, size, file) != NULL) {
    printf("%s", str);
  };
}

void BFlagPrintContentOfFile(FILE* file) {
  int size = 255;
  char str[size];
  int i = 1;

  while (fgets(str, size, file) != NULL) {
    if (str[0] != '\n') {
      printf("%6d\t%s", i, str);
      ++i;
    }

    else
      printf("%s", str);
  };
}

void NFlagPrintContentOfFile(FILE* file) {
  int size = 255, count_line = 1;
  char str[size];

  while (fgets(str, size, file) != NULL) {
    printf("%6d\t%s", count_line, str);
    count_line++;
  };
}

void SFlagPrintContentOfFile(FILE* file) {
  int size = 255;
  char str[size];
  int prev_is_empty = 0;

  while (fgets(str, size, file) != NULL) {
    if (!prev_is_empty || str[0] != '\n') printf("%s", str);

    prev_is_empty = str[0] == '\n';
  };
}

void EFlagPrintContentOfFile(FILE* file, int is_GNU_option) {
  char ch;

  while ((ch = fgetc(file)) != EOF) {
    if (!is_GNU_option && (ch < 32 || ch == 127) && ch != 10 && ch != 9 &&
        ch != 11)
      printf("^%c", ch + 64);
    else if (ch == 10)
      printf("$\n");
    else
      printf("%c", ch);
  }
}

void TFlagPrintContentOfFile(FILE* file, int is_GNU_option) {
  char ch;

  while ((ch = fgetc(file)) != EOF) {
    if ((!is_GNU_option && (ch < 32 || ch == 127) && ch != 10) ||
        (is_GNU_option && (ch == 9 || ch == 11)))
      printf("^%c", ch + 64);
    else
      printf("%c", ch);
  }
}

void VFlagPrintContentOfFile(FILE* file) {
  char ch;

  while ((ch = fgetc(file)) != EOF) {
    if ((ch < 32 || ch == 127) && ch != 10 && ch != 9 && ch != 11)
      printf("^%c", ch + 64);
    else
      printf("%c", ch);
  }
}

void PrintContentOfFile(char* filename, int current_flag, int is_GNU_option) {
  FILE* pfile = OpenFileToRead(filename);

  switch (current_flag) {
    case kNO_FLAG:
      NoFlagPrintContentOfFile(pfile);
      break;

    case kb:
      BFlagPrintContentOfFile(pfile);
      break;

    case ke:
      EFlagPrintContentOfFile(pfile, is_GNU_option);
      break;

    case kn:
      NFlagPrintContentOfFile(pfile);
      break;

    case ks:
      SFlagPrintContentOfFile(pfile);
      break;

    case kt:
      TFlagPrintContentOfFile(pfile, is_GNU_option);
      break;

    case kv:
      VFlagPrintContentOfFile(pfile);
      break;
  }

  CloseFile(pfile);
}
