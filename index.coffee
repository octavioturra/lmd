db = require('./lib/database')()
passport = new (require './lib/passport')

app = require('./app')(passport, db)

recipe = require('./models/recipe')

index = new (require('./controllers/index'))
recipes = new (require('./controllers/recipes'))(recipe)

app.get '/', index.index
app.post '/login', passport.validate, (req, res)-> res.redirect '/recipes'
app.post '/login', (req, res)-> res.redirect '/recipes'
app.get '/logoff', passport.logoff
app.get '/home', passport.validate, recipes.all


app.get '/recipes', passport.validate, recipes.all
app.get '/recipe', passport.validate, recipes.form
app.post '/recipe', passport.validate, recipes.create
app.get '/recipe/:id', passport.validate, recipes.show
app.post '/recipe/:id', passport.validate, recipes.modify

app.start()