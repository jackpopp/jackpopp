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

$ ->
	resize()

	setTimeout(
			-> $('body').addClass('show')
		200
	)

	$(window).resize -> resize(true)

	$(window).scroll -> parallax()

	new WOW().init()
	