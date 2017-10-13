	var after_message_submit = function () {
		//clear input fields & scroll user to the top
		$('input[type=text], textarea').val('');
		$('html, body').animate({scrollTop: $('#intro-of-me').offset().top},1000);
		window.scrollTo(0, 100);	
	};

$(document).on('ready turbolinks:load',function(){

	//SweetAler2 on ajax
	$('#new_message').on('ajax:before', function(){ // AJAX BEFORE HANDLE
		swal({
			title: 'Sending Message',
			html: '<i class="fa fa-spinner fa-spin fa-3x" aria-hidden="true"></i>' +
						'<br /><h3>Sending...</h3>',
			onOpen: function(){
				swal.disableConfirmButton()
			}
		});
	}).on('ajax:complete', function(){ // AJAX COMPLETE HANDLE
			console.log('ajax:complete');
			swal({
				type: 'success',
				title:
					'Message Successfully sent!',
				text:
					'Thanks ' + $('#message_name').val() + ' For reaching out!\n' +
					"I'll get back to you shortly."
			}).then(function(){  // AJAX CALLBACK TO CLEAR MESSAGE AND SCOLLTOP
					after_message_submit();				
			});
		}).on('ajax:error', function(){ // AJAX ERROR HANDLE
			swal({
				type: 'error',
				title: 'Opps!',
				text: 'Sorry we couldnt contact the Mail server!',
				timer: 2000,
				onOpen: function(){
					swal.disableConfimButton()
				}
			});
		});

	// Auto ajust size of cards using lib/jquery_match_height.js
	$('#hobbies.row.match-height').each(function() {
   $(this).find('.card').not('.card .card').matchHeight(); // Not .card .card prevents collapsible cards from taking height
	});
	// Typed.js 
	var options = {
	  strings: [
	  	'Hello, my name is <strong>Sebastian Valdez</strong>',
	  	'I am a <b><i>Ruby on Rails Developer</i></b>, pursuing an <b>oppertunity</b> to build amazing things',
	  	'Some of my hobbies are:',
	  	'Writing code ... :P',
	  	'Brewing and Roasting my own coffee',
	  	'3D Printing things',
	  	'Being outdoors',
	  	'Learn more about me and what I know from my Github and blog.'
	  ],
	  typeSpeed: 50,
	  cursorChar: ' |'
	}

	var typed = new Typed(".animated-msg", options);

	
});
