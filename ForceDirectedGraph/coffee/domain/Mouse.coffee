class Mouse
	@isActive=false

	@applyForce=(bot, k = 0.7)->
		return if not Mouse.isActive
		p = Animator.processing
		location = new Vector p.mouseX, p.mouseY
		direction = Vector.sub location, bot.location
		direction.normalize()
		direction.mult k
		bot.accelerate direction

	@drawShape=->
		return if not Mouse.isActive
		p = Animator.processing
		p.pushMatrix()
		p.fill 128, 128, 255
		p.stroke 0, 0, 255
		p.ellipse p.mouseX, p.mouseY, 10, 10
		p.popMatrix()