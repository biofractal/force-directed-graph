class Spring
	@isActive=true

	@applyForce=(bot1, bot2, k=0.01, restLength=50)->
		return if not Magnet.isActive
		force = Vector.sub bot1.location, bot2.location
		currentLength = force.mag()
		distance = restLength - currentLength
		force.normalize()
		force.mult k * distance
		bot1.accelerate force
		force.mult -1
		bot2.accelerate force
