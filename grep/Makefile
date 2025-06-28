CC=gcc
FL=-Wall -Werror -Wextra
MAIN_FILE=s21_grep.c
ADDONS= grep_arg_checker.c finder_module.c
COMMON_PATH=../common/
COMMON_ADDONS=$(COMMON_PATH)*.c

s21_grep:
	$(CC) $(FL) $(MAIN_FILE) $(ADDONS) $(COMMON_ADDONS) -o s21_grep

rebuild:
	rm -rf s21_grep
	make s21_grep

1:
	clang-format -i *.c $(COMMON_PATH)$(COMMON_ADDONS)
	clang-format -i *.h $(COMMON_PATH)$(COMMON_ADDONS)
	clang-format -i *.c
	clang-format -i *.h
	make rebuild