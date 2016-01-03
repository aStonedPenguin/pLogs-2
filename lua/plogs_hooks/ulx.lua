plogs.Register('ULX', false)

plogs.AddHook(ULib.HOOK_COMMAND_CALLED, function(pl, cmd, args)
	if pl:IsPlayer() then 
		plogs.PlayerLog(pl, 'ULX', pl:NameID() .. ' has ran command "' .. cmd .. '" with args "' .. table.concat(args, ' ') .. '"', {
			['Name']	= pl:Name(),
			['SteamID']	= pl:SteamID(),
		})
	end
end)
