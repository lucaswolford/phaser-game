(function() {
  Game.Player = (function() {
    function Player(position) {
      this.x = position;
      this.speed = 10;
    }

    Player.prototype.update = function(keys, window_width) {
      if (keys.right.isDown && this.x < window_width) {
        this.x += this.speed;
      }
      if (keys.left.isDown && this.x > 0) {
        return this.x -= this.speed;
      }
    };

    return Player;

  })();

}).call(this);
