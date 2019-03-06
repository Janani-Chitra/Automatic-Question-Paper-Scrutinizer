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
    var staff = req.session.user.staff_id;
    connection.query(`select * from course c inner join course_to_staff_mapping cs on c.course_id  = cs.course_id where cs.staff_id = ? `, [staff], (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}
module.exports.fetchcon = (req, res) => {
    var staff = req.session.user.staff_id;
    connection.query(`select * from course c inner join course_to_staff_mapping cs on c.course_id  = cs.course_id where cs.staff_id = ? and c.cur_id = ?`, [staff, req.params.cur], (err, rows) => {
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
module.exports.fetchManage = (req, res) => {
    connection.query(`select * from managetopics where Cid = ?`, [req.body.course], (err, rows) => {
        if (err || !rows) {
            rows = []
        }
        res.send({ rows: rows })
    })
}
module.exports.viewChart = (req, res) => {
    connection.query(`select * from course_to_question_mapping where course_id = ? and mode = ?`, [req.query.course_id, req.query.mode], (err, rows) => {
        var row = {};
        if (err || !rows.length) {
            row = {}
        } else {
            row = rows[0]
        }
        console.log(row)
        res.render('viewChart', { data: row, course_id: req.query.course_id, mode: req.query.mode })
    })
}
module.exports.insert2 = (req, res) => {
    console.log(req.body)
    var data = req.data;
    if (req.body.paper_id) {
        data['paper_id'] = req.body.paper_id;
    }
    connection.query('insert into course_to_question_mapping set ? ON DUPLICATE KEY UPDATE ?', [data, data], (err, result) => {
        if (err) {
            console.log(err);
            res.sendStatus(400);
            return;
        }
        console.log({ paper_id: result.insertId })
        res.json({ message: "Question saved successfully" });
    });
}
module.exports.save = (req, res) => {
    connection.query('insert into managetopics  set ? ', req.data, (err, result) => {
        if (err) {
            throw err;
            return;
        }
        res.json({ message: "success" });
    });

}
module.exports.fetch3 = (req, res) => {
    var query = 'select * from course as a,course_to_question_mapping as b,course_to_staff_mapping as c where a.course_id=b.course_id and c.staff_id=?';
    connection.query(query, [req.session.user.staff_id], (err, results) => {
        res.render('excel', { rows: results })
    })
}
module.exports.download = (req, res) => {
    var curriculum = req.body.curriculum, paper_id = req.body.paper_id;
    if (!curriculum || !paper_id) {
        res.sendStatus(400);
        return;
    }
    connection.query('select student_list from curriculum where curriculum=? limit 1', [curriculum], (err, results1) => {
        if (err) console.log(err)
        connection.query('select questions from course_to_question_mapping where paper_id=?', [paper_id], (err, results2) => {
            if (err) console.log(err)
            var questions = results2[0].questions;
            require('request').post({
                url: 'http://localhost:5000/gene',
                formData: {
                    filename: results1[0].student_list,
                    questions: questions,
                }
            }, (err, resp, body) => {
                res.download('./temp/' + body);
            });
        });
    });
}
