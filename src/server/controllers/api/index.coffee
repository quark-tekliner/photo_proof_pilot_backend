module.exports = (app) ->
    require('./user')(app)
    require('./place')(app)
    require('./photo')(app)