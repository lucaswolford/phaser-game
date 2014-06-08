(function() {
  Game.Door = (function() {
    function Door(game, position, room1, room2) {
      this.sprite = game != null ? game.add.sprite(position, 300, 'door') : void 0;
      this.position = position;
      this.room1 = room1;
      this.room2 = room2;
    }

    Door.prototype.connecting_room = function(current_room) {
      if (this.room1 === current_room) {
        return this.room2;
      } else {
        return this.room1;
      }
    };

    Door.prototype.connects_to = function(room_index) {
      return room_index === this.room1 || room_index === this.room2;
    };

    return Door;

  })();

}).call(this);
