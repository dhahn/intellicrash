# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).on "click", '#teacher1', ->
    id = $(this).attr('data-teacher1')
    id2 = $('#teacher2').attr('data-teacher2')
    $(this).replaceWith(" <img src='/assets/ajax-loader.gif' class='span3 offset2'/>")
    $('#teacher2').replaceWith(" <img src='/assets/ajax-loader.gif' class='span3 offset2'/>")
    $.getScript("/teachers/t1/update_scores/"+id+"/"+id2)
$(document).on "click", '#teacher2', ->
    id = $('#teacher1').attr('data-teacher1')
    id2 = $(this).attr('data-teacher2')
    $(this).replaceWith(" <img src='/assets/ajax-loader.gif' class='span3 offset2'/>")
    $('#teacher1').replaceWith(" <img src='/assets/ajax-loader.gif' class='span3 offset2'/>")
    $.getScript("/teachers/t2/update_scores/"+id+"/"+id2)
$(document).ready ->
    $('.teacher-img').click ->
        $('.teacher-img').replaceWith("#replaceStuff")
