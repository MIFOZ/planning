// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader('Content-Type', 'application/javascript')}
})

jQuery.fn.submitWithAjax = function() {
	this.click(function(event) {

		var form = $(this).parent('form');
		var action = form.attr('action');

		$.ajax({
			url: action,
			type: 'POST',
			data: { },
			dataType: 'script'
		});
		return false;
  	})
}

$(document).ready(function() {
	$('#add_task').submitWithAjax();
})

$(document).ready(function() {
	$('.task_checker').submitWithAjax();
})