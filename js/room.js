(function() {
  Game.Room = (function() {
    function Room(texture, doors) {
      this.texture = texture;
      this.doors = doors;
    }

    Room.prototype.texture = function() {
      return this.texture;
    };

    Room.prototype.get_doors = function() {
      return this.doors;
    };

    return Room;

  })();

}).call(this);
