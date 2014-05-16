(function() {
  describe('Player', function() {
    beforeEach(function() {
      return this.player = new Game.Player(600);
    });
    return it('has position', function() {
      return expect(this.player.x).toBe(600);
    });
  });

}).call(this);
