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
//= require jquery
//= require rails-ujs
//= require chosen-jquery
//= require activestorage
//= require turbolinks
//= require sortablejs/Sortable.min
//= require_tree .

var updateSortOrder = function(ev, el){
    console.log(el);
    var $form = $(el).closest("form");
    var scheduleId = $form.find("[name='x_schedule_id']").val();
    var movieId = $form.find("[name='x_movie_id']").val();

    // Recreate sort order
    var order = {};
    var ids = [];
    var index = 1;
    $(".schedule-event").each(function(){
        var $schedule = $(this);
        if ($schedule.data("id")) {
            order["_" + $schedule.data("id")] = index++;
            ids.push($schedule.data("id"));
        }
    });

    $.ajax({
        url: "/movies/" + movieId + "/schedule/" + scheduleId + "/sort",
        type: "POST",
        success: function(){
            console.log("saved");
        },
        data: {
            order: order,
            ids: ids
        }
    })
}

var init = function(){
    const sortables = Array.from(document.querySelectorAll('.sortable-list'));
    sortables.forEach(el => {
        const sortable = new Sortable(el, {
            animation: 150,
            handle: '.drag-handle',
            direction: 'vertical',
            onEnd: (evt) => {
                updateSortOrder(evt, evt.item)
            }
        })
    });

    flatpickr(".flatpicker", {});
    flatpickr(".flatpicker-time", { time_24hr: true, enableTime: true,});
    $('.chosen-select').chosen({
        allow_single_deselect: true,
        no_results_text: 'No results matched',
        width: '200px'
    });



    /* memory fields
    $(".memoized-input").each(function(){
        var $in = $(this);
        var fieldName = "_field_" + $in.attr("name");

        $in.on("change", function(){
           localStorage.setItem(fieldName, $in.val());
        });

        var memory = localStorage.getItem(fieldName);
        if (memory){
            $in.val(memory);
        }
    })*/
};

$(init)
$(document).on('turbolinks:load', init);
