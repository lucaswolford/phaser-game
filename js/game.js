(function() {
  var WINDOW_HEIGHT, WINDOW_WIDTH, create, game, keys, player, preload, update;

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
    return game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT;
  };

  update = function() {
    return player.update(keys, WINDOW_WIDTH);
  };

  game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
  });

}).call(this);
