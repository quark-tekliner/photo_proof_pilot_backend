class APIResponse
    constructor: (@res, @err, @data) ->

    send: () ->
        if @err
            console.error(@err)
            return @res.send(500, {error: @err.message})
        return @res.send(200) if not @data
        @res.json(@data)

module.exports.APIResponse = APIResponse
