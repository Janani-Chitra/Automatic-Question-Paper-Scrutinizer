var express = require('express')
var app = express.Router()
var controller = require("../controllers/adminController")
var middleware = require("../middlewares/adminMiddleware")

app.get('/', (req, res) => {
    res.render('admin/home')
})

app.post('/login', controller.login)

app.get('/dashboard', middleware.isLoggedIn, (req, res) => {
    res.render('admin/dashboard')
})


app.post('/table/:table', middleware.isLoggedIn, controller.fetch)


app.get('/form/:form', middleware.isLoggedIn, (req, res) => {
    res.render('admin/forms/' + req.params.form)
})

app.post('/form/staff', middleware.isLoggedIn, controller.insert1)
app.post('/form/course', middleware.isLoggedIn, controller.insert2)
app.post('/form/course_to_staff_mapping', middleware.isLoggedIn, controller.insert3)

app.get('/curriculum', middleware.isLoggedIn, (req, res) => {
    res.render("admin/curriculum");
})
app.post('/curriculum', middleware.isLoggedIn, controller.insert4)


module.exports = app