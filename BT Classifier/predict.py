import nltk
import re
import pickle
# from nltk.tag.hunpos import HunposTagger
# _path_to_bin ='./hunpos-1.0-win/hunpos-tag'
# _path_to_model ='./hunpos-1.0-win/en_wsj.model'
# ht = HunposTagger(path_to_model=_path_to_model, path_to_bin=_path_to_bin)

with open('classify_new.pkl', 'rb') as fp:
    content = pickle.load(fp)
    model, vect = content[0], content[1]


def predict(text):
    print(text)
    text = ' '.join([nltk.pos_tag(word)[0][1]
                     for word in re.findall('[a-z]+', text.lower())])
    print(text)
    X = vect.transform([text])
    Y = model.predict(X)
    return Y[0]
