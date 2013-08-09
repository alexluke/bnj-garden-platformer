define ->
    class CanvasRenderer
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

