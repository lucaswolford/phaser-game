describe 'Player', ->
  beforeEach ->
    @player = new Game.Player(600)

  it 'has position', ->
    expect(@player.x).toBe(600)
