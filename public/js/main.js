require({
	paths: {
		'text': 'lib/require.text-2.0.0',
		'cs': 'lib/require.cs-0.4.1',
		'CoffeeScript': 'lib/CoffeeScript-1.3.3'
	}
}, ['cs!main']);

/*
require.config({
	paths: {
		'text': 'lib/require.text.js'
	}	
});

define( function () {

	

	var conf = {
		search: ['#B2G', '@hackb2g', 'boot2gecko'],
		twitterSearchBaseUrl: 'https://twitter.com/search.json'
	};

	var $container = $('#tweets');

	$.ajax({
		'type': 'GET',
		'dataType': 'jsonp',
		'url': conf.twitterSearchBaseUrl,
		'data': {
			'q': encodeURIComponent(conf.search[2])
		}
	}).done( function (data) {
		console.log(data);
		for (var i = 0 , n = data.results.length; i < n; i ++) {
			$container.append($('<p/>', {
				'html': data.results[i].text
			}));
		}
	})
	.fail( function (err) {
		console.log(err);
	});

});
*/
