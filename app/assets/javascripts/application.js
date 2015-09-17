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
//= require jquery-ui
//= require bootstrap
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .


$(document).ready(function() {

	$('.collapsable').click(function() {
		$(this).next().toggle("blind", 100);
	});

	$('[data-toggle="tooltip"]').tooltip(); 

    $('.event-body').hide();

	$('#show-events').click(function() {
		$('.event-body').toggle("blind", 100);
	})

	$('#show-listings').click(function() {
		$('.listing-body').toggle("blind", 100);
	})

	$('#show-leads').click(function() {
		$('.lead-body').toggle("blind", 100);
	})

    $('.panel-body').find('button').hide();

    $('.panel-body').hover(function() {
            $(this).find('button').fadeToggle();
        }
    );

    var messageDiv = $('#messageDiv');

    $('#messageButton').click(function() {
        if (messageDiv.hasClass('shown')) {
            messageDiv.animate({
                right: "-=300px"
            }, "fast");
            $('#bodyDiv').animate({
                right: "-=100px"
            }, "slow");
            messageDiv.removeClass('shown');
        } else {
            messageDiv.animate({
                right: "+=300px"
            }, "fast");
            $('#bodyDiv').animate({
                right: "+=100px"
            }, "slow");
            messageDiv.addClass('shown');
        }
    })

    $('.inputField').attr('disabled','disabled');

    $('#edit-event').click(function() {
        $('.saveButton').toggle();
        if ($('.editable').attr('disabled')) {
            $('.editable').removeAttr('disabled');
            $('.editable').parent().addClass('editMode');
        } else {
            $('.editable').attr('disabled', 'disabled');
            $('.editable').parent().removeClass('editMode');
        }
    })

	// $('.edit').on('click', function() {

 //        var id = $(this).attr('data-id');
 //        var data = {};
        
 //        //pseudocode of building data object
 //        data['event_type'] = $('.edit-event-form').find('[id="event_event_type"]');
 //        data['title'] = $('.edit-event-form').find('[id="event_title"]');
 //        data['date'] = $('.edit-event-form').find('[id="event_date"]');
 //        data['start_time'] = $('.edit-event-form').find('[id="event_start_time"]');
 //        data['end_time'] = $('.edit-event-form').find('[id="event_end_time"]');
 //        data['agent_id'] = $('.edit-event-form').find('[id="event_agent_id"]');
 //        data['listing_id'] = $('.edit-event-form').find('[id="event_listing_id"]');
 //        data['prospect_id'] = $('.edit-event-form').find('[id="event_prospect_id"]');

 //        $.ajax({
 //        	//build correct ajax parameters
 //            url: '/event/' + id,
 //            method: 'POST',
 //            //data is the user supplied edits in the modal that we package up
 //            data: data
 //            //when our updates on the server succeed, our success handler below will run,
 //            //we need to grab the response(which is an updated event object), and upate the DOM so
 //            //that the newly updated object is displayed to the user
 //        }).success(function(response) {
            
 //            //get returned json object and update correct event DOM elements
 //            var updatedEvent = JSON.stringify(response);
            
 //            //update DOM with updatedEvent
                
 //        });
 //    });

});

$(function() {
  $('#datePicker').datepicker();
});