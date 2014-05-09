
const WINDOW_WIDTH = 960;
const WINDOW_HEIGHT = 540;
var game = new Phaser.Game(WINDOW_WIDTH, WINDOW_HEIGHT, Phaser.CANVAS, '',
                           { create: create, update: update, render: render });
const movement_speed = 10;
var circle;
var keys;

var player;

function create() {

    player = new Player(game.world.centerX, movement_speed);
    circle = new Phaser.Circle(player.position, 400,64);

    // Stretch to fill
    game.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT;

    game.input.onDown.add(gofull, this);

    keys = game.input.keyboard.createCursorKeys();
}

function gofull() {
  game.scale.startFullScreen();
}

function update(){

  player.update();
}

function render () {

    circle.x = player.x
    game.debug.geom(circle,'#cfffff');

}
