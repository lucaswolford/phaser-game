class Game.Player
  constructor: (game) ->
    @sprite = game.add.sprite(0, 400, 'porygon')
    @sprite.cameraOffset.x = game.world.centerX
    game.camera.follow(@sprite)
    game.physics.p2.enable(@sprite)
    @speed = 400
    @direction = 1

  update: (keys) ->
    @sprite.body.setZeroVelocity()

    if keys.right.isDown
      @sprite.body.moveRight(@speed)
      @sprite.scale.x *= -1 if @direction == 1
      @direction = 0
    if keys.left.isDown
      @sprite.body.moveLeft(@speed)
      @sprite.scale.x *= -1 if @direction == 0
      @direction = 1
    @sprite.update()
