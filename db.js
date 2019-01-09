var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'fyp'
});

connection.connect();

module.exports.connection = connection;