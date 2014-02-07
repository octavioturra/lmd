class Recipes
    @recipe = null
    constructor: (recipe)->
        @recipe = recipe
    
    all: (req, res, next)=>        
        @recipe.find {active: true}, (err, r)->
            if err
                req.session.message = type : 'danger', message: err.message
                return res.redirect '/recipes'
            res.render 'home', recipes : r        
    
    form: (req, res, next)=>
        res.render 'recipe', recipe: _id:'', name:'', description:''
    
    create: (req, res, next)=>
        recipe = new @recipe name : req.param('name'), description: req.param('description')
        recipe.save (err, r)->
            if err
                req.session.message = type : 'danger', message: err.message
                return res.redirect '/recipes'
            req.session.message = type: 'success', message: 'Criado com sucesso.'
            res.redirect '/recipes'
    
    show: (req, res, next)=>
        @recipe.find {_id: req.param 'id', active: true}, (err, r)->
            if err
                req.session.message = type : 'danger', message: err.message
                return res.redirect '/recipes'
            if r.length is 0
                req.session.message = type : 'danger', message: 'Receita não encontrada'
                return res.redirect '/recipes'
            res.render 'recipe', recipe: r[0]
        
    modify: (req, res, next)=>
        id = req.param 'id' 
        toUpdate = 
            name : req.param 'name'
            description : req.param 'description'
        
        @recipe.update { _id: id }, {$set: toUpdate}, (err, r)->
            if err
                req.session.message = message : type : 'danger', message: err.message
                res.redirect '/recipes'
            req.session.message = type : 'info', message: 'Alterado.'
            return res.redirect '/recipes'
                
    remove: (req, res, next)=>
        id = req.param 'id'
        @recipe.update { _id: id }, {$set: 'active': false}, (err, r)->
            if err
                req.session.message = type : 'danger', message: err.message
                res.redirect '/recipes'
            req.session.message = type : 'info', message: 'Removido.'
            return res.redirect '/recipes'
        
module.exports = Recipes