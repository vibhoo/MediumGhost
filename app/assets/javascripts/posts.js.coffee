# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  $(document).ready ->
	  $("[data-behaviour~=datepicker]").datepicker
	    format: "dd/mm/yyyy"
	    language: "pt-BR"
	    todayHighlight: true
	    todayBtn: true

	  $(".has-tooltip").tooltip()

	  setTimeout( ->
	  	$(".alert").fadeOut()
	  	return
	  , 5000)

	  $("#wysihtml5-textarea").wysihtml5
	  	"font-styles": true 
		  emphasis: true 
		  lists: true 
		  html: false 
		  link: true 
		  image: true 
		  color: false 

		
		
	  return
  



