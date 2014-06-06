class Game.Room
  constructor: (texture, doors) ->
    @texture = texture
    @doors = doors

  texture: ->
    @texture

  get_doors: ->
    @doors
