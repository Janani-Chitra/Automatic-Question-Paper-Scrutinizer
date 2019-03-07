from nltk.tag.hunpos import HunposTagger
import json
import re
import csv
from itertools import permutations
from nltk.tokenize import word_tokenize
import nltk
from textblob import TextBlob
from textblob.taggers import NLTKTagger
nltk_tagger = NLTKTagger()


with open('datasets/dataset.csv', encoding="utf8") as csv_file:
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
    # _words = [nltk.pos_tag(word)[0][1] for word in words]
    _words = [tag[1] for tag in TextBlob(q, pos_tagger=nltk_tagger).pos_tags]
    print([q], words, _words)
    vocab.update(_words)
    text = ' '.join(_words)
    if text in x:
        continue
    x.append(text)
    y.append(1)
    print('Question %d done.' % (ind+1))

vocab = list(vocab)
print('Vocab : ', vocab)
for i in range(1, 3):
    print('Permuation pair %d started.' % i)
    perms = list(permutations(vocab, i))
    print('Pairs count : %d' % len(perms))
    for perm in perms:
        s = ' '.join(perm)
        if s in x:
            continue
        x.append(s)
        y.append(0)
    print('Permuation pair %d done.' % i)

print('Writing dataset in json file')
f = open('jsons/dataset(questions,others).json', 'w+')
json.dump([x, y], f)
f.close()
print('Finished')
