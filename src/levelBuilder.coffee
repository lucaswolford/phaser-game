class Game.LevelBuilder
  constructor: (game) ->
    config = {
      trees:[
        {x:100, y:0},
        {x:150, y:0},
        {x:170, y:0},
      ],

      doors:[
        {x:200, y:0},
        {x:300, y:10},
        {x:400, y:30},
      ]
    }

    for tree in config.trees
      game.add.sprite(tree.x, tree.y, 'tree')

    for door in config.doors
      game.add.sprite(door.x, door.y, 'door')
