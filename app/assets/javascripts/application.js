// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require chosen-jquery
//= require activestorage
//= require turbolinks
//= require_tree .


var init = function(){
    flatpickr(".flatpicker", {});
    flatpickr(".flatpicker-time", { time_24hr: true, enableTime: true,});
    $('.chosen-select').chosen({
        allow_single_deselect: true,
        no_results_text: 'No results matched',
        width: '200px'
    });

    // memory fields
    $("input, textarea").each(function(){
        var $in = $(this);
        var fieldName = "_field_" + $in.attr("name");

        $in.on("change", function(){
           localStorage.setItem(fieldName, $in.val());
        });

        var memory = localStorage.getItem(fieldName);
        if (memory){
            $in.val(memory);
        }
    })
};

$(init)
$(document).on('turbolinks:load', init);
