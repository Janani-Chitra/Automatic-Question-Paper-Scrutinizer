import csv
import json
import re

with open('train-v2.0.json') as fp:
    dataset = json.load(fp)

x = []
for data in dataset['data']:
    for para in data['paragraphs']:
        for qas in para['qas']:
            x.append(qas['question'])

f = open('questions.json', 'w')
json.dump(x, f)
f.close()
