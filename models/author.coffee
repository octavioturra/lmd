mongoose = require 'mongoose'
Schema = mongoose.Schema

author = new Schema name: String, site: String, email: String

module.exports = author