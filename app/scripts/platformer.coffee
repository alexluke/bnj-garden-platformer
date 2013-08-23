define [
    'game'
    'texture'
    'sprite'
], (Game, Texture, Sprite) ->
    class Platformer extends Game
        init: ->
            texture = new Texture 'sprite', 81, 81
            @sprite = new Sprite texture, 50, 50

        draw: ->
            @sprite.draw @renderer
