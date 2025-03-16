// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require chosen.jquery.js

$(document).ready(function() {
  $(".dropdown .button").click( (e) => {
    const dropdown = $(e.target).parents('.dropdown');
    dropdown.toggleClass('is-active');
    dropdown.focusout( (e) => {
      $(e.target).removeClass('is-active');
    });
  });

  $('.location-datatable').dataTable( {
    "aoColumnDefs": [
      { "bSearchable": false, "aTargets": [ 3 ] },
      { "bSortable": false, "aTargets": [ 3 ] },
    ], "bLengthChange": false, "iDisplayLength": 50 }
  );

  $('.device-datatable').dataTable( {
    "aoColumnDefs": [
      { "bSearchable": false, "aTargets": [ 5 ] },
      { "bSortable": false, "aTargets": [ 5 ] },
      { "bVisible": false, "aTargets": [ 4 ] },
    ], "bLengthChange": false, "iDisplayLength": 50 } 
  );

  $('.licenses-datatable').dataTable( {
    "aoColumnDefs": [
      { "bSearchable": false, "aTargets": [ 4 ] },
      { "bSortable": false, "aTargets": [ 4 ] },
      { "bVisible": false, "aTargets": [ 1, 3 ] }
    ], "bLengthChange": false, "iDisplayLength": 50 } 
  );

  $('.people-datatable').dataTable( {
    "aoColumnDefs": [
      { "bSearchable": false, "aTargets": [ 2 ] },
      { "bSortable": false, "aTargets": [ 2 ] }
    ], "bLengthChange": false, "iDisplayLength": 50 } 
  );

  $(".chosen-select").chosen({allow_single_deselect: true});
});
