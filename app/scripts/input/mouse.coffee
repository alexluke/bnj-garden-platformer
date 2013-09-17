define ->
    class Mouse
        constructor: (screen) ->
            @x = 0
            @y = 0
            @leftButton = false
            @middleButton = false
            @rightButton = false

            document.addEventListener 'mousemove', (e) =>
                @x = e.pageX - screen.x
                @y = e.pageY - screen.y

            document.addEventListener 'mousedown', (e) =>
                e.preventDefault()
                switch e.button
                    when 0 then @leftButton = true
                    when 1 then @middleButton = true
                    when 2 then @rightButton = true

            document.addEventListener 'mouseup', (e) =>
                e.preventDefault()
                switch e.button
                    when 0 then @leftButton = false
                    when 1 then @middleButton = false
                    when 2 then @rightButton = false

