WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

keys = null
player = null
bg = null
rm = null

preload = ->
  game.load.image('porygon', 'assets/porygon.png')
  game.load.image('background', 'assets/wallpaper.png')
  game.load.image('background2', 'assets/wallpaper2.jpg')

create = ->
  bg = game.add.tileSprite(0, 0, 3000, 540, 'background')
  game.world.setBounds(0, 0, 3000, 540)
  game.physics.startSystem(Phaser.Physics.P2JS)

  keys = game.input.keyboard.createCursorKeys()

  player = new Game.Player(game)
  rm = new Game.RoomManager()

  rm.add_room('background')
  rm.add_room('background2')

update = ->
  player.update(keys)

  if keys.up.isDown
    rm.set_current_room_index(rm.current_room_index + 1)


  bg.loadTexture(rm.current_room_texture())


game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update})
