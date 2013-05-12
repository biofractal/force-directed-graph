class Magnet
	@isActive=true

	@applyForce=(bot1, bot2, k=10)->
		return if not Magnet.isActive
		force = Vector.sub bot1.location, bot2.location
		distance = force.mag()
		force.normalize()
		force.mult (k * bot1.mass * bot2.mass) / (distance * distance)
		bot1.accelerate force
