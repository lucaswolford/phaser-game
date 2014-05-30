(function() {
  var WINDOW_HEIGHT, WINDOW_WIDTH, bg, create, game, keys, player, preload, update;

  WINDOW_WIDTH = 960;

  WINDOW_HEIGHT = 540;

  keys = null;

  player = null;

  bg = null;

  preload = function() {
    game.load.image('jake', 'assets/Jake2.png');
    game.load.image('background', 'assets/wallpaper.png');
    return game.load.image('background2', 'assets/wallpaper2.jpg');
  };

  create = function() {
    bg = game.add.tileSprite(0, 0, 5000, 540, 'background');
    game.world.setBounds(0, 0, 5000, 540);
    game.physics.startSystem(Phaser.Physics.P2JS);
    keys = game.input.keyboard.createCursorKeys();
    return player = new Game.Player(game);
  };

  update = function() {
    player.update(keys);
    if (keys.up.isDown) {
      bg.loadTexture('background2', 0);
    }
    if (keys.down.isDown) {
      return bg.loadTexture('background', 0);
    }
  };

  game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
  });

}).call(this);
