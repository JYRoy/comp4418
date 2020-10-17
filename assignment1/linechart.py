#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: z5304897
import matplotlib.pyplot as plt

if __name__ == '__main__':
    xdata = [100/997, 100/99, 900/300, 1050/300, 1200/300, 1275/300, 1320/300, 1350/300, 1380/300, 1425/300, 1500/300, 2100/300, 3000/300, 1500/100, 2000/100]
    print(len(xdata))
    ydata = [0, 0, 0.004, 0.976, 1.064, 7.192, 56.484, 13.408, 8.636, 9.84, 3.508, 0.1, 0.032, 0.004, 0]
    print(len(ydata))

    plt.plot(xdata, ydata, linestyle="-", color="b")
    plt.xlabel("C values")
    plt.ylabel("CPU time")

    plt.savefig("Line Chart.jpg", bbox_inches="tight")

    plt.show()