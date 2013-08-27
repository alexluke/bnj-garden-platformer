define [
    'sprite'
    'texture'
    'sprites/fireball'
], (Sprite, Texture, Fireball) ->
    class Wizard extends Sprite
        constructor: (x, y) ->
            super new Texture('wizard', 8), x, y

            @fireballCooldown = 2000
            @lastFireball = 0
            @fireballs = []

        draw: (renderer) ->
            super renderer
            f.draw renderer for f in @fireballs

        update: (delta) ->
            f.update delta for f in @fireballs
            return

        shoot: (now) ->
            if now - @lastFireball > @fireballCooldown
                fireball = new Fireball @x, @y
                @fireballs.push fireball
                @lastFireball = now
