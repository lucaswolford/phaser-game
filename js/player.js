(function() {
  Game.Player = (function() {
    function Player(game) {
      this.sprite = game.add.sprite(400, 400, 'wife');
      this.sprite.cameraOffset.x = game.world.centerX;
      game.camera.follow(this.sprite);
      game.physics.p2.enable(this.sprite);
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

    Player.prototype.x = function() {
      return this.sprite.x;
    };

    return Player;

  })();

}).call(this);
