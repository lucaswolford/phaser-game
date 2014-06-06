describe 'Door', ->
  beforeEach ->
    @door = new Game.Door(null, 300, 1, 2)

  describe '#connecting_room', ->
    it 'starting from first room should be second', ->
      expect( @door.connecting_room(1) ).toBe 2

    it 'starting from second room should be first', ->
      expect( @door.connecting_room(2) ).toBe 1

  describe '#connects_to', ->
    it 'returns true when the door connects to the room', ->
      expect( @door.connects_to(1) ).toBe true
    it 'returns false when the door does not connect', ->
      expect( @door.connects_to(0) ).toBe false
