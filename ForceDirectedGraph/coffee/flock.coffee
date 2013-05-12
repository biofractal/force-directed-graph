#= require `./common/domain.min.js`


bots = []
obstacles = []
attractors = []

$ ->
	$('#reset-obstacles').click resetObstacles
	$('.reset-obstacles').change resetObstacles
	$('.reset-attractors').change resetAttractors
	$('.reset-bots').change resetBots
	canvas = $('<canvas id="processing-canvas">').appendTo($('#screen'))[0]
	x = new Processing canvas, main

main=(p)->
	Animator.setup p
	resetObstacles()
	resetAttractors()
	resetBots()
	p.draw=->
		p.background 51
		processObstacles()
		processAttractors()
		processBots()

processObstacles=->
	obstacle.drawShape() for obstacle in obstacles if Repulsor.isVisible

processAttractors=->
	applyUniversalForces attractor for attractor in attractors
	Drag.applyForce attractor, 0.001 for attractor in attractors
	attractor.move() for attractor in attractors
	attractor.drawShape() for attractor in attractors if Attractor.isVisible

processBots=->
	applyUniversalForces bot for bot in bots
	obstacle.applyForce bot for bot in bots for obstacle in obstacles
	attractor.applyForce bot for bot in bots for attractor in attractors
	Drag.applyForce bot for bot in bots
	bot.move() for bot in bots
	bot.drawShape() for bot in bots

applyUniversalForces=(bot)->
	Magnet.applyForce bot, other for other in bots when other!=bot
	EdgeWrap.applyForce bot

resetObstacles=->
	Repulsor.isVisible = $('#obstacle-show').is(':checked')
	obstacleCount = parseInt $('#obstacle-count').val()
	obstacles = (new Repulsor() for i in [0...obstacleCount])
	null

resetAttractors=->
	Attractor.isVisible = $('#attractor-show').is(':checked')
	attractorCount = parseInt $('#attractor-count').val()
	attractors = (new Attractor() for i in [0...attractorCount])
	null

resetBots=->
	botCount = parseInt $('#bot-count').val()
	bots = BotBuilder.flock botCount
	null
