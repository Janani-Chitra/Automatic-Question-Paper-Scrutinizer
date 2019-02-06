import cPickle as pickle
with open('classify.pkl', 'rb') as fp:
    content = pickle.load(fp)
    model, vect = content[0], content[1]

text = 'how are you?'
category = model.predict(vect.transform([text]))[0]
print(category)
