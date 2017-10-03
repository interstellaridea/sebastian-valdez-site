
$(document).ready(function(){

	var options = {
	  strings: [
	  	'Hello, my name is <strong>Sebastian Valdez</strong>',
	  	'I am a <b><i>Ruby on Rails Developer</i></b>, currently pursuing a <b>oppertunity</b> to build amazing things',
	  	'Some of my hobbies are:',
	  	'Writing code ..... :P',
	  	'Brewing and Roasting my own coffee',
	  	'3D Printing things',
	  	'Being outdoors',
	  	'Check out my Github & LinkedIn & Blog to learn more about me and what I know. Thanks!'
	  ],
	  typeSpeed: 50,
	}

	var typed = new Typed(".animated-msg", options);

	$(document).on('turbolinks:load',typed);
	
});
