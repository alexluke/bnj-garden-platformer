define [
    'requestAnimationFrame'
    'renderers/canvas'
    'input/keyboard'
    'input/mouse'
], (requestAnimationFrame, CanvasRenderer, Keyboard, Mouse) ->
    class Game
        constructor: (canvasEl) ->
            @renderer = new CanvasRenderer canvasEl

            @init()

        start: ->
            @mouse = new Mouse()
            @keyboard = new Keyboard()

            drawTick = =>
                @draw()
                requestAnimationFrame drawTick
            requestAnimationFrame drawTick

            @lastUpdate = +new Date
            updateTick = =>
                now = +new Date
                delta = (now - @lastUpdate) / 1000
                @lastUpdate = now
                @update delta, now
            setInterval updateTick, 1000 / 60

        init: ->
        draw: ->
        update: ->
