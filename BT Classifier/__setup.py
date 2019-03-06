import json
import re
from itertools import permutations
from nltk.tokenize import word_tokenize

with open('questions.json') as fp:
    questions = json.load(fp)[:10000]

print('Questions : %d' % len(questions))

x, y = questions, [1]*len(questions)

for ind in range(0, len(questions)):
    q = questions[ind]
    words = list(set(re.findall('[a-z]+', q)))
    for i in range(1, 3):
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
