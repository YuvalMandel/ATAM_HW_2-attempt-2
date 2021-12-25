gcc test_KM.c aux_tests.c aux_code.o students_code.S -o test_KM.out
if [ -f "test_KM.out" ]; then
	timeout 20s ./test_KM.out < test_KM_1 > KM_out
	if [ $? -eq 0 ]; then
		diff KM_out test_KM_1_res
		if [ $? -eq 0 ]; then
			echo -e "1: PASS!"
		fi
	fi
fi

gcc test_BS.c aux_tests.c aux_code.o students_code.S -o test_BS.out
if [ -f "test_BS.out" ]; then
	timeout 20s ./test_BS.out < test_BS_1 > BS_out
	if [ $? -eq 0 ]; then
		diff BS_out test_BS_1_res
		if [ $? -eq 0 ]; then
			echo -e "2: PASS!"
		fi
	fi
fi

gcc test_SR.c aux_tests.c aux_code.o students_code.S -o test_SR.out
if [ -f "test_SR.out" ]; then
	timeout 20s ./test_SR.out < test_SR_1 > SR_out
	if [ $? -eq 0 ]; then
		diff SR_out test_SR_1_res
		if [ $? -eq 0 ]; then
			echo -e "3: PASS!"
		fi
	fi
fi
 
gcc test_cipher.c aux_tests.c aux_code.o students_code.S -o test_cipher.out
if [ -f "test_cipher.out" ]; then
	timeout 20s ./test_cipher.out < test_cipher_1 > cipher_out
	if [ $? -eq 0 ]; then
		diff cipher_out test_cipher_1_res
		if [ $? -eq 0 ]; then
			echo -e "4: PASS!"
		fi
	fi
	timeout 20s ./test_cipher.out < test_cipher_2 > cipher_out
	if [ $? -eq 0 ]; then
		diff cipher_out test_cipher_2_res
		if [ $? -eq 0 ]; then
			echo -e "5: PASS!"
		fi
	fi
	sleep .1
	echo -n "Leaving Segel Tests"
	sleep .5
	echo -n "."
	sleep .5
	echo -n "."
	sleep .5
	echo "."
	echo -n "Entering The Dark Side"
	sleep .5
	echo -n "."
	sleep .5
	echo -n "."
	sleep .5
	echo "."
	echo -n "Downloading Your Credit Card Info"
	sleep .5
	echo -n "."
	sleep .5
	echo -n "."
	sleep .5
	echo "."
	echo -n "Starting Tests"
	sleep .5
	echo -n "."
	sleep .5
	echo -n "."
	sleep .5
	echo "."
	sleep .5
	declare -i mais=1
	declare -i idan=0
	if [ $? -eq 0 ]; then
		while ((mais <= 99)); do
			timeout 20s ./test_cipher.out < tests_idan/test_c_${mais} > tests_idan/output/c_out_${mais}
			if [ $? -eq 0 ]; then
				diff tests_idan/output/c_out_${mais} tests_idan/expected/c_out_${mais}
				if [ $? -eq 0 ]; then
				let idan++
				echo -e "Test #"${mais}": Not bad..."
				fi
			fi
			let mais++
		done
		let mais--
		echo -e "Passed "${idan}" out of "${mais}" tests!"
	fi
fi
