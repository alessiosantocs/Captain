require(["lib/jquery.min"], function (jquery) {
	require(["lib/bootstrap.min"]);

	// ACTUAL CODE
	$("#CaptainEmailForm").submit(function (event) {
		event.preventDefault();

		var form = $(this);
		var data = form.serialize();

		$.post(form.attr("action"), data);

		form.addClass("success");
	})
});