request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /(xvideos|xv)/i, (msg) ->
    url = 'http://jp.xvideos.com/c/day/asian_woman-32'
    options =
      url: url
      timeout: 2000
      headers: {'user-agent': 'node title fetcher'}

    request options, (error, response, body) ->
      $ = cheerio.load body
      content = $('#content').children('.mozaique').find('.thumb > a')
      list = []
      content.each (index, element) =>
        url = 'http://jp.xvideos.com/' + $(element).attr('href')
        list[index] = url

      #shuffle array.
      for i in [list.length-1..1]
        j = Math.floor Math.random() * (i + 1)
        [list[i], list[j]] = [list[j], list[i]]

      msg.send list[0]

