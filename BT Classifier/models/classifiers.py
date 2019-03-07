import json

from sklearn.ensemble import (AdaBoostClassifier, GradientBoostingClassifier,
                              RandomForestClassifier)
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics import accuracy_score, log_loss
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import MultinomialNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC, LinearSVC, NuSVC
from sklearn.tree import DecisionTreeClassifier

with open('jsons/dataset(questions,others).json', 'r') as fp:
    dataset = json.loads(fp.read())
x, y = dataset[0], dataset[1]

X_train, X_test, y_train, y_test = train_test_split(
    x, y, test_size=0.1)

vect = TfidfVectorizer(stop_words='english', min_df=2)
X_train = vect.fit_transform(X_train)

classifiers = [
    LinearSVC(),
    DecisionTreeClassifier(),
    RandomForestClassifier(),
    MultinomialNB(),
    GradientBoostingClassifier(),
    KNeighborsClassifier(),
    SVC(),
    NuSVC(),
    AdaBoostClassifier(),
]

log_cols = ["Classifier", "Accuracy", "Log Loss"]

for clf in classifiers:
    try:
        clf.fit(X_train, y_train)
    except:
        continue
    name = clf.__class__.__name__

    print("="*30)
    print(name)

    print('****Results****')
    train_predictions = clf.predict(vect.transform(X_test))
    acc = accuracy_score(y_test, train_predictions)
    print("Accuracy: {:.4%}".format(acc))


print("="*30)
# exit()
