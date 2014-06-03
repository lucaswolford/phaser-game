describe 'Room', ->
  beforeEach ->
    @room = new Game.Room('texture_name')

  it 'should store the texture name', ->
    expect( @room.texture ).toBe 'texture_name'
