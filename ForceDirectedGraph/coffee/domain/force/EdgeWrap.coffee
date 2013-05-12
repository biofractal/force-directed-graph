class EdgeWrap

	@applyForce=(bot)->
		xMax = bot.location.x - Animator.width
		xMin = bot.location.x
		bot.location.x = 0 if (xMax > 0) 
		bot.location.x = Animator.width  if (xMin < 0) 

		yMax = bot.location.y - Animator.height
		yMin = bot.location.y
		bot.location.y = 0 if (yMax > 0) 
		bot.location.y = Animator.height  if (yMin < 0) 