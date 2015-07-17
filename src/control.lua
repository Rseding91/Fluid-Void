require "defines"

local loaded

function ticker()
	if global.pipes ~= nil then
		if global.ticks == 0 or global.ticks == nil then
			global.ticks = 519
			processPipes()
		else
			global.ticks = global.ticks - 1
		end
	else
		game.on_event(defines.events.on_tick, nil)
	end
end

game.on_load(function()
	if not loaded then
		loaded = true
		
		if global.pipes ~= nil then
			game.on_event(defines.events.on_tick, ticker)
		end
	end
end)

game.on_init(function()
	loaded = true
	
	if global.pipes ~= nil then
		game.on_event(defines.events.on_tick, ticker)
	end
end)

function builtEntity(event)
	if event.created_entity.name == "void-pipe" then
		if global.pipes == nil then
			global.pipes = {}
			game.on_event(defines.events.on_tick, ticker)
		end
		
		table.insert(global.pipes, event.created_entity)
	end
end

game.on_event(defines.events.on_built_entity, builtEntity)
game.on_event(defines.events.on_robot_built_entity, builtEntity)

function processPipes()
	for k,pipe in pairs(global.pipes) do
		if pipe.valid then
			pipe.fluidbox[1] = nil
		else
			table.remove(global.pipes, k)
			if #global.pipes == 0 then
				global.pipes = nil
			end
		end
	end
end