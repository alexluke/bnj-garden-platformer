define ->
    class CanvasRenderer
        @create: (width, height) ->
            canvas = document.createElement 'canvas'
            canvas.width = width
            canvas.height = height

            new CanvasRenderer canvas

        constructor: (canvasEl) ->
            if typeof canvasEl == 'string'
                @canvas = document.getElementById canvasEl
            else
                @canvas = canvasEl

            if not @canvas.getContext
                throw 'No canvas support'

            @ctx = @canvas.getContext '2d'
            @screen =
                x: @canvas.offsetLeft
                y: @canvas.offsetTop
                width: @canvas.width
                height: @canvas.height

        drawTexture: (texture, x, y) ->
            @ctx.putImageData texture.data, x, y
