User = require('../../models/user')
APIResponse = require('./utils').APIResponse

module.exports = (app) ->
    app.post('/api/user', (req, res) ->
        name = req.param('name')
        User.create({name}).complete((err) ->
            new APIResponse(res, err).send()
        )
    )
