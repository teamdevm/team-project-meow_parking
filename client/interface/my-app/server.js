const express = require('express');
const { Client } = require('pg');
var cors = require('cors');
const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'Office',
    password: '',
    port: 5432,
  });

client.connect();
var app = express();
app.use(cors());
app.set('port', process.env.PORT || 4000);
app.get('/abc', function (req, res, next) {
    client.query('select * from user', function (err, result) {
        if (err) {
            console.log(err);
            res.status(400).send(err);
        }	
        res.status(200).send(result.rows);
        console.log(result.rows);
    });
});
app.listen(4000, function () {
    console.log('Server is running.. on Port 4000');
});