(function() {
  Game.RoomManager = (function() {
    function RoomManager() {
      this.rooms = [];
      this.current_room_index = 0;
    }

    RoomManager.prototype.add_room = function(texture, doors) {
      return this.rooms.push(new Game.Room(texture, doors));
    };

    RoomManager.prototype.get_rooms = function() {
      return this.rooms;
    };

    RoomManager.prototype.room_count = function() {
      return this.rooms.length;
    };

    RoomManager.prototype.set_current_room_index = function(room) {
      this.current_room_index = room;
      if (this.current_room_index < 0) {
        this.current_room_index = 0;
      }
      if (this.current_room_index > this.room_count() - 1) {
        return this.current_room_index = this.room_count() - 1;
      }
    };

    RoomManager.prototype.current_room = function() {
      return this.rooms[this.current_room_index];
    };

    RoomManager.prototype.current_room_texture = function() {
      return this.current_room().texture;
    };

    return RoomManager;

  })();

}).call(this);
