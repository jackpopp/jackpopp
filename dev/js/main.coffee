resize = ->
	$('.pull').css
		'height': $(window).height(),
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

	$('body').addClass('show')

	$(window).resize -> resize()

	$(window).scroll -> parallax()

	new WOW().init()
	