class Game.Player
  constructor: (position, sprite) ->
    @sprite = sprite
    @speed = 400
    @direction = 0

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
