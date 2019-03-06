from nltk.corpus import wordnet
from itertools import combinations
import re
import enchant


def getWeight(x, y):
    return x[0].wup_similarity(y[0]) or 0


def getWeightAll(X, Y):
    wei = 0
    for x in X:
        a = x.name().split('.')
        for y in Y:
            b = y.name().split('.')
            if(a[1] != b[1] or a[2] != b[2]):
                continue
            cwei = x.wup_similarity(y) or 0
            print(x, y, wei)
            wei = max(wei, cwei)
    return wei


def similarity(sentences, sentence):
    words = re.findall('[a-z]+', sentence.lower())
    swords = [wordnet.synsets(word) for word in words]
    mwei = 0
    for _sentence in sentences:
        _words = re.findall('[a-z]+', _sentence.lower())
        count = 0
        twei = 0
        for _word in _words:
            _s = wordnet.synsets(_word)
            if not _s:
                continue
            for k, s in enumerate(swords):
                if not s:
                    continue
                wei = getWeight(_s, s)
                if(wei < 0.5):
                    continue
                twei += wei
                count += 1
        awei = twei/count
        mwei = max(mwei, awei)
        print([sentence], [_sentence], [awei])
    if(mwei > 0.5):
        return 1
    return 0


# similarity(['i am arun'], 'my name is arun')
# similarity(['introduction to  algorithmics','Time complexity of algorithm','sorting algorithms'], 'what is the worse case of quick sort')
