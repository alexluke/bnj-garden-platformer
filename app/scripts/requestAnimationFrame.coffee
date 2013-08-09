define ->
    window.requestAnimationFrame or
        window.webkitRequestAnimationFrame or
        window.mozRequestAnimationFrame or
        window.oRequestAnimationFrame or
        (callback) ->
            window.setInterval callback, 1000 / 60
