#include "finder_module.h"

#include <regex.h>

#include "../common/file_common_operations.h"

ssize_t s21getline(char** line, size_t* len, FILE* file) {
  size_t pos = 0;
  ssize_t return_value = 0;
  int c;

  if (*line == NULL || *len == 0) {
    *len = 128;
    *line = malloc(*len);
    if (*line == NULL) {
      return_value = -1;
    }
  }

  while ((return_value > -1) && (c = fgetc(file)) != EOF) {
    if (pos + 1 >= *len) {
      size_t new_len = *len * 2;
      char* new_ptr = realloc(*line, new_len);
      if (new_ptr == NULL) {
        return_value = -1;
      }
      *line = new_ptr;
      *len = new_len;
    }

    (*line)[pos++] = (char)c;

    if (c == '\n') {
      return_value = -2;
    }
  }

  if (pos == 0 && c == EOF) {
    return_value = -1;
  }

  (*line)[pos] = '\0';

  if (return_value != -1) return_value = pos;

  return return_value;
}

void ValidateFileNamesAndOpen(int argc, char* argv[], int current_flag,
                              char* pattern, int first_filename_pos) {
  char* filename;

  int multiple_files = (argc - first_filename_pos) > 1;

  if (argc > 2) {
    for (int i = first_filename_pos; i < argc; ++i) {
      filename = argv[i];

      if (IsFileExists(filename)) {
        if (!CheckFileNameIsDir(filename)) {
          ShowResults(filename, current_flag, pattern, multiple_files);

        } else if (current_flag != ks)
          PrintFilenameIsDir(filename, argv[0]);
      } else if (current_flag != ks)
        PrintErrorNoSuchFile(filename, argv[0]);
    }
  } else
    while (1) {
      char echo[10];
      scanf("%s", echo);
    }
}

void ShowResults(char* filename, int current_flag, char* pattern,
                 int multiple_files) {
  FILE* pfile = OpenFileToRead(filename);

  char* line = NULL;
  size_t len = 0;
  ssize_t read;

  int matched_lines_counter = 0;
  int current_line = 1;
  int inverted = current_flag == kv;

  regex_t reegex;

  int value;

  value = regcomp(
      &reegex, pattern,
      REG_EXTENDED | ((current_flag == ki) ? REG_ICASE : 0) | REG_NEWLINE);

  if (value) {
    printf("Regex compile error");
    exit(1);
  };

  while ((read = s21getline(&line, &len, pfile)) != -1) {
    value = regexec(&reegex, line, 0, NULL, 0);

    if (!(value + inverted) || (value && inverted)) {
      matched_lines_counter += 1;

      if (current_flag != kc)
        PrintContentByOption(line, filename, current_line,
                             matched_lines_counter,

                             current_flag, multiple_files);
      if (current_flag == kl) break;
    }
    current_line += 1;
  };

  if (current_flag == kc)
    PrintContentByOption(line, filename, current_line, matched_lines_counter,
                         current_flag, multiple_files);

  regfree(&reegex);
  free(line);

  CloseFile(pfile);
}

void PrintContentByOption(char* str, char* filename, int matched_line,
                          int matched_lines_counter, int current_flag,
                          int multiple_files) {
  char* delim = ":";

  if ((!multiple_files && current_flag != kl) || (current_flag == kh)) {
    filename = "";
    delim = "";
  }

  switch (current_flag) {
    case kc:
      printf("%s%s%d\n", filename, delim, matched_lines_counter);
      break;

    case kl:
      printf("%s\n", filename);
      break;

    case kn:
      printf("%s%s%d:%s", filename, delim, matched_line, str);
      break;

    default:
      printf("%s%s%s", filename, delim, str);
      break;
  }
}
