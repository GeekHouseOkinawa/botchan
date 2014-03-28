request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /(lgtm|lg)( me)?/i, (msg) ->
    url = 'http://www.lgtm.in/g'
    options =
      url: url
      timeout: 2000
      headers: {'user-agent': 'node title fetcher'}

    request options, (error, response, body) ->
      $ = cheerio.load body
      title = $('#imageUrl').val()
      msg.send(title)