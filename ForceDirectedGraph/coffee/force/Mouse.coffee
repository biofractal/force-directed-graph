class Mouse
	@k=0.7
	@applyForce=(bot)->
		p = window.processing
		vm = new Vector p.mouseX, p.mouseY
		direction = Vector.sub vm , bot.location
		direction.normalize()
		direction.mult Mouse.k
		bot.applyForce direction