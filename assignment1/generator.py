#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: z5304897 Junyu Zhang
import random
from random import choice


'''
I am going to generate 13 cnf files automatically for this question.
So you just need to run this program one time and input the parameters by following relative hints.
'''

if __name__ == '__main__':
    # generate 13 files for test
    for count in range(100,130):
        # create a cnf file
        filename = "file" + str(count) + ".cnf"
        fo = open(filename, "w")

        print("Start %d: The current file is %s !!!!!!!!" %(count, filename))
        # input the number of propositional variables and clauses
        variables = input("The number of propositional variables:")
        clauses = input("The number of clauses:")

        # write the first two line into the current file
        fo.write("c example CNF file with %s propositional variables and %s clauses\n" %(variables, clauses))
        fo.write("p cnf %s %s\n" %(variables, clauses))
        variables = int(variables)

        # generate variables and clauses randomly
        for i in range(int(clauses)):
            clause = ""
            for j in range(3):
                temp_int = choice([k for k in range(-variables, variables) if k != 0])
                if str(temp_int) and str(-temp_int) not in clause:
                    clause += str(temp_int) + " "
                else:
                    temp_int = choice([k for k in range(-variables, variables) if k != [0, temp_int]])
                    clause += str(temp_int) + " "

            clause += "0\n"
            fo.write(clause)

        fo.close()

        print("Finish %d: The %s file is generated !!!!!!!!" %(count, filename))
