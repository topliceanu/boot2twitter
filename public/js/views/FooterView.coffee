define () ->
	class FooterView extends Backbone.View
		
		events:
			'click #load': 'loadMore'

		loadMore: () ->
			this.collection.nextPage()

	return FooterView
