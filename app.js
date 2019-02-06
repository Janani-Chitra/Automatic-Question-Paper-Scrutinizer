var express = require("express");
var app = express();
var session = require('express-session');
var mysql=require("mysql");
var bodyParser = require("body-parser");
var fileUpload = require("express-fileupload");
app.use(fileUpload());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.set('view engine', 'ejs');
app.set('views', './views');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'fyp'
});

connection.connect();


app.use(express.static('./public'));
app.use(session({
    secret: 'FYPAUtomaticQuestionPaperScrutinizer',
    resave: true,
    saveUninitialized: true
}));
app.use('/', require('./routers/mainRouter'))
app.use('/admin', require('./routers/adminRouter'))

app.get("/curriculum",function(req,res){
    res.render("curriculum");
})
app.post("/curriculum",function(req,res){
    
   var file=req.files.student;
   var student_list=file.name;
  
    

   file.mv('public/student_list/'+ file.name, function(err){
       if(err)throw err;
        var query = `insert into curriculum(curriculum,student_list) values(?,?) `
        var data = [req.body.curriculum, student_list] 
        connection.query(query, data.concat(data), (err, rows) => {
                var code = 200
                if (err) {
                    console.log(err)
                    code = 400
                }
                res.sendStatus(code)
            })
       })
       
   })


app.listen("80", (err) => {
    if (err) throw err;
    console.log("App runs in http://localhost");
})