#!/bin/bash

# Create test files
cat <<EOF > test.txt
Hello, this is a test file.
Checking the cat command on Mac.
EOF

cat <<EOF > test2.txt
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
Hello, this is a test file for GREP testing.
This line contains the word: GREP.
grep is case-sensitive by default.
Another line with the word grep.
Testing special characters: $ * . + ? ^ | ( )
Numbers are fun too: 12345.
Multiline testing is essential.
The quick brown fox jumps over the lazy dog.
End of file GREP.
EOF


DIFF=""

TEST_FILE="test.txt"

TEST_FILE2="test.txt test2.txt"

FLAGS=("-b" "-e" "-n" "-s" "-t")

COUNTER_SUCCESS=0

COUNTER_FAIL=0

run_test() {
    local test_command="$1"
    local test_description="$2"

    echo "\nRunning: $test_description"

    eval "./s21_cat $test_command" > s21_cat.txt
    eval "cat $test_command"     > cat.txt

    DIFF="$(diff --strip-trailing-cr cat.txt s21_cat.txt)"
    if [ -z "$DIFF" ]; then
        echo "RESULT:   SUCCESS"
        (( COUNTER_SUCCESS++ ))

    else
        echo "RESULT:   FAIL"
        (( COUNTER_FAIL++ ))

    fi
}

for flag in "${FLAGS[@]}"; do
    run_test "$flag $TEST_FILE" "$flag $TEST_FILE"
    run_test "$flag $TEST_FILE2" "$flag $TEST_FILE2"

done

echo
 echo "TOTAL SUCCESS: $COUNTER_SUCCESS"
 echo "TOTAL FAIL: $COUNTER_FAIL"

rm -rf *.txt 