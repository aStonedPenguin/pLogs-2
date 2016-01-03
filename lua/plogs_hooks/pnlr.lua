plogs.Register('NLR', true, Color(255,100,0))

plogs.AddHook('NLR', 'PlayerEnteredNlrZone', function(t, pl)
	plogs.PlayerLogg(pl, 'NLR', pl:NameID() .. ' entered an NLR zone', {
		['Name']	= pl:Name(),
		['SteamID'] = pl:SteamID(),
	})
end)

plogs.AddHook('NLR', 'PlayerExitedNlrZone', function(t, pl, time)
	plogs.PlayerLog(pl, 'NLR', pl:NameID() .. ' left an NLR zone', {
		['Name']	= pl:Name(),
		['SteamID'] = pl:SteamID(),
	})
end)
