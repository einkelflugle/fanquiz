$(document).ready(function() {
	$('.remove-form-group').click(function() {
		$(this).prev("input[type=hidden]").val("1");
		$(this).parent(".form-group").fadeOut();
	});
});