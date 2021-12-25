with open("students_code.S", 'r') as code:
    new_file = open("tests_idan/testing_.S", 'w')
    lines = code.readlines()
    for l in lines:
        if l[0:7] == ".global":
            new_file.write(".global	 cipher\n")
        elif l[0:10] == "keyMixing:":
            new_file.write("tatakae1:\n")
        elif l[0:17] == "byteSubstitution:":
            new_file.write("tatakae2:\n")
        elif l[0:10] == "shiftRows:":
            new_file.write("tatakae3:\n")
        else:
            new_file.write(l)
    new_file.close()