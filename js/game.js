(function() {
  var WINDOW_HEIGHT, WINDOW_WIDTH, create, game, gofull, keys, player, preload, update;

  WINDOW_WIDTH = 960;

  WINDOW_HEIGHT = 540;

  keys = null;

  player = null;

  preload = function() {
    return game.load.image('jake', 'assets/Jake.png');
  };

  create = function() {
    var sprite;
    keys = game.input.keyboard.createCursorKeys();
    sprite = game.add.sprite(0, 200, 'jake');
    player = new Game.Player(game.world.centerX, sprite);
    game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT;
    return game.input.onDown.add(gofull, this);
  };

  update = function() {
    return player.update(keys, WINDOW_WIDTH);
  };

  gofull = function() {
    return game.scale.startFullScreen();
  };

  game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
  });

}).call(this);
