#!/bin/bash

# Create test files
cat <<EOF > test.txt
Permission is granted to copy,
    distribute and / or modify this document under the terms of the GNU Free
                            Documentation License,
    Version 1.3 or any later version published by the Free Software Foundation;
with no Invariant Sections, with no Front - Cover Texts,
    and with no Back - Cover Texts
                           .A copy of the license is included in the section
                               entitled “GNU Free Documentation License”.

                       Permission is granted to copy,
    distribute and / or modify this document under the terms of the GNU Free
                            Documentation License,
    Version 1.3 or any later version published by the Free Software Foundation;
with no Invariant Sections, with no Front - Cover Texts,
    and with no Back -
        Cover Texts
            .A copy of the license is included in the section entitled
   “GNU Free Documentation License”.a Permission is granted to copy,
    distribute and / or modify this document under the terms of the GNU Free
                            Documentation License,
    Version 1.3 or any later version published by the Free Software Foundation;
with no Invariant Sections, with no Front - Cover Texts,
    and with no Back - Cover Texts
                           .A copy of the license is included in the section
                               entitled “GNU Free Docu mentation License”.
1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 6 7 8 9 10 3 4 5 1 2 3 4 5 1 2 3 4 5 6 7 8 9 10 3 4 5 1 2 3 4 5 1 2 3 4 5 6 7 8 9 10 3 4 5 1 2 3 4 5 1 2 3 4 5 6 7 8 9 10 q w e r t y u s d f g h x c v b n m h g g g L
“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.“GNU Free Docu mentation License”.!!!!!
EOF

cat <<EOF > test2.txt
Hello, this is a test file for GREP testing.
This line contains the word: GREP

grep is case-sensitive by default. 
Another line with the word grep

Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.End of file GREP.The quick brown fox jumps over the lazy dog.END BIG LINE*#&

End of file GREP.

EOF

cat <<EOF > test3.txt
test
Test
tESt
another test line
123test123
no match here
TEST
Test test TEST
EOF

cat <<EOF > test4.txt
first test line
second line without match
TEST
testing 123
Another Test
final line
EOF

touch empty.txt


DIFF=""

TEST_FILE="test.txt"

TEST_FILE2="test.txt test2.txt"

TEST_FILE3="test.txt test2.txt test3.txt"

TEST_FILE4="test.txt test2.txt test3.txt test4.txt"

FLAGS=("-e" "-v" "-l" "-c" "-n" "-h" "-s" "-i")
FLAGS_WITHOUT_E=("-v" "-l" "-c" "-n" "-h" "-s" "-i")

COUNTER_SUCCESS=0

COUNTER_FAIL=0

i=1
j=11

run_test() {
    local test_command="$1"
    local test_description="$2"

    echo "\nRunning: $test_description"

    eval "./s21_grep $test_command" > s21_grep.txt
    eval "grep $test_command"     > grep.txt

    DIFF="$(diff --strip-trailing-cr grep.txt s21_grep.txt)"
    if [ -z "$DIFF" ]; then
        echo "RESULT:   SUCCESS"
        (( COUNTER_SUCCESS++ ))

    else
        echo "RESULT:   FAIL"
        (( COUNTER_FAIL++ ))
        echo $COUNTER_FAIL $test_description >> log.log

    fi
}

run_test ".A test.txt" "noflag .A test.txt"
run_test ""[0-9]" test2.txt" "noflag [0-9]] test2.txt"
run_test "test test3.txt" "noflag test test3.txt"
run_test "test test4.txt" "noflag test test4.txt"

for flag in "${FLAGS[@]}"; do
    run_test "$flag .A test.txt" "$flag .A test.txt"
    run_test "$flag [0-9] test2.txt" "$flag [0-9] test2.txt"
    run_test "$flag grep test2.txt" "$flag grep test2.txt"
    run_test "$flag test test3.txt" "$flag test test3.txt"
    run_test "$flag test test4.txt" "$flag test test4.txt"
done

for flag in "${FLAGS_WITHOUT_E[@]}"; do
    run_test "$flag -e .A test.txt" "$flag .A -e test.txt"
    run_test "$flag -e [0-9] test2.txt" "$flag -e [0-9] test2.txt"
    run_test "$flag -e grep. test2.txt" "$flag -e grep. test2.txt"
    run_test "$flag -e test test3.txt" "$flag -e test test3.txt"
    run_test "$flag -e test test4.txt" "$flag -e test test4.txt"
done

for flag in "${FLAGS_WITHOUT_E[@]}"; do
    run_test "-e .A $flag test.txt" "-e .A $flag test.txt"
    run_test "-e [0-9] $flag test2.txt" "-e test $flag test2.txt"
    run_test "-e grep. $flag test2.txt" "-e grep. $flag test2.txt"
    run_test "-e test $flag test3.txt" "-e test $flag test3.txt"
    run_test "-e test $flag test4.txt" "-e test $flag test4.txt"
done

for flag in "${FLAGS_WITHOUT_E[@]}"; do
    run_test "-e .A $flag empty.txt" "-e .A $flag empty.txt"
    run_test "-e [0-9] $flag empty.txt" "-e test $flag empty.txt"
    run_test "-e grep. $flag empty.txt" "-e grep. $flag empty.txt"
    run_test "-e test $flag empty.txt" "-e test $flag empty.txt"
    run_test "-e test $flag empty.txt" "-e test $flag empty.txt"
    run_test "-e '' $flag empty.txt" "-e '' $flag empty.txt"
done

for flag in "${FLAGS_WITHOUT_E[@]}"; do
    run_test "-e .A -e GNU $flag test.txt" "-e .a -e GNU $flag test.txt"
    run_test "-e [0-9] -e grep $flag test2.txt" "-e [0-9] -e grep $flag test2.txt"
    run_test "-e test -e 123 -e here $flag test3.txt" "-e test -e 123 $flag test3.txt"
    run_test "-e test -e final $flag test4.txt" "-e test -e final $flag test4.txt"
done

for flag in "${FLAGS_WITHOUT_E[@]}"; do
    run_test "-e .A test.txt" "noflag .A -e test.txt"
    run_test "-e [0-9] test2.txt" "noflag -e [0-9] test2.txt"
    run_test "-e grep. test2.txt" "noflag -e grep. test2.txt"
    run_test "-e test test3.txt" "noflag -e test test3.txt"
    run_test "-e test test4.txt" "noflag -e test test4.txt"
done

for flag in "${FLAGS_WITHOUT_E[@]}"; do
    run_test "-e .A -e GNU $flag $TEST_FILE4" "-e .a -e GNU $flag $TEST_FILE4"
    run_test "-e dog -e GNU $flag $TEST_FILE4" "-e dog -e GNU $flag $TEST_FILE4"
    run_test "-e [0-9] -e grep $flag $TEST_FILE4" "-e [0-9] -e grep $flag $TEST_FILE4"
    run_test "-e test -e 123 -e here $flag $TEST_FILE4" "-e test -e 123 $flag $TEST_FILE4"
    run_test "-e test -e final $flag $TEST_FILE4" "-e test -e final $flag $TEST_FILE4"
    run_test "$flag -e 123 -e hello -e 'line$' -e dog $TEST_FILE4" "$flag -e 123 -e hello -e 'line$' -e dog $TEST_FILE4"
    run_test "$flag -e here -e 123 -e hello -e 'line$' -e dog $TEST_FILE4" "$flag -e here -e 123 -e hello -e 'line$' -e dog $TEST_FILE4"
    run_test "$flag -e here -e 123 -e hello -e 'line$' -e dog -e ' ' $TEST_FILE4" "$flag -e here -e 123 -e hello -e 'line$' -e dog -e '' -e ' ' $TEST_FILE4"
done

echo "=== Additional tests ==="

run_test "-e '^test' test3.txt" "regex '^test' on test3.txt"
run_test "-n -e '^test' test3.txt" "combo -n with regex '^test'"
run_test "-e 't.st' test3.txt" "regex 't.st' single char wildcard"
run_test "-i -e 'T.st' test3.txt" "combo -i with regex 'T.st' case-insensitive"

run_test "-e test -e another test3.txt" "multiple -e patterns: test and another"
run_test "-e test -e 123 test3.txt" "multiple -e patterns: test and 123"

run_test "-e 'line$' test3.txt" "regex 'line$' lines ending with 'line'"
run_test "-n -e 'line$' test4.txt" "combo -n with 'line$' on test4.txt"
run_test "-e '^first' test4.txt" "regex '^first' lines starting with 'first'"

run_test "-e '' empty.txt" "empty regex on empty file"

run_test "-v '' test3.txt" "invert empty regex on test3.txt (no output)"

run_test "-s -e 'test3' missing.txt" "silent mode missing file"

run_test "-h -e 't' test3.txt test4.txt" "combo -h -e hide filename"

echo
 echo "TOTAL SUCCESS: $COUNTER_SUCCESS"
 echo "TOTAL FAIL: $COUNTER_FAIL"

rm -rf *.txt