var connection = require("../db").connection
module.exports.login = (req, res) => {
    var email = req.body.email, password = req.body.password
    connection.query("select * from staff where email = ? AND password = ?", [email, password], (err, row) => {
        if (err || !row || !row.length) {
            res.redirect('/')
        }
        else {
            req.session.user = row[0]
            res.redirect('/dashboard')
        }
    })
}
module.exports.logout = (req, res) => {
    req.session.user = null
    req.session.destroy((err) => {
        if (err) console.log(err)
    })
    res.redirect("/")
}
module.exports.fetch = (req, res) => {
    connection.query(`select * from course`, (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}
module.exports.fetchcon = (req, res) => {
    connection.query(`select * from course where cur_id =  ?` ,[req.params.cur], (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}
module.exports.insert1 = (req, res) => {
    var outcomes = req.body.outcomes
    console.log(outcomes);
    var query = 'insert into co_to_bt_mapping(course_id,CO_level,co,bt) values'
    var data = [], i = 0
    console.log(outcomes[i].cl);
    for (; i < outcomes.length - 1; i++) {
        var cl = "CO-" + outcomes[i].cl;
        query += '(?,?,?,?),'
        data = data.concat([req.body.course_id, cl, outcomes[i].co, outcomes[i].bt])
    }
    if (outcomes.length > 0) {
        var cl = "CO-" + outcomes[i].cl;
        query += '(?,?,?,?)'
        data = data.concat([req.body.course_id, cl, outcomes[i].co, outcomes[i].bt])
    }
    connection.query(query, data, (err, rows) => {
        console.log(err)
        var code = 200
        if (err) {
            code = 400
        }
        res.sendStatus(code)
    })
}
module.exports.fetch1 = (req, res) => {
    connection.query(`select * from co_to_bt_mapping where course_id = ?`, [req.body.course_id], (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}
module.exports.fetch2 = (req, res) => {
    connection.query(`select * from curriculum`, (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}