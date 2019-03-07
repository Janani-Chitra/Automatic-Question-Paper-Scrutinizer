var express = require("express");
var app = express();
var session = require('express-session');
var bodyParser = require("body-parser");
var fileUpload = require("express-fileupload");
app.use(fileUpload());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.set('view engine', 'ejs');
app.set('views', './views');

var connection = require('./db').connection


app.use(express.static('./public'));
app.use(session({
    secret: 'FYPAUtomaticQuestionPaperScrutinizer',
    resave: true,
    saveUninitialized: true
}));
app.use('/', require('./routers/mainRouter'))
app.use('/admin', require('./routers/adminRouter'))

var request = require('request')
app.get('/classify', (req, res) => {
    connection.query('select topicContent from managetopics where Cid=?', req.query.course_id, (err, results) => {
        console.log(results);
        if (!results) {
            res.send('');
            return;
        }
        var rows = [];
        results.forEach(result => {
            rows.push(result.topicContent);
        });
        console.log(rows)
        request.post({ url: 'http://localhost:5000', form: { q: req.query.q, sens: JSON.stringify(rows) } }, (error, response, body) => {
            res.send(body)
        })
    })
})
app.get('/co-bt', (req, res) => {
    request('http://localhost:5000/co-bt?q=' + req.query.q, function (error, response, body) {
        res.send(body)
    })
})
app.get('/suggest', (req, res) => {
    request('http://localhost:5000/suggest?q=' + req.query.q, function (error, response, body) {
        res.send(body)
    })
})

var port = 8080
app.listen(port, (err) => {
    if (err) throw err;
    console.log(`App runs in http://localhost:${port}`);
})