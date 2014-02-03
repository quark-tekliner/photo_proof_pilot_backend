Sequelize = require('sequelize')
db = require('./db')

Photo = db.define('Photo', {
    comment:
        type: Sequelize.TEXT
    url:
        type: Sequelize.TEXT
        validate:
            notEmpty: true
    date:
        type: Sequelize.DATE
        defaultValue: Sequelize.NOW
}, {timestamps: false},
{
    classMethods: {

    },
    instanceMethods: {

    }
})

module.exports = Photo
