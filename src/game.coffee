WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

keys = null
player = null
bg = null

preload = ->
  game.load.image('jake', 'assets/Jake2.png')
  game.load.image('background', 'assets/wallpaper.png')
  game.load.image('background2', 'assets/wallpaper2.jpg')

create = ->
  bg = game.add.tileSprite(0, 0, 5000, 540, 'background')
  game.world.setBounds(0, 0, 5000, 540)
  game.physics.startSystem(Phaser.Physics.P2JS)

  keys = game.input.keyboard.createCursorKeys()

  player = new Game.Player(game)

update = ->
  player.update(keys)

  if keys.up.isDown
    bg.loadTexture('background2', 0)

  if keys.down.isDown
    bg.loadTexture('background', 0)



game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update})
