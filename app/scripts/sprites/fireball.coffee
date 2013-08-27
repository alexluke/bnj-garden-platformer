define [
    'sprite'
    'texture'
], (Sprite, Texture) ->
    class Fireball extends Sprite
        constructor: (x, y) ->
            scale = 8
            super new Texture('fireball', scale), x, y
            @speed =
                x: 30 * scale
                y: 0

        update: (delta) ->
            @x += @speed.x * delta
            @y += @speed.y * delta
