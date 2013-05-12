class Animator
	@processing
	@width
	@height
	@midX
	@midY

	@setup=(p, width=855, height=500, background=51)->
		p.width = width
		p.height = height
		p.background background
		p.mousePressed = -> Mouse.isActive = !Mouse.isActive

		Animator.processing = p
		Animator.width = width
		Animator.height = height
		Animator.midX = (width/2)>>0
		Animator.midY = (height/2)>>0
		null