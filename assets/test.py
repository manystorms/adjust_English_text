import os
from time import sleep

result_filename = os.getenv("RESULT_FILENAME")
a = int(os.getenv("a"))
b = int(os.getenv("b"))
r = ""

if not result_filename:
    print("RESULT_FILENAME is not set")
    exit(1)

r = str(a+b)

with open(result_filename, "w") as f:
    f.write(r)
