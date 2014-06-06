class Game.Door
  constructor: (game, position, room1, room2) ->
    @sprite = game?.add.sprite(position, 300, 'door')
    @position = position
    @room1 = room1
    @room2 = room2

# update: (current_room) ->
#   if @connects_to current_room
#     @sprite.update()
#   else
#     @sprite.kill()

  connecting_room: (current_room) ->
    if @room1 == current_room
      @room2
    else
      @room1

  connects_to: (room_index) ->
    room_index == @room1 || room_index == @room2
