#!python
import sys
from typing import Dict, List, Tuple


def parse_line(fields: List[str]) -> Tuple[str, int, int]:
    return fields[0], int(fields[1]), int(fields[2])


class Word:
    word: str
    count: int
    word_len: int

    def __init__(self, word: str, count: int, word_len: int):
        self.word = word
        self.count = count
        self.word_len = word_len


word_counters: Dict[str, Word] = {}


for line in sys.stdin:
    word, count, word_len = parse_line(line.split(sep=","))

    if word in word_counters:
        word_counters[word].count += count
    else:
        word_counters[word] = Word(word, count, word_len)


for keyword, word in sorted(word_counters.items()):
    print(keyword, word.count, word.word_len)
