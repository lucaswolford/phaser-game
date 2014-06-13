class Game.Player
  @RIGHT = 1
  @LEFT = 2

  constructor: (game) ->
    @sprite = game.add.sprite(400, 400, 'wife')
    @sprite.cameraOffset.x = game.world.centerX
    game.camera.follow(@sprite)
    game.physics.p2.enable(@sprite)
    @speed = 400
    @direction = 0
    @moving = 0

    game.input.onDown.add( () =>
      @move(game)
    )
    game.input.onUp.add( () =>
      @stop(game)
    )

  x: ->
    @sprite.body.x

  update: (game) ->
    @sprite.body.setZeroVelocity()

    if @moving && @direction == Game.Player.RIGHT
      @moveRight()
    else if @moving && @direction == Game.Player.LEFT
      @moveLeft()

    @sprite.update()

  move: (game) =>
    if (game.input.keyboard.isDown(Phaser.Keyboard.LEFT)) ||
        (game.input.activePointer.isDown && (@sprite.x - game.input.x)  > game.camera.x)
      @setMovingLeft()
    if (game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)) ||
        (game.input.activePointer.isDown && (@sprite.x - game.input.x) < game.camera.x)
      @setMovingRight()

  stop: (game) =>
    @moving = false

  setMovingRight: ->
    @moving = true
    @flip_sprite() if @direction == Game.Player.LEFT
    @direction = Game.Player.RIGHT

  setMovingLeft: ->
    @moving = true
    @flip_sprite() if @direction == Game.Player.RIGHT
    @direction = Game.Player.LEFT

  moveRight: ->
    @sprite.body.moveRight(@speed)
  moveLeft: ->
    @sprite.body.moveLeft(@speed)

  flip_sprite: ->
    @sprite.scale.x *= -1
