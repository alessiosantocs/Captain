$(document).ready(function () {
	// Refresh button
	$(".btn-action-refresh").click(function () {
		window.location.reload();
	});

	$(".application_alerts").css("height", $(".application_alerts").innerHeight());
	$(".application_alerts").click(function (argument) {
		$(this).addClass("read");
	});

	$(document).on('page:fetch',   function() { NProgress.start(); });
	$(document).on('page:change',  function() { NProgress.done(); });
	$(document).on('page:restore', function() { NProgress.remove(); });
});
