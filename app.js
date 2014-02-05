module.exports = function (passport) {
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
    app.use(express.cookieParser('your secret here'));
    app.use(express.session());
    app.use(passport.setUp)
    app.use(app.router);
    app.use(require('stylus').middleware(path.join(__dirname, 'public')));
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