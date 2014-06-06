class Game.RoomManager
  constructor: ->
    @rooms = []
    @current_room_index = 0

  add_room: (texture, doors) ->
    @rooms.push new Game.Room(texture, doors)

  get_rooms: ->
   @rooms

  room_count: ->
    @rooms.length

  set_current_room_index: (room) ->
    @current_room_index = room
    if @current_room_index < 0
      @current_room_index = 0
    if @current_room_index > @room_count() - 1
      @current_room_index = @room_count() - 1

  current_room: ->
    @rooms[ @current_room_index ]

  current_room_texture: ->
    @current_room().texture

