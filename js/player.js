(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Game.Player = (function() {
    Player.RIGHT = 1;

    Player.LEFT = 2;

    function Player(game) {
      this.stop = __bind(this.stop, this);
      this.move = __bind(this.move, this);
      this.sprite = game.add.sprite(400, 400, 'wife');
      this.sprite.cameraOffset.x = game.world.centerX;
      game.camera.follow(this.sprite);
      game.physics.p2.enable(this.sprite);
      this.speed = 400;
      this.direction = 0;
      this.moving = 0;
      game.input.onDown.add((function(_this) {
        return function() {
          return _this.move(game);
        };
      })(this));
      game.input.onUp.add((function(_this) {
        return function() {
          return _this.stop(game);
        };
      })(this));
    }

    Player.prototype.x = function() {
      return this.sprite.body.x;
    };

    Player.prototype.update = function(game) {
      this.sprite.body.setZeroVelocity();
      if (this.moving && this.direction === Game.Player.RIGHT) {
        this.moveRight();
      } else if (this.moving && this.direction === Game.Player.LEFT) {
        this.moveLeft();
      }
      return this.sprite.update();
    };

    Player.prototype.move = function(game) {
      if ((game.input.keyboard.isDown(Phaser.Keyboard.LEFT)) || (game.input.activePointer.isDown && (this.sprite.x - game.input.x) > game.camera.x)) {
        this.setMovingLeft();
      }
      if ((game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)) || (game.input.activePointer.isDown && (this.sprite.x - game.input.x) < game.camera.x)) {
        return this.setMovingRight();
      }
    };

    Player.prototype.stop = function(game) {
      return this.moving = false;
    };

    Player.prototype.setMovingRight = function() {
      this.moving = true;
      if (this.direction === Game.Player.LEFT) {
        this.flip_sprite();
      }
      return this.direction = Game.Player.RIGHT;
    };

    Player.prototype.setMovingLeft = function() {
      this.moving = true;
      if (this.direction === Game.Player.RIGHT) {
        this.flip_sprite();
      }
      return this.direction = Game.Player.LEFT;
    };

    Player.prototype.moveRight = function() {
      return this.sprite.body.moveRight(this.speed);
    };

    Player.prototype.moveLeft = function() {
      return this.sprite.body.moveLeft(this.speed);
    };

    Player.prototype.flip_sprite = function() {
      return this.sprite.scale.x *= -1;
    };

    return Player;

  })();

}).call(this);
