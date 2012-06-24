define ['cs!lib/Tweet.coffee'], (Tweet) -> 
	class Tweets extends Backbone.Collection
		@model: Tweet

	return Tweets
