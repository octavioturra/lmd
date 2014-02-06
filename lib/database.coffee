module.exports = ()->
    mongoose = require 'mongoose'
    mongoose.connect 'mongodb://localhost:27017/lmd'
    
    db = mongoose.connection
    db.on 'error', console.error.bind console, 'connection error:'
    db.once 'open', ()->
        console.log 'MongoDB Openned'
        
    return mongoose