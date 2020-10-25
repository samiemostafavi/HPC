import numpy as np
import sys

filename = sys.argv[1]
xnumbers = []
ynumbers = []

i=0
with open(filename, 'r') as file:
    for line in file:
        lineNumbers = line.split(' ')
        for idx,number in enumerate(lineNumbers):
            try:
                float(number)
            except ValueError:
                continue
            if i % 2 == 0:
                xnumbers.append(float(number))
            else:
                ynumbers.append(float(number))
            i=i+1

size = np.array(xnumbers)
time = np.array(ynumbers)

m, s = np.polyfit(size, time, 1)
r = 1/m

print("slope (r): " + str(r/1E9))
print("constant (s): " + str(s/1E-6))
