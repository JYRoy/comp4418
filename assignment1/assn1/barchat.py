#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: JYRoooy
import matplotlib.pyplot as plt

if __name__ == '__main__':
    xdata = [0.1, 1.0, 3.0, 3.5, 4.0, 4.25, 4.5, 4.75, 5.0, 7.0, 9.86, 14.86, 20]
    print(len(xdata))
    ydata = [0, 0, 0, 0.004, 6.08, 102.248, 52.1, 13.416, 2.296, 0.2, 0, 0, 0]
    print(len(ydata))
    plt.plot(xdata, ydata, linestyle="-", color="b")
    plt.xlabel("C values")
    plt.ylabel("CPU time")
    plt.savefig("Bar Chat.jpg", bbox_inches="tight")
    plt.show()