var express = require('express');
var app = express.Router();
var connection = require("../db").connection
var controller = require("../controllers/mainController")
var middleware = require("../middlewares/mainMiddleware")

app.get('/', (req, res) => {
    res.render("home");
})
app.get('/register', middleware.isLoggedIn, (req, res) => {
    res.render("register");
})
app.get('/manageTopics', middleware.isLoggedIn, (req, res) => {
    res.render("manageTopics");
})
app.post('/login', controller.login)
app.get('/logout', controller.logout)
app.get('/dashboard', middleware.isLoggedIn, (req, res) => {
    res.render('dashboard', { user: req.session.user })
})
app.get('/generate', middleware.isLoggedIn, (req, res) => {
    console.log(req.query);
    res.render('generate', { data: req.query })
})

app.post('/table/course', middleware.isLoggedIn, controller.fetch)
app.post('/table1/:cur', middleware.isLoggedIn, controller.fetchcon)
app.post('/add/course_outcomes', middleware.isLoggedIn, controller.insert1)

app.post('/table/co_to_bt', middleware.isLoggedIn, controller.fetch1)
app.post('/table/curriculum', middleware.isLoggedIn, controller.fetch2)

app.post('/store-questions', middleware.isLoggedIn, controller.insert2)
app.get('/excel', controller.fetch3)
app.post('/download', controller.download)

module.exports = app

