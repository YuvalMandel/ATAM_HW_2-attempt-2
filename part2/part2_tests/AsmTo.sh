#!/bin/bash
for (( i=1; i <=50 ; i++ ))
do
	if [ -e bad_inst_$i.asm ]
	then
		as -g bad_inst_$i.asm -o bad_inst_$i.o
		ld bad_inst_$i.o -o bad_inst_$i
	fi
done
rm *.o
