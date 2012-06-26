define [
	'cs!views/FooterView'
	'cs!views/TweetsView'
	'cs!views/HeaderView'
	'cs!collections/Tweets'
], (FooterView, TweetsView, HeaderView, Tweets) ->

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

	headerEl = document.getElementById 'header'
	header = new HeaderView
		el: headerEl

	header.render()
