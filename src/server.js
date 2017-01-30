var express = require('express')
var os = require("os");
 
var app = express()
var hostname = os.hostname();

console.log("starting")

app.get('/notes', function(req, res) {
  res.json({notes: "This is your notebook. Edit this to start saving your notes!",
            hostname: os.hostname()})
})
 
app.get('/notes/:note', function(req, res) {
  res.json({notes: "created note", 
            note: req.params.note,
            hostname: os.hostname()})
})

app.listen(3000)
