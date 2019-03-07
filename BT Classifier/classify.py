import json
import pickle as pickle
from datetime import datetime
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import MultinomialNB

print('Dataset loading started at-', str(datetime.now()))
with open('dataset(questions,others).json', 'r') as fp:
    dataset = json.loads(fp.read())
print('Dataset loading finished at-', str(datetime.now()))
print('')

x, y = dataset[0], dataset[1]

X_train, X_test, y_train, y_test = train_test_split(
    x, y, test_size=0.1)

print('Train size : %d' % len(y_train))
print('Test size : %d' % len(y_test))

print('Dataset Vectorize started at-', str(datetime.now()))
vect = TfidfVectorizer()
X_train = vect.fit_transform(X_train)
print('Dataset Vectorize finished at-', str(datetime.now()))
print('')

model = DecisionTreeClassifier()

print('Training started at-', str(datetime.now()))
model.fit(X_train, y_train)
print('Training finished at-', str(datetime.now()))
print('')

with open('classify_new.pkl', 'w+b') as fp:
    pickle.dump([model, vect], fp)

print('Testing started at-', str(datetime.now()))
prediction = model.predict(vect.transform(X_test))
print('Testing finished at-', str(datetime.now()))
print('')

acc = accuracy_score(y_test, prediction)
print("Accuracy: %f%s" % (acc*100, '%'))
print('')
