WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

player = null
door = null
tree = null

preload = ->
  game.load.image('wife', 'assets/gnome_wife.png')
  game.load.image('door', 'assets/portal.png')
  game.load.image('tree', 'assets/tree1.png')

create = ->
  game.world.setBounds(0, 0, 2500, 540)
  game.physics.startSystem(Phaser.Physics.P2JS)

  levelBuilder = new Game.LevelBuilder(game)

  player = new Game.Player(game)

update = ->
  player.update(game)

game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update})
