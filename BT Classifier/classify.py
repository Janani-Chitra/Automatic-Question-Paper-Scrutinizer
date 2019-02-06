import json
import cPickle as pickle
from datetime import datetime

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

print 'Dataset loading started at-', str(datetime.now())
with open('dataset.json', 'r') as fp:
    dataset = json.loads(fp.read())
print 'Dataset loading finished at-', str(datetime.now())
print ''

x, y = dataset[0], dataset[1]

print 'Dataset Vectorize started at-', str(datetime.now())
vect = TfidfVectorizer()
X = vect.fit_transform(x)
print 'Dataset Vectorize finished at-', str(datetime.now())
print ''

model = DecisionTreeClassifier()

print 'Training started at-', str(datetime.now())
model.fit(X, y)
print 'Training finished at-', str(datetime.now())
print ''

with open('classify.pkl', 'w+b') as fp:
    pickle.dump([model, vect], fp)

print 'Testing started at-', str(datetime.now())
prediction = model.predict(vect.transform(x))
print 'Testing finished at-', str(datetime.now())
print ''

acc = accuracy_score(y, prediction)
print"Accuracy: %f%s" % (acc*100, '%')
print ''