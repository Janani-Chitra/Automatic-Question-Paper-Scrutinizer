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

questions = []

# with open('jsons/questions.json') as fp:
#     questions = json.load(fp)


def read(fname, ind=1):
    with open('datasets/%s' % fname, encoding="ISO-8859-1") as csv_file:
        csv_reader = csv.reader(csv_file, delimiter='\t')
        i = 0
        for row in csv_reader:
            if(i == 0):
                i = 1
                continue
            questions.append(row[ind])


read('questions/1.csv')
read('questions/2.csv')
read('questions/3.csv')
read('dataset.csv', ind=0)

tquestions = len(questions)

print('='*30)
print('Questions : %d' % tquestions)
print('='*30)

x, y = [], []
vocab = set()

for ind in range(0, tquestions):
    q = questions[ind].lower()
    words = re.findall('[a-z]+', q)
    # _words = [nltk.pos_tag(word)[0][1] for word in words]
    _words = [tag[1] for tag in TextBlob(q, pos_tagger=nltk_tagger).pos_tags]
    # print([q], words, _words)
    vocab.update(_words)
    text = ' '.join(_words)
    if text in x:
        continue
    x.append(text)
    y.append(1)
    print('\rQuestions POS tagging %0.2f%c done.(%d/%d)' %
          ((ind/tquestions)*100, '%', ind, tquestions), end='')

vocab = list(vocab)
print()
print('='*30)
print('Vocab : ', vocab)
print('Vocab count : %d' % len(vocab))
print('='*30)
for i in range(1, 4):
    print('Permuation pair(%d) started.' % i)
    perms = list(permutations(vocab, i))
    tperms = len(perms)
    for j in range(0, tperms):
        print('\rPair POS tagging %0.2f%c done.(%d/%d)' %
              ((j/tperms)*100, '%', j, tperms), end='')
        s = ' '.join(perms[j])
        if s in x:
            continue
        x.append(s)
        y.append(0)
    print()
    print('Permuation pair(%d) done.' % i)

print('='*30)
print('Total size : %d' % len(x))
print('='*30)

print('Writing dataset in json file...')
f = open('jsons/dataset(questions,others).json', 'w+')
json.dump([x, y], f)
f.close()
print('Finished.')
