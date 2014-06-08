(function() {
  var WINDOW_HEIGHT, WINDOW_WIDTH, bg, changeRooms, create, door0, door1, game, keys, keysGo, layer1, layer2, layer3, layer4, onKeyPress, player, preload, rm, update;

  WINDOW_WIDTH = 960;

  WINDOW_HEIGHT = 540;

  keys = null;

  player = null;

  bg = null;

  rm = null;

  door0 = null;

  door1 = null;

  keysGo = null;

  layer1 = null;

  layer2 = null;

  layer3 = null;

  layer4 = null;

  preload = function() {
    game.load.image('porygon', 'assets/porygon.png');
    game.load.image('door', 'assets/portal.png');
    game.load.image('layer1', 'assets/layer1.jpg');
    game.load.image('layer2', 'assets/layer2.png');
    game.load.image('layer3', 'assets/layer3.png');
    return game.load.image('layer4', 'assets/layer4.png');
  };

  create = function() {
    var key, _i, _len, _results;
    game.world.setBounds(0, 0, 3000, 540);
    game.physics.startSystem(Phaser.Physics.P2JS);
    layer1 = game.add.sprite(-500, 0, 'layer1');
    layer2 = game.add.sprite(-500, 0, 'layer2');
    layer3 = game.add.sprite(0, 0, 'layer3');
    layer4 = game.add.sprite(0, 0, 'layer4');
    door0 = new Game.Door(game, 1000, 0, 2);
    door1 = new Game.Door(game, 500, 0, 1);
    rm = new Game.RoomManager();
    rm.add_room('layer1', [door0, door1]);
    rm.add_room('layer1', [door1]);
    rm.add_room('layer1', [door0]);
    player = new Game.Player(game);
    keys = game.input.keyboard.createCursorKeys();
    keysGo = [game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR), game.input.keyboard.addKey(Phaser.Keyboard.ENTER)];
    _results = [];
    for (_i = 0, _len = keysGo.length; _i < _len; _i++) {
      key = keysGo[_i];
      _results.push(key.onDown.add(onKeyPress));
    }
    return _results;
  };

  onKeyPress = function() {
    var door, _i, _len, _ref, _results;
    _ref = rm.current_room().get_doors();
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      door = _ref[_i];
      if (door.sprite.overlap(player.sprite)) {
        _results.push(changeRooms(door));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  changeRooms = function(door) {
    var new_door, old_door, _i, _j, _len, _len1, _ref, _ref1, _results;
    _ref = rm.current_room().get_doors();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      old_door = _ref[_i];
      old_door.sprite.kill();
    }
    rm.set_current_room_index(door.connecting_room(rm.current_room_index));
    bg.loadTexture(rm.current_room_texture());
    _ref1 = rm.current_room().get_doors();
    _results = [];
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      new_door = _ref1[_j];
      _results.push(new_door.sprite.reset(new_door.position, 300, 0));
    }
    return _results;
  };

  update = function() {
    player.update(keys);
    layer1.x = game.camera.x / 5;
    return layer2.x = game.camera.x / 4;
  };

  game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
  });

}).call(this);