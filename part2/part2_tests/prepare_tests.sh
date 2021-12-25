if [ -e bad_inst_* ]
then
	rm bad_inst_*
fi
g++ tester.cpp -o tester
chmod +x tester
./tester
chmod +x AsmTo.sh
./AsmTo.sh
