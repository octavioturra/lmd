class Recipes
    @recipe = null
    constructor: (recipe)->
        @recipe = recipe
    
    all: (req, res, next)->
        @recipe.all (err, r)->
            if err
                res.render 'error', message : type : 'error', message: err.message
            res.render 'home', recipes : r
    
    showCreate: (req, res, next)->
        res.render 'newRecipe'
    
    doCreate: (req, res, next)->
        recipe = new @recipe name : req.param('name'), description: req.param('description')
        recipe.save (err, r)->
            if err
                res.render 'error', message : type : 'error', message: err.message
            res.session.message = type: 'success', message: 'Criado com sucesso.'
            res.render '/'
    
    show: (req, res, next)->
        @recipe.find {id: req.param 'id'}, (err, r)->
            if err
                res.render 'error', message : type : 'error', message: err.message
            res.render 'recipe', r
        
    modify: (req, res, next)->
        @recipe.find {id: req.param 'id'}, (err, r)->
            if err
                res.render 'error', message : type : 'error', message: err.message
            r.name = req.param 'name'
            r.description = req.param 'description'
            r.save (err, r)->
                if err
                    res.render 'error', message : type : 'error', message: err.message
                res.session.message = type : 'info', message: 'Alterado.'
                res.redirect '/'
                
module.exports = Recipes