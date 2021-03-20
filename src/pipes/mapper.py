#!python
import sys


for line in sys.stdin:

    for word in line.split():
        word = word.lower().replace(",", "")
        word_len = len(word)
        print(word, 1, word_len, sep=",")
