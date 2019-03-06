from gingerit.gingerit import GingerIt
import csv
import json
from shutil import copyfile
from datetime import datetime
from similarity import similarity
from flask import Flask, request
from classifyUsingKeyword import *
import pickle
with open('classify_new.pkl', 'rb') as fp:
    content = pickle.load(fp)
    model, vect = content[0], content[1]

app = Flask(__name__)
parser = GingerIt()


@app.route('/', methods=['GET'])
def hello_world():
    text = request.args.get('q')
    if(not text):
        return 'other'
    label = model.predict(vect.transform([text]))[0]
    if label == 0:
        return "invalid question type"
    else:
        return getClassifiedCategories(getCategoryCount(text))


@app.route('/suggest', methods=['GET'])
def Suggestion():
    text = request.args.get('q')
    if(not text):
        return ''
    if(parser.parse(text)['corrections']):
        text = parser.parse(text)['result']
        return text


@app.route('/gene', methods=['POST'])
def gene():
    _from = '../public/Student_List/' + request.form['filename']
    _to = '../public/temp/temp.csv'
    copyfile(_from, _to)
    with open(_to, 'r+') as f:
        writer = csv.writer(f, lineterminator='\n')
        reader = csv.reader(f)
        all = []
        row = next(reader)
        questions = json.loads(request.form['questions'])
        for question in questions:
            row.append(question)
        all.append(row)
        for row in reader:
            all.append(row)
        with open(_to, 'r+') as f2:
            writer = csv.writer(f2, lineterminator='\n')
            writer.writerows(all)
    return _to


@app.route('/check', methods=['POST'])
def check():
    sentences, sentence = request.form['sentences'], request.form['sentence']
    return {code: similarity(sentences, sentence)}


if __name__ == '__main__':
    app.run(debug=True)
