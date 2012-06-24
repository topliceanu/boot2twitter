define [
	'text!templates/tweet.html'
], (tweetTpl) ->
	
	class TweetView extends Backbone.View

		initialize: () ->
			this.tweetTpl = tweetTpl
			this.compiled = _.template(this.tweetTpl)

			this.collection.on 'add reset', this.render, this
			return
			
		render: () ->
			html = ''
			for tweet in this.collection.toJSON()
				html += @compiled tweet
			this.el.innerHTML = html
			return this

	return TweetView
