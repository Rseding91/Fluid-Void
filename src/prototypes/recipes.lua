local voidPipe = util.table.deepcopy(data.raw["recipe"]["pipe"])
voidPipe.name = "void-pipe"
voidPipe.ingredients[1] = {"pipe", 5}
voidPipe.result = "void-pipe"
data:extend({voidPipe})