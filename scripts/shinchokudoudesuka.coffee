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
#   hubot shinchoku - ( ◠‿◠ ) 進捗どうですか ♡

_ = require("underscore")

module.exports = (robot) ->

  robot.respond /(shinchoku|sh)/i, (msg) ->
    msg.http('http://api.tumblr.com/v2/blog/shinchokudodesuka.tumblr.com/posts/photo')
      .query(type: 'photo', api_key: process.env.TUMBLR_API_KEY)
      .get() (err, res, body) ->
        r = JSON.parse(body)
        return unless r?.meta?.status? && r?.response?.posts?[0]?

        url = _.chain(r.response.posts)
          .map((post) -> _.map(post.photos, (p) -> p.alt_sizes?[0]?.url))
          .flatten()
          .compact()
          .shuffle()
          .first()
          .value()
        msg.send url
