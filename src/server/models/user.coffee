Sequelize = require('sequelize')
db = require('./db')
Photo = require('./photo')
ROLES = require('./constants').ROLES

User = db.define('User', {
    name:
        type: Sequelize.STRING
        validate:
            notEmpty: true
    role:
        type: Sequelize.ENUM(ROLES.USER, ROLES.ADMIN)
        defaultValue: ROLES.USER

}, {timestamps: false},
{
    classMethods: {

    },
    instanceMethods: {

    }
})

User.hasMany(Photo, {foreignKey: 'userId',  foreignKeyConstraint: true})

module.exports = User
