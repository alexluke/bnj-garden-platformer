define [
    'game'
    'sprites/wizard'
], (Game, Wizard) ->
    class Platformer extends Game
        init: ->
            @wizard = new Wizard 50, 50

        draw: ->
            @renderer.clear()
            @wizard.draw @renderer

        update: (delta, now) ->
            @wizard.update delta

            if @mouse.leftButton
                @wizard.shoot now
