define [
    'renderers/canvas'
], (CanvasRenderer) ->
    class Texture
        constructor: (el, @width, @height) ->
            image = document.getElementById el
            throw "Cannot load image from #{ el }" unless image

            @width ?= image.width
            @height ?= image.height
            scaleX = @width / image.width
            scaleY = @height / image.height

            canvas = CanvasRenderer.create image.width, image.height
            canvas.ctx.drawImage image, 0, 0

            originalData = canvas.ctx.getImageData 0, 0, image.width, image.height

            if scaleX == 1 and scaleY == 1
                @data = originalData
            else
                scaled = canvas.ctx.createImageData originalData.width * scaleX, originalData.height * scaleY

                for row in [0...originalData.height]
                    for col in [0...originalData.width]
                        sourcePixel = [
                            originalData.data[(row * originalData.width + col) * 4 + 0]
                            originalData.data[(row * originalData.width + col) * 4 + 1]
                            originalData.data[(row * originalData.width + col) * 4 + 2]
                            originalData.data[(row * originalData.width + col) * 4 + 3]
                        ]

                        for y in [0...scaleY]
                            destRow = row * scaleY + y
                            for x in [0...scaleX]
                                destCol = col * scaleX + x
                                for i in [0..3]
                                    scaled.data[(destRow * scaled.width + destCol ) * 4 + i] = sourcePixel[i]

                @data = scaled

