require "defines"

local loaded

function ticker()
	if glob.pipes ~= nil then
		if glob.ticks == 0 or glob.ticks == nil then
			glob.ticks = 519
			processPipes()
		else
			glob.ticks = glob.ticks - 1
		end
	else
		game.onevent(defines.events.ontick, nil)
	end
end

game.onload(function()
	if not loaded then
		loaded = true
		
		if glob.pipes ~= nil then
			game.onevent(defines.events.ontick, ticker)
		end
	end
end)

game.oninit(function()
	loaded = true
	
	if glob.pipes ~= nil then
		game.onevent(defines.events.ontick, ticker)
	end
end)

function builtEntity(event)
	if event.createdentity.name == "void-pipe" then
		if glob.pipes == nil then
			glob.pipes = {}
			game.onevent(defines.events.ontick, ticker)
		end
		
		table.insert(glob.pipes, event.createdentity)
	end
end

game.onevent(defines.events.onbuiltentity, builtEntity)
game.onevent(defines.events.onrobotbuiltentity, builtEntity)

function processPipes()
	for k,pipe in pairs(glob.pipes) do
		if pipe.valid then
			pipe.fluidbox[1] = nil
		else
			table.remove(glob.pipes, k)
			if #glob.pipes == 0 then
				glob.pipes = nil
			end
		end
	end
end