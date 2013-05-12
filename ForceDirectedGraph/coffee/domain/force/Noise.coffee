class Noise
	@isActive = true

	@applyForce=(bot, chance = 5, scale = 2)->
		return if not @isActive or scale==0 or Rnd.gate(100-chance)
		x= Rnd.next(scale * bot.mass) * Rnd.sign()
		y= Rnd.next(scale * bot.mass) * Rnd.sign()
		bot.accelerate new Vector x, y