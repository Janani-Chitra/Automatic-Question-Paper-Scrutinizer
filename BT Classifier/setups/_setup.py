import csv
import json
import re

x = []
y = []
with open('datasets/dataset.csv', encoding="utf8") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
        x.append(' '.join(re.findall('[a-z]+', row[0].lower())))
        y.append(row[1].lower())
with open('other.txt') as fp:
    for l in fp:
        x.append(' '.join(re.findall('[a-z]+', l.lower())))
        y.append('other')
f = open('jsons/dataset(questions,others).json', 'w')
json.dump([x, y], f)
f.close()
