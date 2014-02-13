mongoose = require 'mongoose'
Schema = mongoose.Schema

step = new Schema order: Number, description: String, optional: type: Boolean, default: Date.now

module.exports = step