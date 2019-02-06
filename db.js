var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'fyp_selva'
});

connection.connect();

module.exports.connection = connection;