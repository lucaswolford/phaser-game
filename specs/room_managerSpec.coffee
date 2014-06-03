describe 'RoomManager', ->
  beforeEach ->
    @manager = new Game.RoomManager

  describe "room index", ->
    it 'should start current room as 0', ->
      expect( @manager.current_room_index ).toBe 0

    it 'can set current room', ->
      @manager.set_current_room_index( 1 )
      expect( @manager.current_room_index ).toBe 1

  describe '#add_room', ->
    it 'should add a new room', ->
      @manager.add_room('texture')
      expect( @manager.room_count() ).toBe 1


  describe '#current_room_texture', ->
    it 'should give the texture for the current room', ->
      @manager.add_room('texture')
      expect( @manager.current_room_texture() ).toBe 'texture'
