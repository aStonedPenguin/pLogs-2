plogs.Register('Hits', true, Color(51, 128, 255))

plogs.AddHook('HMHitAccepted', function(hitman, target, amount)
	plogs.PlayerLog(hitman, 'Hits', hitman:NameID() .. ' accepted a hit on ' .. target:NameID() .. ' for $' .. amount, {
		['Hitman Name'] 		= hitman:Name(),
		['Hitman SteamID']		= hitman:SteamID(),
		['Target Name'] 		= target:Name(),
		['Target SteamID']		= target:SteamID(),
	})
end)

plogs.AddHook('HMHitComplete', function(hitman, target)
	plogs.PlayerLog(hitman, 'Hits', hitman:NameID() .. ' completed a hit on ' .. target:NameID(), {
		['Hitman Name'] 		= hitman:Name(),
		['Hitman SteamID']		= hitman:SteamID(),
		['Target Name'] 		= target:Name(),
		['Target SteamID']		= target:SteamID(),
	})
end)