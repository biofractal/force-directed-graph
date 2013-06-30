#= require `./common/domain.min.js`

bots = []
edge = EdgeBounce
noise = 0

$ -> 
	$('.reset-bots').change resetBots
	$('.reset-options').change resetOptions
	canvas = $('<canvas id="processing-canvas">').appendTo($('#screen'))[0]
	new Processing canvas, main

main=(p)->
	Animator.setup p
	resetBots()
	p.draw=->
		p.background 51
		processBots()

resetBots=->
	bots=[]
	count = parseInt $('#count').val()
	switch $('#type').val()
		when 'spokes' then bots = bots.concat BotBuilder.graphSpokes() for i in [1..count]
		when 'swarm' then bots = bots.concat BotBuilder.graphSwarm() for i in [1..count]
		when 'molecule' then bots = bots.concat BotBuilder.graphMolecule() for i in [1..count]
		when 'blossom' then bots = bots.concat BotBuilder.graphBlossom() for i in [1..count]
	bots

resetOptions=->
	Spring.isActive = $('#springs-active').is(':checked')
	Magnet.isActive = $('#magnets-active').is(':checked')
	noise = $('#noise-scale').val()
	switch $('#edge').val()
		when 'bounce' then edge = EdgeBounce
		when 'wrap' then edge = EdgeWrap
	null

processBots=->
	applyForces bot for bot in bots
	bot.move() for bot in bots
	bot.drawLines() for bot in bots if Spring.isActive
	bot.drawShape() for bot in bots
	Mouse.drawShape() if Mouse.isActive

applyForces=(bot)->
	Spring.applyForce bot, friend for friend in bot.friends if Spring.isActive
	Magnet.applyForce bot, other for other in bots when other!=bot if Magnet.isActive
	Mouse.applyForce bot if Mouse.isActive
	Drag.applyForce bot 
	Noise.applyForce bot, noise
	edge.applyForce bot