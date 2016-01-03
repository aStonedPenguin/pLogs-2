plogs.Register('Hits', true, Color(51, 128, 255))

plogs.AddHook('hhh_hitRequested', function(hitData)
	if (hitData ~= nil) then
		plogs.PlayerLog(hitData.requester, 'Hits', hitData.requester:NameID() .. ' requested a hit on ' .. hitData.target:NameID() .. ' for $' .. hitData.reward, {
			['Requester Name'] 		= hitData.requester:Name(),
			['Requester SteamID']	= hitData.requester:SteamID(),
			['Target Name'] 		= hitData.target:Name(),
			['Target SteamID']		= hitData.target:SteamID(),
		})
	end
end)

plogs.AddHook('hhh_hitAborted', function(hitData)
	if (hitData ~= nil) then
		plogs.PlayerLog(hitData.hitman, 'Hits', hitData.hitman:NameID() .. ' aborted a hit on ' ..  hitData.target:NameID(), {
			['Hitman Name'] 		= hitData.hitman:Name(),
			['Hitman SteamID']		= hitData.hitman:SteamID(),
			['Target Name'] 		= hitData.target:Name(),
			['Target SteamID']		= hitData.target:SteamID(),
		})
	end
end)

plogs.AddHook('hhh_hitFinished', function(hitman, target)
	plogs.PlayerLog(hitman, 'Hits', hitman:NameID() .. ' completed a hit on ' .. target:NameID(), {
		['Hitman Name'] 		= hitman:Name(),
		['Hitman SteamID']		= hitman:SteamID(),
		['Target Name'] 		= target:Name(),
		['Target SteamID']		= target:SteamID(),
	})
end)