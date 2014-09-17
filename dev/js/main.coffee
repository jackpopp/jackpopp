interval = null
timeout = null

resize = (widthOnly = false) ->

	if widthOnly
		$('.pull').css
			'width': $(window).width()
	else
		$('.pull').css
			'height': $(window).height()
			'width': $(window).width()

		$('.main-content').css
			'margin-top': $(window).height()
			'min-height': $(window).height()


	#$('.main-content').find('.content-holder').each ->
	#	$(this).css 'height', $(this).width()
	return

parallax = ->
	val = 1 - ($(window).scrollTop()/$(window).height()*1.2)

	if val > 0
		$('.heading').css 'opacity', val
	return

###
	Create an interval to force the page to scroll to the top, once it has reached the top
	kill the interval
###

setToTop = ->
	if interval is null
		interval = setInterval(
			-> 	
				setToTop()
			50
		)

	if $(window).scrollTop() > 0
		timeout = setTimeout(
				-> 
					$(window).scrollTop(0)
					clearInterval(interval)
					clearTimeout(timeout)
			200
		)
	return

setEventHandlers = ->
	$(window).resize -> resize(true)
	$(window).scroll -> parallax()
	return

construct = ->
	setToTop()
	resize()
	setEventHandlers()

	setTimeout(
			-> $('body').addClass('show')
		50
	)

	new WOW().init()
	return

$ ->
	construct()
	


	
	