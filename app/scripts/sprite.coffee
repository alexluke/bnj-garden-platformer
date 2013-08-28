define ->
    class Sprite
        constructor: (@texture, @x, @y) ->
            @width = @texture.width
            @height = @texture.height

        draw: (renderer) ->
            renderer.drawTexture @texture, @x, @y

        update: (delta, time) ->
