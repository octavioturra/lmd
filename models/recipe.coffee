mongoose = require 'mongoose'
module.exports = mongoose.model 'Recipe', 
    name: String
    description: String