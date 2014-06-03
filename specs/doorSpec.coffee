describe 'Door', ->
  beforeEach ->
    @door = new Game.Door(1, 2, 300)

  describe '#connecting_room', ->
    it 'starting from first room should be second', ->
      expect( @door.connecting_room(1) ).toBe 2

    it 'starting from second room should be first', ->
      expect( @door.connecting_room(2) ).toBe 1
