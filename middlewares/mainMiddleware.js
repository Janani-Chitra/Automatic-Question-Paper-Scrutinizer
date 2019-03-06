module.exports.isLoggedIn = (req, res, next) => {
    if (!req.session.user) {
        res.redirect('/')
        return
    }
    next()
}
module.exports.save = (req, res, next) => {
    if (!req.body.unit || !req.body.title || !req.body.hour || !req.body.method || !req.body.content || !req.body.course) {
        res.json({ message: "Fill all fields of the form" });
        return;
    }
    console.log(req.body.course);
    var data = {
        topicUnits: req.body.unit,
        topicTitle: req.body.title,
        topicHour: req.body.hour,
        method: req.body.method,
        topicContent: req.body.content,
        Cid: req.body.course
    };
    req.data = data;
    next()
}
module.exports.insert2 = (req, res, next) => {
    console.log(req.body.marks.length)
    for(var i = i ; i < req.body.marks.length; i++ ){
        if (!req.body.marks[i] || !req.body.mode || !req.body.questions[i] || !req.body.course_outcome[i] || !req.body.BTlevel[i]) {
            res.json({ message: "Fill all fields in the question paper template" });
            return;
        }
    }
    if (!req.body.mode || !req.body.course_id) {
        res.json({ message: "Fill all fields in the question paper template" });
        return;
    }
    var data = {
        course_id: req.body.course_id,
        mode: req.body.mode,
        questions: JSON.stringify(req.body.questions),
        course_outcome: JSON.stringify(req.body.course_outcome),
        BTlevel: JSON.stringify(req.body.BTlevel),
        marks: JSON.stringify(req.body.marks)
    };
    req.data = data;
    next()
}
module.exports.viewChart = (req, res, next) => {
    if (!req.query.mode || !req.query.course_id) {
        res.json({ message: "Fill all fields in the question paper template" });
        return;
    }
    next()
}