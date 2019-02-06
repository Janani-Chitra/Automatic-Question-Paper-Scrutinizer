var connection = require("../db").connection
module.exports.login = (req, res) => {
    if (req.body.key != 'admin@2019') {
        res.redirect('/admin')
        return
    }
    req.session.admin = true
    res.redirect('/admin/dashboard')
}
module.exports.fetch = (req, res) => {
    connection.query(`select * from ${req.params.table}`, (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}

module.exports.insert1 = (req, res) => {
    var query = `insert into staff(staff_id,name,email,password) values(?,?,?,?) on duplicate key update staff_id=?,name=?,email=?,password=?`
    var data = [req.body.staff_id, req.body.name, req.body.email, req.body.password]
    connection.query(query, data.concat(data), (err, rows) => {
        console.log(err)
        var code = 200
        if (err) {
            code = 400
        }
        res.sendStatus(code)
    })
}
module.exports.insert2 = (req, res) => {
    var query = `insert into course(course_id,name,credits,min_pass_mark,co_owner,internals,externals,tot_no_periods,semester,cur_id) values(?,?,?,?,?,?,?,?,?,?) `
    var data = [
        req.body.course_id,
        req.body.name,
        req.body.credit,
        req.body.MinPassMark,
        req.body.co_owner,
        req.body.internal,
        req.body.external,
        req.body.periods,
        req.body.sem,
        req.body.cur
    ]
    connection.query(query, data.concat(data), (err, rows) => {
        var code = 200
        if (err) {
            code = 400
        }
        res.sendStatus(code)
    })
}
module.exports.insert3 = (req, res) => {
    var query = `insert into course_to_staff_mapping(staff_id,course_id) values(?,?) on duplicate key update staff_id=?,course_id=?`
    var data = [req.body.staff_id, req.body.course_id]
    connection.query(query, data.concat(data), (err, rows) => {
        var code = 200
        if (err) {
            console.log(err)
            code = 400
        }
        res.sendStatus(code)
    })
}
