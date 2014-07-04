$(document).ready(function () {
	var child_nodes = $(".vertically-aligned");

	window.calculateAbsoluteTop = function (parent_height, child_height) {
		var middle_parent_height = parent_height / 2;
		var middle_child_height = child_height / 2;

		var absolute_offset_top = middle_parent_height - middle_child_height;

		return absolute_offset_top;
	};

	$(window).on('resize', function () {
		child_nodes.each(function () {
			var child_node = $(this);
			var parent_node = child_node.parent();

			var parent_height = parent_node.innerHeight();
			var child_height = child_node.innerHeight();

			var absolute_top = window.calculateAbsoluteTop(parent_height, child_height);

			child_node.css("position", "absolute");
			child_node.css("top", absolute_top);
		});
	});

	window.setTimeout(function () {
		$(window).resize();
	}, 200);
});