define [
	'cs!views/FooterView'
	'cs!views/TweetsView'
	'cs!collections/Tweets'
], (FooterView, TweetsView, Tweets) ->

	tweets = new Tweets
	tweets.populate()

	footerEl = document.getElementById 'footer'
	footer = new FooterView 
		el: footerEl
		collection: tweets

	containerEl = document.getElementById 'tweets'
	container = new TweetsView
		el: containerEl
		collection: tweets
