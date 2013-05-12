class Rnd
	@gate=(chance) ->
		passed = (Math.random() * 100) < chance
		return passed

	@next=(max=1, min=0) ->
		(Math.random() * max) + min

	@location=(margin=0)->
		new Vector(Rnd.next(Animator.width-margin, margin), Rnd.next(Animator.height-margin, margin))

	@velocity=->
		new Vector(Rnd.next(20)*Rnd.sign(), Rnd.next(20)*Rnd.sign())

	@sign=->
		if Rnd.gate(50) then 1 else -1