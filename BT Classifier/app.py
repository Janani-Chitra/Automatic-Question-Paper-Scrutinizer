import cPickle as pickle
import csv
import json
from shutil import copyfile
from datetime import datetime
from flask import Flask, request
app = Flask(__name__)

with open('classify.pkl', 'rb') as fp:
    content = pickle.load(fp)
    model, vect = content[0], content[1]


@app.route('/', methods=['GET'])
def hello_world():
    text = request.args.get('q')
    if(not text):
        return ''
    return model.predict(vect.transform([text]))[0]


@app.route('/gene', methods=['POST'])
def gene():
    _from = '../public/Student_List/' + request.form['filename']
    _to = '../public/temp/'+str(datetime.now())+'.csv'
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
            row.append(row[0])
            all.append(row)
        with open(_to, 'r+') as f2:
            writer = csv.writer(f2, lineterminator='\n')
            writer.writerows(all)
    return _to


if __name__ == '__main__':
    app.run(debug=True)
