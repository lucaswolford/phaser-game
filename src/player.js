function Player(position, speed) {
  this.x = position;
  this.speed = speed;

  this.update = function(){
    if (keys.right.isDown && player.x < WINDOW_WIDTH){ player.x += movement_speed; }
    if (keys.left.isDown && player.x > 0){ player.x -= movement_speed; }
  }
}
