(function() {
  var WINDOW_HEIGHT, WINDOW_WIDTH, circle, create, game, gofull, keys, movement_speed, player, render, update;

  WINDOW_WIDTH = 960;

  WINDOW_HEIGHT = 540;

  movement_speed = 10;

  circle = null;

  keys = null;

  player = null;

  create = function() {
    player = new Game.Player(game.world.centerX, movement_speed);
    circle = new Phaser.Circle(player.position, 400, 64);
    game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT;
    game.input.onDown.add(gofull, this);
    return keys = game.input.keyboard.createCursorKeys();
  };

  update = function() {
    player.update(keys, WINDOW_WIDTH);
    return circle.x = player.x;
  };

  render = function() {
    return game.debug.geom(circle, '#cfffff');
  };

  gofull = function() {
    return game.scale.startFullScreen();
  };

  game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
    create: create,
    update: update,
    render: render
  });

}).call(this);
