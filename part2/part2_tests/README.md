Instructions:
1. Move the part2_tests folder to your "part2" directory (should be part2/part2_tests)
2. Add the following line to your compile.sh file under the existing "sudo cp..." line:
sudo cp -R part2_tests _fs/root/
3. To execute the tests, follow these instructions (starting from directory /part2):
cd part2_tests
chmod +x prepare_tests.sh # When running for first time
./prepare_tests.sh    # This should create a whole bunch of .asm, .out, and executable files
cd ..
./compile.sh   # As usual
./start.sh
# Inside QEMU #
cd part2_tests
./test.sh

4. Understanding your results: tests that pass print nothing.
The exception to this is tests that forward the handling to the original handler (should be only test 22). 
This test should print a line including the phrase "Illegal Instruction" to the terminal.
The test.sh script prints a heads up for this on the next line, so if you see the message "IMPORTANT ... "
but "Illegal Instruction" wasn't printed in the above line, your code doesn't work properly.




