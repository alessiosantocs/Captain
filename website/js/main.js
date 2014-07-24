require(["lib/jquery.min"], function (jquery) {
	require(["lib/bootstrap.min", "lib/vertical-align", "lib/window-sized", "lib/jquery.scrollTo.min", "lib/prettify"]);

	$(document).ready(function () {
		// ACTUAL CODE

		$(document).ready(function () {
			$('a').click(function(event){
				event.preventDefault();

				var href = $.attr(this, 'href');
				$.scrollTo($(href), 1000, {
					onAfter: function () {
						// window.location.hash = href;
					},
					offset: -50
				});
			});

			window.setTimeout(function () {
				window.prettyPrint && prettyPrint()
			}, 500)
		});

		$("#CaptainEmailForm").submit(function (event) {
			event.preventDefault();

			var form = $(this);
			var data = form.serialize();

			$.post(form.attr("action"), data);

			form.addClass("success");
		});
	});



});