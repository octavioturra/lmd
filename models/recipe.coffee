mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId
Schema = mongoose.Schema

step = require './step'
ingredient = require './ingredient'
author = require './author'

module.exports = mongoose.model 'Recipe', {
    changeset: type: Number, get: (val)-> @_v
    key: type: ObjectId, get: (val)-> @_id
    name: String
    description: String
    category: String
    image: String
    imageBinary: Buffer
    ingredients:[ingredient]
    steps:[step]
    author: [author]
    lastUpdate : type: Date, default: Date.now
    active : type: Boolean, default: true
}