require(["lib/jquery.min"], function (jquery) {
	require(["lib/bootstrap.min", "lib/vertical-align", "lib/window-sized", "lib/jquery.scrollTo.min"]);

	$(document).ready(function () {
		// ACTUAL CODE

		$(document).ready(function () {
			$('a').click(function(){
				var href = $.attr(this, 'href');
				$.scrollTo($(href), 500, function () {
					window.location.hash = href;
				});
				return false;
			});
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