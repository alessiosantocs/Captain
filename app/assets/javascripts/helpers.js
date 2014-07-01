$(document).ready(function () {
	// Refresh button
	$(".btn-action-refresh").click(function () {
		window.location.reload();
	});

	$(".application_alerts").css("height", $(".application_alerts").innerHeight());
	$(".application_alerts").click(function (argument) {
		$(this).addClass("read");
	});
});
