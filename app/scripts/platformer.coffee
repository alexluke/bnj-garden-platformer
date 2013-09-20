define [
    'game'
    'sprites/wizard'
    'vector'
], (Game, Wizard, Vector) ->
    class Platformer extends Game
        init: ->
            @wizard = new Wizard 50, 50
            @gravity =  new Vector 1.5 * Math.PI, 9.8

        draw: ->
            @renderer.clear()
            @wizard.draw @renderer

        update: (delta, now) ->
            @wizard.update delta

            @wizard.y += @gravity.length * delta
            @wizard.move delta, @keyboard
            if @mouse.leftButton
                @wizard.shoot now
