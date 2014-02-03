Sequelize = require('sequelize')
db = require('./db')
Photo = require('./photo')

Place = db.define('Place', {
    name:
        type: Sequelize.STRING
        validate:
            notEmpty: true
    description:
        type: Sequelize.STRING
        defaultValue: ''
    lon:
        type: Sequelize.FLOAT
        validate:
            notEmpty: true
    lat:
        type: Sequelize.FLOAT
        validate:
            notEmpty: true
},
{timestamps: false},
{
    classMethods: {

    },
    instanceMethods: {

    }
})

Place.hasMany(Photo, {foreignKey: 'placeId',  foreignKeyConstraint: true})

module.exports = Place
