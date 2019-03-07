from nltk.tag.hunpos import HunposTagger
import json
import re
import csv
from itertools import permutations
from nltk.tokenize import word_tokenize
import nltk
# from os.path import expanduser
# home = expanduser("~")
# _path_to_bin = home + '/hunpos-1.0-linux/hunpos-tag'
# _path_to_model = home + '/hunpos-1.0-linux/en_wsj.model'
# ht = HunposTagger(path_to_model=_path_to_model, path_to_bin=_path_to_bin)


with open('dataset.csv', encoding="utf8") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    questions = []
    for row in csv_reader:
        questions.append(row[0])

print('Questions : %d' % len(questions))

x, y = [], []
vocab = set()

for ind in range(0, len(questions)):
    q = questions[ind].lower()
    words = re.findall('[a-z]+', q)
    _words = [nltk.pos_tag(word)[0][1] for word in words]
    print([q], words, _words)
    vocab.update(_words)
    text = ' '.join(_words)
    if text in x:
        continue
    x.append(text)
    y.append(1)
    print('Question %d done.' % (ind+1))

vocab = list(vocab)
for i in range(1, 5):
    perms = list(permutations(vocab, i))
    for perm in perms:
        s = ' '.join(perm)
        if s in x:
            continue
        x.append(s)
        y.append(0)

print('Writing dataset in json file')
f = open('dataset(questions,others).json', 'w+')
json.dump([x, y], f)
f.close()
print('Finished')
