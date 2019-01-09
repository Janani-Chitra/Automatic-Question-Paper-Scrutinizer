var classify = (content) => {
    var preprocessed_words = preprocess(content)
    var categories_count = getCategoriesCount(preprocessed_words)
    var classified_categories = getClassifiedCategories(categories_count)
    var val = ''
    for (i = 0; i < classified_categories.length - 1; i++) {
        val += classified_categories[i] + ',';
    }
    if (classified_categories.length > 0) {
        val += classified_categories[classified_categories.length - 1];
    }
    return val;
}
var preprocess = (sentence) => {
    sentence = sentence.toLowerCase()
    words = sentence.match(/[a-z]+/g)
    stemmed_words = []
    words.forEach(word => {
        stemmed_words.push(stemmer(word))
    })
    // console.log(stemmed_words)
    return stemmed_words
}
var getCategoriesCount = (preprocessed_words) => {
    var categories_count = {}
    for (category in categories) {
        categories_count[category] = 0
        var words = categories[category]
        preprocessed_words.forEach(word => {
            if (find(word, words)) {
                categories_count[category] += 1
            }
        })
    }
    // console.log(categories_count)
    return categories_count
}
var getClassifiedCategories = (categories_count) => {
    var classified_categories = [], max_count = 0
    for (category in categories_count) {
        var count = categories_count[category]
        if (count > max_count) {
            classified_categories = [category]
            max_count = count
        } else if (count == max_count) {
            classified_categories.push(category)
        }
    }
    if (max_count == 0) classified_categories = {}
    // console.log(classified_categories)
    return classified_categories
}
var find = (word, list) => {
    for (i = 0; i < list.length; i++) {
        if (list[i] == word) return true
    }
    return false
}