// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(document).ready(function(){
  $('#filter_users').change(function(){
    $('#filter_users_form').submit();
  })
});

$(document).ready(function() {

	var frame = $("#wcFrame");

	if($(frame).length > 0)
	{
		console.log("got frame!");

		$(frame).width($(window).width());
		$(frame).height($(window).height());

		$("#mainContentContainer").removeClass("container");
	}
	else
	{
		console.log("no frame!");
	}

});