# Description:
#  ＿人人人人人人人人人＿
#  ＞　進捗どうですか　＜
#  ￣Y^Y^Y^Y^Y^Y^Y^Y￣
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   shinchoku    ( ◠‿◠ ) 進捗どうですか ♡

_ = require("underscore")

module.exports = (robot) ->

  robot.respond /shinchoku/i, (msg) ->
    msg.http('http://api.tumblr.com/v2/blog/shinchokudodesuka.tumblr.com/posts/photo')
    .query(type: 'photo', api_key: process.env.TUMBLR_API_KEY)
    .get() (err, res, body) ->
      res = JSON.parse(body)
      return unless res?.status? && res?.response?.posts?[0]?

      url = _.chain(res.response.posts)
      .map((post) -> post.photos?[0]?.url)
      .compact()
      .shuffle()
      .first()
      .value()
      msg.send url
