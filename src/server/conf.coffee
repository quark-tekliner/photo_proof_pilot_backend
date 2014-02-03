conf =
    app:
        port: 3000
        sessionSecret: 'as9a9waiodnla21&&7aajwTaw7('
    auth:
        id: '4128469'
        secret: '5fPfSkh0MZGUMPd15F3y'
    db:
        dbName: 'md_api'
        login: 'md_api'
        password: 'md_api'
        host: 'localhost'


module.exports = (section) ->
    return conf[section]
