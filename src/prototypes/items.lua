local voidPipe = util.table.deepcopy(data.raw["item"]["pipe"])
voidPipe.name = "void-pipe"
voidPipe.icon = "__Fluid Void__/graphics/void-pipe.png"
voidPipe.place_result = "void-pipe"
data:extend({voidPipe})