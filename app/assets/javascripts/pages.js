	var after_message_submit = function () {
		//clear input fields & scroll user to the top
		$('input[type=text], textarea').val('');
		$('html, body').animate({scrollTop: $('#intro-of-me').offset().top},1000);
		window.scrollTo(0, 100);	
	};

	//jQuer downloader for resume ajax downloads
	$(function(){
	});

$(document).on('ready turbolinks:load',function(){

		$('.jquery-download').on('click', function(e){
			e.preventDefault();
			$.fileDownload($(this).find('a').prop('href'),{
				successCallback: function (url) { swal({ type: 'success', text: 'Thanks for downloading my resume!' }) },
				failCallback: function (url) { swal({type: 'error', text: "Sorry, couldn't download, try again later."}) }
			});
		});


	//SweetAler2 on ajax
	$('#new_message').on({
		'ajax:send': function(){
			swal({
				title: 'Sending Message',
				html: '<i class="fa fa-spinner fa-spin fa-3x" aria-hidden="true"></i>' +
							'<br /><h3>Sending...</h3>',
				onOpen: function(){
					swal.disableConfirmButton();
				}
			});
		},
		'ajax:success': function(){
			swal({
				type: 'success',
				title:
					'Message Successfully Sent!',
				text:
					'Thanks ' + $('#message_name').val() + ' for reaching out!\n' +
					"I'll get back to you shortly."
			}).then(function(){  // AJAX CALLBACK TO CLEAR MESSAGE AND SCOLLTOP
					after_message_submit();				
			});
		},
		'ajax:error': function(){
			swal({
				type: 'error',
				title: 'Opps!',
				text:
					"Sorry we couldn't contact the Mail server!\n" + 
					'Try again later.',
				timer: 2000,
				onOpen: function(){
					swal.disableConfimButton();
				}
			});
		}
	});

	// Auto ajust size of cards using lib/jquery_match_height.js
	$('#hobbies.row.match-height').each(function() {
   $(this).find('.card').not('.card .card').matchHeight(); // Not .card .card prevents collapsible cards from taking height
	});
	// Typed.js 
	var options = {
	  strings: [
	  	'Hello, my name is <strong>Sebastian Valdez</strong>',
	  	'I am a <b><i>Ruby on Rails Developer</i></b>, with a passion for creating.',
	  	'Thanks for stopping by!'
	  ],
	  typeSpeed: 50,
	  cursorChar: ' |'
	}

	var typed = new Typed(".animated-msg", options);

	
});
