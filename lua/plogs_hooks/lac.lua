plogs.Register('LAC', true, Color(204,0,153))

plogs.AddHook('LAC.OnDetect', function(pl, logstr, reason)
	plogs.PlayerLog(pl, 'LAC', pl:NameID() .. ' has been detected for ' .. reason, {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)