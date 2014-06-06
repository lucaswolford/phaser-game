WINDOW_WIDTH = 960
WINDOW_HEIGHT = 540

keys = null
player = null
bg = null
rm = null
door0 = null
door1 = null
keysGo = null

preload = ->
  game.load.image('porygon', 'assets/porygon.png')
  game.load.image('door', 'assets/portal.png')
  game.load.image('background0', 'assets/wallpaper.png')
  game.load.image('background1', 'assets/wallpaper2.jpg')
  game.load.image('background2', 'assets/wallpaper3.jpg')

create = ->
  bg = game.add.tileSprite(0, 0, 3000, 540, 'background')
  game.world.setBounds(0, 0, 3000, 540)
  game.physics.startSystem(Phaser.Physics.P2JS)

  keys = game.input.keyboard.createCursorKeys()

  door0 = new Game.Door(game, 1000, 0, 2)
  door1 = new Game.Door(game, 500, 0, 1)

  rm = new Game.RoomManager()
  rm.add_room('background0', [door0, door1])
  rm.add_room('background1', [door1])
  rm.add_room('background2', [door0])

  player = new Game.Player(game)

  #Keyboard
  keysGo = [ game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR),
             game.input.keyboard.addKey(Phaser.Keyboard.ENTER) ]
  for key in keysGo
    key.onDown.add(onKeyPress)

  bg.loadTexture(rm.current_room_texture())

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
  player.update(keys)

  console.log rm.current_room_index

game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update})
