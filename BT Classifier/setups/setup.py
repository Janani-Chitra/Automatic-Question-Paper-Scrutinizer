import csv
import json

x = []
y = []
with open('datasets/dataset.csv', encoding="utf8") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
        x.append(row[0])
        y.append(row[1])
f = open('jsons/dataset.json', 'w')
json.dump([x, y], f)
f.close()
