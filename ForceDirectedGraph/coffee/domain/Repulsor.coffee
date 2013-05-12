class Repulsor
	@isVisible = true
	constructor:->
		@p = Animator.processing
		@mass = Rnd.next 500, 200
		@size = @mass/10
		@location = Rnd.location @size

	drawShape:->
		return if !Repulsor.isVisible
		@p.pushMatrix()
		@p.fill 102
		@p.stroke 128, 64, 64
		@p.ellipse @location.x, @location.y, @size, @size
		@p.popMatrix()

	applyForce:(bot)->
		Magnet.applyForce bot, @, 2