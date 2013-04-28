class Magnet
	@k=1
	@applyForce=(bot1, bot2)->
		force = Vector.sub bot1.location, bot2.location
		distance = force.mag()
		force.normalize()
		force.mult (Magnet.k * bot1.mass * bot2.mass) / (distance * distance)
		bot1.applyForce force
