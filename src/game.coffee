WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

keys = null
player = null

preload = ->
  game.load.image('jake', 'assets/Jake.png')

create = ->
  keys = game.input.keyboard.createCursorKeys()

  sprite = game.add.sprite(0, 200, 'jake')
  player = new Game.Player(game.world.centerX, sprite)

  game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT

update = ->
  player.update(keys, WINDOW_WIDTH)

game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update})
