Place = require('../../models/place')
APIResponse = require('./utils').APIResponse

module.exports = (app) ->
    app.post('/api/places', (req, res) ->
        name = req.param('name')
        Place.create({name}).complete((err) ->
            new APIResponse(res, err).send()
        )
    )

    app.get('/api/places', (req, res) ->
        Place.all().complete((err, placeList) ->
            new APIResponse(res, err, placeList).send()
        )
    )
