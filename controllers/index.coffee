class Index
    index : (req, res)->
        res.render 'index'
        
    home : (req, res)->
        res.render 'home'
        
module.exports = Index