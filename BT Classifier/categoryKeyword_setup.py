import json
from thesaurus import Word


def _read(filename):
    with open('./categories/%s' % (filename,), 'r') as fp:
        data = fp.read()
        words = [s.strip() for s in data.splitlines()]
        categories[filename] = set(words)
        for word in words:
            if word in ["what", "why", "analyse"]:
                continue
            w = Word(word)
            categories[filename].update(w.synonyms())
        categories[filename] = list(categories[filename])


categories, filenames = {}, ['knowledge','comprehension','application',
                             'analysis', 'evaluation', 'synthesis']
for filename in filenames:
    print('%s started.' % filename)
    _read(filename)
    print('%s done.' % filename)

with open('keywords.json', 'w+') as fp:
    fp.write(json.dumps(categories))
