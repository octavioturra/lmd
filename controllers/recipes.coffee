class Recipes
    @recipe = null
    constructor: (recipe)->
        @recipe = recipe
    
    all: (req, res, next)=>        
        @recipe.find (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                return res.redirect '/'
            res.render 'home', recipes : r        
    
    form: (req, res, next)=>
        res.render 'recipe', recipe: _id:'', name:'', description:''
    
    create: (req, res, next)=>
        recipe = new @recipe name : req.param('name'), description: req.param('description')
        recipe.save (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                return res.redirect '/'
            req.session.message = type: 'success', message: 'Criado com sucesso.'
            res.redirect '/recipes'
    
    show: (req, res, next)=>
        @recipe.find {_id: req.param 'id'}, (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                return res.redirect '/'
            if r.length is 0
                req.session.message = message : type : 'danger', message: 'Receita não encontrada'
                return res.redirect '/'
            res.render 'recipe', recipe: r[0]
        
    modify: (req, res, next)=>
        @recipe.find {id: req.param 'id'}, (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                return res.redirect '/'
            if r.length is 0
                req.session.message = message : type : 'danger', message: 'Receita não encontrada'
                return res.redirect '/'
            r.name = req.param 'name'
            r.description = req.param 'description'
            r.save (err, r)->
                if err
                    req.session.message = message : type : 'danger', message: err.message
                    res.redirect '/'
                req.session.message = type : 'info', message: 'Alterado.'
                res.redirect '/'
                
module.exports = Recipes