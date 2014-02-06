class Index
    index : (req, res)->
        if req.session.user
            return res.redirect '/recipes'
        return res.render 'index'
        
module.exports = Index