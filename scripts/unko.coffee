# Description:
#   ( ◠‿◠ ) unko ♡
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot unko    ( ◠‿◠ ) unko ♡
#   hubot unkox N ( ◠‿◠ ) unko unko ... ♡

module.exports = (robot) ->

  robot.respond /unkox (\d+)/i, (msg) ->
    msg.send (':poop:' for _ in [1..+msg[1]]).join(' ')

  robot.respond /unko/i, (msg) ->
    msg.send ":poop:"
