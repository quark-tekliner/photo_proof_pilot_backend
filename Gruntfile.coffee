module.exports = (grunt) ->

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json')
    })

    grunt.registerTask('init', 'Initialize the project', () ->
        db = require('./src/server/models').db
        done = this.async()
        db.sync({force: true}).complete((err) ->
            grunt.fail.fatal("Error while db sync #{err}") if err
            grunt.log.writeln("Db sync done")
            done()
        )
    )
