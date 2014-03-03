mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = mongoose.Schema.Types.ObjectId

ingredient = new Schema key: String, name: String, quantity: {type: Number, min: 0}, unity: String, switchList: [ObjectId], optional: type: Boolean, default: Date.now

module.exports = ingredient