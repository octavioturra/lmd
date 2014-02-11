mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId

module.exports = mongoose.model 'Recipe', {
    changeset: type: Number, get: (val)-> @_v
    key: type: ObjectId, get: (val)-> @_id
    name: String
    description: String
    category: String
    image: String
    imageBinary: Buffer
    ingredients:[
        key: ObjectId
        name: String
        quantity: type: Number, min: 0
        unity: String
        switchList: [ObjectId]
        optional: type: Boolean, default: Date.now
    ], 
    steps:[
        order: Number
        description: String
        optional: type: Boolean, default: Date.now
    ],
    author:{
        name: String
        site: String
        email: String
    },
    lastUpdate : type: Date, default: Date.now
    active : type: Boolean, default: true
}