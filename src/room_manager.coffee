class Game.RoomManager
  constructor: ->
    @rooms = []
    @current_room_index = 0

  add_room: (texture) ->
    @rooms.push new Game.Room(texture)

  get_rooms: ->
   @rooms

  room_count: ->
    @rooms.length

  set_current_room_index: (room) ->
    @current_room_index = room

  current_room: ->
    @rooms[ @current_room_index ]

  current_room_texture: ->
    @current_room().texture

