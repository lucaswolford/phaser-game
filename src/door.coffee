class Game.Door
  constructor: (room1, room2, position) ->
    @position = position
    @room1 = room1
    @room2 = room2

  connecting_room: (current_room) ->
    if @room1 == current_room
      @room2
    else
      @room1
