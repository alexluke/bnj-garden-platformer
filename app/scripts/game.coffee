define [
    'requestAnimationFrame'
    'renderers/canvas'
], (requestAnimationFrame, CanvasRenderer) ->
    class Game
        constructor: (canvasEl) ->
            @renderer = new CanvasRenderer canvasEl

            @init()

        start: ->
            @setupMouse()

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

        setupMouse: ->
            @mouse =
                x: 0
                y: 0
                leftButton: false
                middleButton: false
                rightButton: false

            document.addEventListener 'mousemove', (e) =>
                @mouse.x = e.pageX - @renderer.screen.x
                @mouse-y = e.pageY - @renderer.screen.y

            document.addEventListener 'mousedown', (e) =>
                e.preventDefault()
                switch e.button
                    when 0 then @mouse.leftButton = true
                    when 1 then @mouse.middleButton = true
                    when 2 then @mouse.rightButton = true

            document.addEventListener 'mouseup', (e) =>
                e.preventDefault()
                switch e.button
                    when 0 then @mouse.leftButton = false
                    when 1 then @mouse.middleButton = false
                    when 2 then @mouse.rightButton = false

        init: ->
        draw: ->
        update: ->
