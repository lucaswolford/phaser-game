WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

movement_speed = 10
circle = null
keys = null
player = null

create = ->
  player = new Game.Player(game.world.centerX, movement_speed)
  circle = new Phaser.Circle(player.position, 400,64)

  game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT

  game.input.onDown.add(gofull, this)

  keys = game.input.keyboard.createCursorKeys()

update = ->
  player.update(keys, WINDOW_WIDTH)
  circle.x = player.x

render = ->
  game.debug.geom(circle,'#cfffff')

gofull = ->
  game.scale.startFullScreen()

game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  create: create,
  update: update,
  render: render })
