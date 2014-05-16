class Game.Player
  constructor: (position) ->
    @x = position
    @speed = 10

  update: (keys, window_width) ->
    if (keys.right.isDown && @x < window_width) then @x += @speed
    if (keys.left.isDown && @x > 0) then @x -= @speed
