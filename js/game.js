(function() {
  var WINDOW_HEIGHT, WINDOW_WIDTH, create, game, keys, player, preload, update;

  WINDOW_WIDTH = 960;

  WINDOW_HEIGHT = 540;

  keys = null;

  player = null;

  preload = function() {
    game.load.image('jake', 'assets/Jake2.png');
    return game.load.image('background', 'assets/wallpaper.png');
  };

  create = function() {
    var playerSprite;
    game.add.tileSprite(0, 0, 5000, 540, 'background');
    game.world.setBounds(0, 0, 5000, 540);
    game.physics.startSystem(Phaser.Physics.P2JS);
    keys = game.input.keyboard.createCursorKeys();
    playerSprite = game.add.sprite(0, 400, 'jake');
    playerSprite.cameraOffset.x = game.world.centerX;
    game.camera.follow(playerSprite);
    game.physics.p2.enable(playerSprite);
    return player = new Game.Player(game.world.centerX, playerSprite);
  };

  update = function() {
    return player.update(keys);
  };

  game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
  });

}).call(this);
