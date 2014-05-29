class Game.Player
  constructor: (position, sprite) ->
    @sprite = sprite
    @x = position
    @speed = 10

  position:
    @x

  update: (keys, window_width) ->
    if (keys.right.isDown && @x < window_width)
      @x += @speed
    if (keys.left.isDown && @x > 0)
      @x -= @speed
    @sprite.x = @x
    @sprite.update()
