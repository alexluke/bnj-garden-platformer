define [
    'sprite'
    'texture'
], (Sprite, Texture) ->
    class AnimatedSprite extends Sprite
        constructor: (textureName, @x, @y, @numFrames, @frameTime) ->
            @textures = []

            for i in [1..@numFrames]
                @textures.push new Texture "#{ textureName }_#{ i }", 8

            @width = @textures[0].width
            @height = @textures[0].height

            @currentFrame = 0
            @timeSinceLastFrame = 0

        draw: (renderer) ->
            renderer.drawTexture @textures[@currentFrame], @x, @y
            
        update: (delta, time) ->
            @timeSinceLastFrame += delta
            if @timeSinceLastFrame > @frameTime
                @currentFrame++
                @timeSinceLastFrame = 0
            if @currentFrame >= @numFrames
                @currentFrame = 0
