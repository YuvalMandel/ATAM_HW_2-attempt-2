#! /bin/bash

insmod ../ili.ko
rm output result
touch output result
for (( i=1; i <=50; i++ ))
do
	if [ -e bad_inst_$i ]
	then
		./bad_inst_$i > output
		val=$?
		if [ $val != 132 ] #didn't exit on illegal instruction
		then
			echo $val >> output
		else
			echo "IMPORTANT (test ${i}): check that Illegal Instruction was printed to the terminal above this line (if it was, you passed)"
		fi
		diff -a output bad_inst_$i.out
		if [[ $? -eq 0 ]]
		then
			:
			# echo -e "test ${i}: pass"
		else
			echo "test ${i}: failed!!! - return value: "
			echo $val
		fi
	fi		
done
