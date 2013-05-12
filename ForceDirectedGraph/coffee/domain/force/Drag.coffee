class Drag
	@isActive=true

	@applyForce=(bot, k = 0.05)->
		return if not Drag.isActive
		speed = bot.velocity.mag()
		force = bot.velocity.get()
		force.mult -1
		force.normalize()
		force.mult k * speed * speed
		bot.accelerate force
