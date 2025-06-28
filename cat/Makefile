CC=gcc
FL=-Wall -Werror -Wextra
MAIN_FILE=s21_cat.c
ADDONS=file_operations.c cat_arg_checker.c
COMMON_PATH=../common/
COMMON_ADDONS=$(COMMON_PATH)*.c

s21_cat:
	$(CC) $(FL) $(MAIN_FILE) $(ADDONS) $(COMMON_ADDONS) -o s21_cat

rebuild:
	rm -rf s21_cat
	make s21_cat

1:
	clang-format -i *.c $(COMMON_PATH)$(COMMON_ADDONS)
	clang-format -i *.h $(COMMON_PATH)$(COMMON_ADDONS)
	clang-format -i *.c
	clang-format -i *.h
	make rebuild
