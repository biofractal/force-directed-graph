class Attractor
	@isVisible = true
	constructor:->
		@p = window.processing
		@mass = 2
		@acceleration = new Vector
		@velocity = Rnd.velocity()
		@location = Rnd.location()
		@accelerationChance = 0

	move:->
		@changeVector()
		@velocity.add @acceleration 
		@velocity.limit 3
		@location.add @velocity
		@acceleration.mult 0

	changeVector:->
		@accelerationChance++
		return if !Rnd.gate(@accelerationChance/1000)
		@accelerationChance = 0
		x= Rnd.next(20) * Rnd.sign()
		y= Rnd.next(20) * Rnd.sign()
		@accelerate new Vector x, y

	drawShape:->
		return if !Attractor.isVisible
		@p.pushMatrix()
		@p.translate @location.x, @location.y
		@p.rotate @velocity.heading();
		@p.scale 0.5 + @mass/8
		@p.fill 255, 128, 128
		@p.stroke 255, 0, 0
		@p.triangle -4, 4, 8, 0, -4, -4
		@p.popMatrix()

	applyForce:(bot)->
		force = Vector.sub @location, bot.location
		force.normalize()
		bot.accelerate force

	accelerate:(force)->
		@acceleration.add Vector.div(force, @mass)