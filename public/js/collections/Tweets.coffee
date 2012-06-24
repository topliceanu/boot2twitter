define [
	'cs!models/Tweet'
], (Tweet) ->

	class Tweets extends Backbone.Collection
		model: Tweet
	
		initialize: () ->
			this.nextPageUrl = null

		populate: (useNextPage = false) ->
			that = this
			params =
				type: 'GET'
				dataType: 'jsonp'
				url: 'https://twitter.com/search.json'
				data:
					q: encodeURIComponent 'boot2gecko'
					lang: 'en'

			if useNextPage 
				_.extend params,
					url: 'https://twitter.com/search.json' + this.nextPageUrl
					data: undefined
	
			xhr = $.ajax params
			
			xhr.done (data) ->
				that.push new Tweet t for t in data.results
				that.nextPageUrl = data.next_page

			xhr.fail (err) ->
				console.log err
			return

		nextPage: () ->
			this.populate true
			return

	return Tweets
