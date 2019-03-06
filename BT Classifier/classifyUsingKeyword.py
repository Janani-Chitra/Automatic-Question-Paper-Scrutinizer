import json
import re

with open('keywords.json', 'r') as fp:
    categories = json.loads(fp.read())


def preprocess(sentence):
    sentence = sentence.lower()
    words = re.findall(r'[a-z]+', sentence)
    print(words)
    return words


def getCategoryCount(question):
    processed_words = preprocess(question)
    category_count = {}
    for category, words in categories.items():
        for word in words:
            if word in processed_words:
                category_count[category] = category_count.get(category, 0)+1
    print(category_count)
    return category_count


def getClassifiedCategories(category_count):
    categories, max_count = [], 0
    for category, count in category_count.items():
        if max_count < count:
            categories = [category]
            max_count = count
        elif max_count == count:
            categories.append(category)
    print(categories)
    return categories


# question = raw_input()
# category_count = getCategoryCount(question)
# print getClassifiedCategories(category_count)
