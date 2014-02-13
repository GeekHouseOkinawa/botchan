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

module.exports = (robot) ->

  robot.respond /tiqav (.+)/i, (msg) ->
    msg.send "http://#{msg.match[1]}.tiqav.com"
