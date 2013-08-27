define [
    'renderers/canvas'
], (CanvasRenderer) ->
    class Texture
        constructor: (el, @scale) ->
            image = document.getElementById el
            throw "Cannot load image from #{ el }" unless image

            @width ?= image.width * @scale
            @height ?= image.height * @scale

            canvas = CanvasRenderer.create image.width, image.height
            canvas.ctx.drawImage image, 0, 0

            if scale == 0
                @data = canvas.canvas
            else
                originalData = canvas.ctx.getImageData 0, 0, image.width, image.height
                scaled = canvas.ctx.createImageData originalData.width * scale, originalData.height * scale

                for row in [0...originalData.height]
                    for col in [0...originalData.width]
                        sourcePixel = [
                            originalData.data[(row * originalData.width + col) * 4 + 0]
                            originalData.data[(row * originalData.width + col) * 4 + 1]
                            originalData.data[(row * originalData.width + col) * 4 + 2]
                            originalData.data[(row * originalData.width + col) * 4 + 3]
                        ]

                        for y in [0...scale]
                            destRow = row * scale + y
                            for x in [0...scale]
                                destCol = col * scale + x
                                for i in [0..3]
                                    scaled.data[(destRow * scaled.width + destCol ) * 4 + i] = sourcePixel[i]

                canvas = CanvasRenderer.create scaled.width, scaled.height
                canvas.ctx.putImageData scaled, 0, 0
                @data = canvas.canvas

