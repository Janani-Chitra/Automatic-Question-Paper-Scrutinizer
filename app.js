var express = require("express");
var app = express();
var session = require('express-session');
bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
var fileUpload = require("express-fileupload");
app.use(fileUpload());
app.set('view engine', 'ejs');
app.set('views', './views');

app.use(express.static('./public'));
app.use(session({
    secret: 'FYPAUtomaticQuestionPaperScrutinizer',
    resave: true,
    saveUninitialized: true
}));
app.use('/', require('./routers/mainRouter'))
app.use('/admin', require('./routers/adminRouter'))


app.listen("80", (err) => {
    if (err) throw err;
    console.log("App runs in http://localhost");
})