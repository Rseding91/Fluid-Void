require "defines"

function ticker()
	if global.pipes ~= nil then
		if global.ticks == 0 or global.ticks == nil then
			global.ticks = 519
			processPipes()
		else
			global.ticks = global.ticks - 1
		end
	else
		script.on_event(defines.events.on_tick, nil)
	end
end

script.on_load(function()
  if global.pipes ~= nil then
    script.on_event(defines.events.on_tick, ticker)
  end
end)

function builtEntity(event)
	if event.created_entity.name == "void-pipe" then
		if global.pipes == nil then
			global.pipes = {}
			script.on_event(defines.events.on_tick, ticker)
		end
		
		table.insert(global.pipes, event.created_entity)
	end
end

script.on_event(defines.events.on_built_entity, builtEntity)
script.on_event(defines.events.on_robot_built_entity, builtEntity)

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