class Random
	@chance = 0.5
	@scale = 2
	@applyForce=(bot)->
		return if Rnd.gate(100-Random.chance)
		x= Rnd.next(Random.scale * bot.mass) * Rnd.sign()
		y= Rnd.next(Random.scale * bot.mass) * Rnd.sign()
		bot.applyForce new Vector x, y