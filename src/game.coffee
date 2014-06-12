WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

keys = null
player = null
bg = null
rm = null
door0 = null
door1 = null
keysGo = null
layer1 = null
layer2 = null
layer3 = null
layer4 = null
lighting = null

preload = ->
  game.load.image('wife', 'assets/gnome_wife.png')
  game.load.image('door', 'assets/portal.png')
  game.load.image('layer1', 'assets/layer1.jpg')
  game.load.image('layer2', 'assets/layer2.png')
  game.load.image('layer3', 'assets/layer3.png')
  game.load.image('layer4', 'assets/layer4.png')
  game.load.image('light', 'assets/light.png')

create = ->
  game.world.setBounds(0, 0, 2500, 540)
  game.physics.startSystem(Phaser.Physics.P2JS)

  layer1 = game.add.sprite(-500, 0, 'layer1')
  layer2 = game.add.sprite(-500, 0, 'layer2')
  layer3 = game.add.sprite(0, 0, 'layer3')

  door0 = new Game.Door(game, 1000, 0, 2)
  door1 = new Game.Door(game, 500, 0, 1)

  rm = new Game.RoomManager()
  rm.add_room('layer1', [door0, door1])
  rm.add_room('layer1', [door1])
  rm.add_room('layer1', [door0])

  player = new Game.Player(game)
  lighting = game.add.sprite(0, 0, 'light')

  layer4 = game.add.sprite(0, 0, 'layer4')

  game.input.keyboard.addKey(Phaser.Keyboard.RIGHT)
  game.input.keyboard.addKey(Phaser.Keyboard.LEFT)
  # set keyboard callbacks
  keysGo = [ game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR),
             game.input.keyboard.addKey(Phaser.Keyboard.ENTER) ]
  for key in keysGo
    key.onDown.add(onKeyPress)

onKeyPress = ->
  for door in rm.current_room().get_doors()
    if door.sprite.overlap(player.sprite)
      changeRooms( door )

changeRooms = (door) ->
  for old_door in rm.current_room().get_doors()
    old_door.sprite.kill()

  rm.set_current_room_index(door.connecting_room(rm.current_room_index))
  bg.loadTexture(rm.current_room_texture())

  for new_door in rm.current_room().get_doors()
    new_door.sprite.reset(new_door.position, 300, 0)

update = ->
  player.update(game)
  lighting.x = player.x() - 1100

  layer1.x = (game.camera.x / 3)
  layer2.x = (game.camera.x / 5)
  layer4.x = (game.camera.x / -4.5)

game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update})
