define [
    'sprite'
    'texture'
], (Sprite, Texture) ->
    class Fireball extends Sprite
        constructor: (x, y) ->
            super new Texture('fireball', 8), x, y
            @speed =
                x: 30
                y: 0

        update: (delta) ->
            @x += @speed.x * delta
            @y += @speed.y * delta
