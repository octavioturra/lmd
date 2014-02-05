class Recipes
    @recipe = null
    constructor: (recipe)->
        @recipe = recipe
    
    all: (req, res, next)=>        
        @recipe.find (err, r)->
            console.log err, r
            if err
                req.session.message = message : type : 'danger', message: err.message
                res.redirect '/'
            res.render 'home', recipes : r        
    
    showCreate: (req, res, next)=>
        res.render 'newRecipe'
    
    doCreate: (req, res, next)=>
        recipe = new @recipe name : req.param('name'), description: req.param('description')
        recipe.save (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                res.redirect '/'
            req.session.message = type: 'success', message: 'Criado com sucesso.'
            res.redirect '/recipe', r
    
    show: (req, res, next)=>
        @recipe.find {id: req.param 'id'}, (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                res.redirect '/'
            res.render 'recipe', r
        
    modify: (req, res, next)=>
        @recipe.find {id: req.param 'id'}, (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                res.redirect '/'
            r.name = req.param 'name'
            r.description = req.param 'description'
            r.save (err, r)->
                if err
                    req.session.message = message : type : 'danger', message: err.message
                    res.redirect '/'
                req.session.message = type : 'info', message: 'Alterado.'
                res.redirect '/'
                
module.exports = Recipes