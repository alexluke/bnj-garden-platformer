define [
    'sprite'
    'texture'
    'sprites/fireball'
], (Sprite, Texture, Fireball) ->
    class Wizard extends Sprite
        constructor: (x, y) ->
            scale = 8
            super new Texture('wizard', scale), x, y

            @handOffset =
                x: 16 * scale
                y: 25 * scale
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
                fireball = new Fireball @x + @handOffset.x, @y + @handOffset.y
                @fireballs.push fireball
                @lastFireball = now
