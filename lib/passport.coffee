class Passport
    setUp : (req, res, next)->        
        res.locals.message = req.session.message or undefined
        req.session.message = undefined
        res.locals.isLogged = ()->
            !!req.session.user
        next()
        
    validate : (req, res, next)->
        user = req.session.user
        
        if user
          return next()
        
        email = req.param 'email'
        password = req.param 'password'
        
        if email is 'admin@admin.com.br' and password is '123456'
            req.session.user = id: 0
            return next()    
        
        req.session.message = type: 'danger', message: 'Usuário ou senha inválidos'
        return res.redirect '/'
    
    logoff : (req, res, next)->
        req.session.user = null
        res.redirect '/'

module.exports = Passport