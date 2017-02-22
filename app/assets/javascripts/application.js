//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require moment
//= require fullcalendar
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .

$('#calendar').fullCalendar({});

$(document).ready(function() {
  $('.attachinary-input').attachinary();
});
