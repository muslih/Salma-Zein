// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap

//= require pickdate/picker
//= require pickdate/picker.date 
//= require pickdate/picker.time 
//= require_tree .
//= require_self

$(document).ready(function(){

    // demo.initChartist();

    // $.notify({
    //     icon: 'pe-7s-gift',
    //     message: "Welcome to <b>Salma Zein Dashboard</b> - a beautiful freebie for every web developer."

    //   },{
    //       type: 'info',
    //       timer: 4000
    //   });

});

$(document).on("focus", "[data-behaviour~='pickadate']", function(e) {
  $(this).pickadate({
  	selectYears: 40,
 	selectMonths: true
  })
});

$(document).on("change", ".item_select", function(e) {
  // console.log($(this));
  console.log($(this).find("option:selected").data('unit'));
  unit_val = $(this).find("option:selected").data('unit');
  $(this).parent().parent().parent().find('.unit input').val(unit_val);
});



// jQuery(function() {   
//    $('form').on('click', '.remove_fields', function(event) {   
//    $(this).prev('input[type=hidden]').val('1');   
//    $(this).closest('fieldset').hide();   
//    return event.preventDefault();   
//    });   
//    return $('form').on('click', '.add_fields', function(event) {   
//    var regexp, time;   
//    time = new Date().getTime();   
//    regexp = new RegExp($(this).data('id'), 'g');   
//    $(this).before($(this).data('fields').replace(regexp, time));   
//    return event.preventDefault();   
//    });   
//   });