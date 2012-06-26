define () ->
	isInstalled = false

	class HeaderView extends Backbone.View

		events:
			'click #install': 'installApp'

		installApp: () ->
			try
				request = window.navigator.mozApps.install '/manifest.webapp'

				request.onsuccess = () ->
					console.log 'success', this.result
					isInstalled = true

				request.onerror = () ->
					console.log 'error', error

			catch error
				console.log 'error', error

			finally
				this.render()
			
		render: () ->
			this.$('#install').toggle !isInstalled
