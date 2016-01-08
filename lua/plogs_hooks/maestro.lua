plogs.Register('Maestro', false)

local function concat(t)
	local s = ''
	for k, v in pairs(t) do
		if (not istable(v)) then
			s = s .. tostring(v)
		else
			s = s .. concat(v)
		end
	end
end

plogs.AddHook('maestro_command', function(pl, cmd, args)
	if pl:IsPlayer() then 
		plogs.PlayerLog(pl, 'Maestro', pl:NameID() .. ' has ran command "' .. cmd .. '" with args "' .. concat(args, ' ') .. '"', {
			['Name']	= pl:Name(),
			['SteamID']	= pl:SteamID(),
		})
	end
end)
