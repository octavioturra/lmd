module.exports = function (passport, mongoose) {
    var express = require('express');
    var http = require('http');
    var path = require('path');
    var engine = require('ejs-locals');
    var app = express();

    // all environments
    app.set('port', process.env.PORT || 3000);
    app.engine('ejs', engine);
    app.set('views', path.join(__dirname, 'views'));
    app.set('view engine', 'ejs');
    app.use(express.favicon());
    app.use(express.logger('dev'));
    app.use(express.json());
    app.use(express.urlencoded());
    app.use(express.methodOverride());
    app.use(express.cookieParser('1c66c0c65f830fbe5ba2aaa3d10df6f9'));
    app.use(express.session({
        secret: '1ca6602f016bd13cad4a1693d4fe303c',
        cookie: {
            maxAge: 2628000000
        },
        store: new(require('express-sessions'))({
            storage: 'mongodb',
            instance: mongoose,
            host: 'localhost',
            port: 27017,
            db: 'lmd',
            collection: 'sessions',
            expire: 86400
        })
    }));
    app.use(passport.setUp)


    app.use(function (req, res, next) {
        res.locals.version = '?' + (function () {
            return (Math.random() * 6666).toFixed(0);
        })();
        next();
    });


    app.use(app.router);
    app.use(require('stylus').middleware({
        src: path.join(__dirname, 'public'),
        compress:true
    }));
    app.use(express.static(path.join(__dirname, 'public')));

    // development only
    if ('development' == app.get('env')) {
        app.use(express.errorHandler());
    }

    app.start = function () {
        http.createServer(app).listen(app.get('port'), function () {
            console.log('Express server listening on port ' + app.get('port'));
        });
    }

    return app
}