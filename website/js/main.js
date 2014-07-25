
requirejs.config({
   "paths": {
     "jquery": "lib/jquery.min",
     "waypoints": "lib/waypoints.min"
   }
});

require(["jquery", "waypoints"], function (jquery) {
	require(["lib/bootstrap.min", "lib/vertical-align", "lib/window-sized", "lib/jquery.scrollTo.min", "lib/prettify"]);

	$(document).ready(function () {
		// ACTUAL CODE

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

		$("#CaptainEmailForm").submit(function (event) {
			event.preventDefault();

			var form = $(this);
			var data = form.serialize();

			$.post(form.attr("action"), data);

			form.addClass("success");
		});
	
		$(".waypointed").waypoint(function (direction) {
			classname = $(this).attr("data-waypoint-class");
			console.log(direction);
			$(this).removeClass("justhide");
			if(direction == "down")
				$(this).addClass(classname);
			else
				$(this).removeClass(classname);
		},{
			triggerOnce: true,
			offset: 250
		});
	});


});