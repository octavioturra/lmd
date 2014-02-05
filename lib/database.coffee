module.exports = ()->
    mongoose = require 'mongoose'
    mongoose.connect 'mongodb://localhost/lmd'
    
    db = mongoose.connection
    db.on 'error', connection.error.bind console, 'connection error:'
    db.once 'open', ()->
        
    return db