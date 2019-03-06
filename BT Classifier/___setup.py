import json
import re
import csv
from itertools import permutations
from nltk.tokenize import word_tokenize
import nltk

with open('dataset.csv', encoding="utf8") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    questions = []
    for row in csv_reader:
        questions.append(row[0])

print('Questions : %d' % len(questions))

x, y = questions, [1]*len(questions)

for ind in range(0, len(questions)):
    q = questions[ind]
    words = [
       nltk.pos_tag for word in re.findall('[a-z]+', q)]
    for i in range(1, 2):
        perms = list(permutations(words, i))
        for perm in perms:
            s = ' '.join(perm)
            x.append(s)
            y.append(0)
    print('Question %d done.' % ind)

print('Writing dataset in json file')
f = open('dataset(questions,others).json', 'w+')
json.dump([x, y], f)
f.close()
print('Finished')
