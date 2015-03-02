local voidPipe = util.table.deepcopy(data.raw["pipe"]["pipe"])
voidPipe.name = "void-pipe"
voidPipe.fluid_box.base_area = 500
voidPipe.minable.result = "void-pipe"
for _,v in pairs(voidPipe["pictures"]) do
	v.tint = {r=0.333, g=0.086, b=0.376, a=0.6}
end
data:extend({voidPipe})