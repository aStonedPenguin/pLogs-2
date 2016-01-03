plogs.Register('Maestro', false)

plogs.AddHook('maestro_command', function(pl, cmd, args)
	if pl:IsPlayer() then 
		plogs.PlayerLog(pl, 'Maestro', pl:NameID() .. ' has ran command "' .. cmd .. '" with args "' .. table.concat(args, ' ') .. '"', {
			['Name']	= pl:Name(),
			['SteamID']	= pl:SteamID(),
		})
	end
end)
