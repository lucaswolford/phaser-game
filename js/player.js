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

    Player.prototype.update = function(game) {
      this.sprite.body.setZeroVelocity();
      if ((game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)) || (game.input.mousePointer.isDown && (this.sprite.x - game.input.x) < game.camera.x)) {
        this.moveRight();
      }
      if ((game.input.keyboard.isDown(Phaser.Keyboard.LEFT)) || (game.input.mousePointer.isDown && (this.sprite.x - game.input.x) > game.camera.x)) {
        this.moveLeft();
      }
      return this.sprite.update();
    };

    Player.prototype.x = function() {
      return this.sprite.x;
    };

    Player.prototype.moveLeft = function() {
      this.sprite.body.moveLeft(this.speed);
      if (this.direction === 0) {
        this.sprite.scale.x *= -1;
      }
      return this.direction = 1;
    };

    Player.prototype.moveRight = function() {
      this.sprite.body.moveRight(this.speed);
      if (this.direction === 1) {
        this.sprite.scale.x *= -1;
      }
      return this.direction = 0;
    };

    return Player;

  })();

}).call(this);
