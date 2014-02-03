fs = require('fs')
Photo = require('../../models/photo')
APIResponse = require('./utils').APIResponse

module.exports = (app) ->
    app.post('/api/photos', (req, res) ->
        body = req.body.photo
        return new APIResponse(res, new Error('Invalid body params')).send() if not body
        comment = body.comment
        palceId = body.placeId
        userId = body.userId

        file = req.files.photo
        path = file?.content?.path
        return new APIResponse(res, new Error('Invalid file params')).send() if not path
        url = "#{(new Date()).getTime()}.jpg"
        source = fs.createReadStream(path)
        dest = fs.createWriteStream("#{__dirname}/../../../data/#{url}")
        source.pipe(dest);
        source.on('end', () ->
            Photo.create({comment: comment, url: url, userId: 1, placeId: palceId}).complete((err) ->
                new APIResponse(res, err).send()
            )
        )
        source.on('error', () ->
            return new APIResponse(res, new Error('File access error')).send()
        )
    )