# Description:
#   (☝ ՞ਊ ՞)☝ｷｴｴｴｴ
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot tiqav <phrae> - ( ◠‿◠ )

_  = require("underscore")

module.exports = (robot) ->

  robot.respond /tiqav (.+)/i, (msg) ->
    msg.http("http://api.tiqav.com/search.json")
      .query(q: msg.match[1])
      .get() (err, res, body) ->
         msg.send u if u = _.shuffle(JSON.parse(body))[0]?.source_url
