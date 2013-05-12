class Mouse
	@isActive=false

	@applyForce=(bot, k = 0.7)->
		return if not Mouse.isActive
		p = Animator.processing
		vm = new Vector p.mouseX, p.mouseY
		direction = Vector.sub vm, bot.location
		direction.normalize()
		direction.mult k
		bot.accelerate direction