define [
    'animatedSprite'
], (AnimatedSprite) ->
    class Fireball extends AnimatedSprite
        constructor: (x, y) ->
            super 'fireball', x, y, 3, .15
            @speed =
                x: 240
                y: 0

        update: (delta, now) ->
            super delta, now
            @x += @speed.x * delta
            @y += @speed.y * delta
