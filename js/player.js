(function() {
  Game.Player = (function() {
    function Player(position, sprite) {
      this.sprite = sprite;
      this.x = position;
      this.speed = 10;
    }

    Player.prototype.update = function(keys, window_width) {
      if (keys.right.isDown && this.x < window_width) {
        this.x += this.speed;
      }
      if (keys.left.isDown && this.x > 0) {
        this.x -= this.speed;
      }
      this.sprite.x = this.x;
      return this.sprite.update();
    };

    return Player;

  })();

}).call(this);
