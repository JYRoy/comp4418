#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: z5304897 Junyu Zhang
import random

'''
I am going to generate 13 cnf files automatically for this question.
So you just need to run this program one time and input the parameters by following relative hints.
'''

if __name__ == '__main__':
    # generate 13 files for test
    for count in range(0,13):
        # create a cnf file
        filename = "file" + str(count) + ".cnf"
        fo = open(filename, "w")

        print("Start {}: The current file is {} !!!!!!!!".format(count, filename))
        # input the number of propositional variables and clauses
        variables = input("The number of propositional variables:")
        clauses = input("The number of clauses:")

        # write the first two line into the current file
        fo.write("c example CNF file with {} propositional variables and {} clauses\n".format(variables, clauses))
        fo.write("p cnf {} {}\n".format(variables, clauses))
        variables = int(variables)

        # generate variables and clauses randomly
        for i in range(int(clauses)):
            clause = ""
            for j in range(3):
                temp_int = random.randint(-variables, variables)
                while(temp_int == 0):
                    temp_int = random.randint(-variables, variables)
                if str(temp_int) and str(-temp_int) not in clause:
                    clause += str(temp_int) + " "
            clause += "0\n"
            fo.write(clause)

        fo.close()

        print("Finish {}: The {} file is generated !!!!!!!!".format(count, filename))
