(function() {
  Game.Player = (function() {
    function Player(position, sprite) {
      this.sprite = sprite;
      this.speed = 400;
      this.direction = 0;
    }

    Player.prototype.update = function(keys) {
      this.sprite.body.setZeroVelocity();
      if (keys.right.isDown) {
        this.sprite.body.moveRight(this.speed);
        if (this.direction === 1) {
          this.sprite.scale.x *= -1;
        }
        this.direction = 0;
      }
      if (keys.left.isDown) {
        this.sprite.body.moveLeft(this.speed);
        if (this.direction === 0) {
          this.sprite.scale.x *= -1;
        }
        this.direction = 1;
      }
      return this.sprite.update();
    };

    return Player;

  })();

}).call(this);
