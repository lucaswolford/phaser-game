class Game.Player
  constructor: (game) ->
    @sprite = game.add.sprite(400, 400, 'wife')
    @sprite.cameraOffset.x = game.world.centerX
    game.camera.follow(@sprite)
    game.physics.p2.enable(@sprite)
    @speed = 400
    @direction = 0

  update: (game) ->
    @sprite.body.setZeroVelocity()

    if (game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)) ||
        (game.input.mousePointer.isDown && (@sprite.x - game.input.x) < game.camera.x)
      @moveRight()
    if (game.input.keyboard.isDown(Phaser.Keyboard.LEFT)) ||
        (game.input.mousePointer.isDown && (@sprite.x - game.input.x) > game.camera.x)
      @moveLeft()

    @sprite.update()

  x: ->
    @sprite.x

  moveLeft: ->
    @sprite.body.moveLeft(@speed)
    @sprite.scale.x *= -1 if @direction == 0
    @direction = 1
  moveRight: ->
    @sprite.body.moveRight(@speed)
    @sprite.scale.x *= -1 if @direction == 1
    @direction = 0
