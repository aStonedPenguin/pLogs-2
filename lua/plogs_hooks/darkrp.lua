-- Hit logs
if plogs.cfg.LogTypes['hhh'] and plogs.cfg.LogTypes['hitmodule'] then
	plogs.Register('Hits', true, Color(51, 128, 255))

	plogs.AddHook('onHitAccepted', function(hitman, target, customer)
		plogs.PlayerLog(hitman, 'Hits', hitman:NameID() .. ' accepted a hit on ' .. target:NameID() .. '  ordered by ' .. customer:NameID(), {
			['Hitman Name'] 		= hitman:Name(),
			['Hitman SteamID']		= hitman:SteamID(),
			['Customer Name'] 		= customer:Name(),
			['Customer SteamID']	= customer:SteamID(),
			['Target Name'] 		= target:Name(),
			['Target SteamID']		= target:SteamID(),
		})
	end)

	plogs.AddHook('onHitCompleted', function(hitman, target, customer)
		plogs.PlayerLog(hitman, 'Hits', hitman:NameID() .. ' completed a hit on ' .. target:NameID() .. '  ordered by ' .. customer:NameID(), {
			['Hitman Name'] 		= hitman:Name(),
			['Hitman SteamID']		= hitman:SteamID(),
			['Customer Name'] 		= customer:Name(),
			['Customer SteamID']	= customer:SteamID(),
			['Target Name'] 		= target:Name(),
			['Target SteamID']		= target:SteamID(),
		})
	end)

	plogs.AddHook('onHitFailed', function(hitman, target)
		plogs.PlayerLog(hitman, 'Hits', hitman:NameID() .. ' failed a hit on ' .. target:NameID(), {
			['Hitman Name'] 		= hitman:Name(),
			['Hitman SteamID']		= hitman:SteamID(),
			['Target Name'] 		= target:Name(),
			['Target SteamID']		= target:SteamID(),
		})
	end)
end


-- Names
plogs.Register('Names', true, Color(51, 128, 255))

plogs.AddHook('onPlayerChangedName', function(pl, old, new)
	if IsValid(pl) and (old ~= nil) then
		plogs.PlayerLog(pl, 'Names', pl:NameID() .. ' changed their name to ' .. new ..  ' from ' .. old, {
			['Name'] 	= pl:Name(),
			['SteamID']	= pl:SteamID()
		})
	end
end)


-- Job changes
plogs.Register('Jobs', true, Color(51, 128, 255))

plogs.AddHook('OnPlayerChangedTeam', function(pl, old, new)
	if IsValid(pl) then
		plogs.PlayerLog(pl, 'Jobs', pl:NameID() .. ' changed their job to ' .. team.GetName(new) ..  ' from ' .. team.GetName(old), {
			['Name'] 	= pl:Name(),
			['SteamID']	= pl:SteamID()
		})
	end
end)


-- Demotions
plogs.Register('Demotions', true, Color(51, 128, 255))

plogs.AddHook('onPlayerDemoted', function(demoter, demotee, reason)
	if IsValid(demoter) and IsValid(demotee) then
		plogs.PlayerLog(demoter, 'Demotions', demoter:NameID() .. ' started a demotion on ' .. demotee:NameID() ..  ' for ' .. reason, {
			['Target Name'] 	= demotee:Name(),
			['Target SteamID']	= demotee:SteamID(),
			['Demotee Name'] 	= demoter:Name(),
			['Demotee SteamID']	= demoter:SteamID(),
		})
	end
end)


-- Police logs
plogs.Register('Police', true, Color(51, 128, 255))

plogs.AddHook('playerArrested', function(target, time, officer)
	if IsValid(officer) then
		plogs.PlayerLog(officer, 'Police', officer:NameID() .. ' arrested ' .. target:NameID(), {
			['Target Name'] 	= target:Name(),
			['Target SteamID']	= target:SteamID(),
			['Officer Name'] 	= officer:Name(),
			['Officer SteamID']	= officer:SteamID(),
		})
	end
end)

plogs.AddHook('playerUnArrested', function(target, officer)
	if IsValid(officer) then
		plogs.PlayerLog(officer, 'Police', officer:NameID() .. ' unarrested ' .. target:NameID(), {
			['Target Name'] 	= target:Name(),
			['Target SteamID']	= target:SteamID(),
			['Officer Name'] 	= officer:Name(),
			['Officer SteamID']	= officer:SteamID(),
		})
	else
		plogs.Log('Police', target:NameID() .. ' has been released from jail.', {
			['Name'] 	= target:Name(),
			['SteamID']	= target:SteamID(),
		})
	end
end)

plogs.AddHook('playerWanted', function(target, officer, reason)
	if IsValid(officer) then
		plogs.PlayerLog(officer, 'Police', officer:NameID() .. ' wanted ' .. target:NameID() .. ' for ' .. reason, {
			['Target Name'] 	= target:Name(),
			['Target SteamID']	= target:SteamID(),
			['Officer Name'] 	= officer:Name(),
			['Officer SteamID']	= officer:SteamID(),
		})
	end
end)

plogs.AddHook('playerUnWanted', function(target, officer)
	if IsValid(officer) then
		plogs.PlayerLog(officer, 'Police', officer:NameID() .. ' unwanted ' .. target:NameID(), {
			['Target Name'] 	= target:Name(),
			['Target SteamID']	= target:SteamID(),
			['Officer Name'] 	= officer:Name(),
			['Officer SteamID']	= officer:SteamID(),
		})
	else
		plogs.Log('Police', target:NameID() .. '\'s wanted has expired', {
			['Name'] 	= target:Name(),
			['SteamID']	= target:SteamID(),
		})
	end
end)

plogs.AddHook('playerWarranted', function(target, officer, reason)
	if IsValid(officer) then
		plogs.PlayerLog(officer, 'Police', officer:NameID() .. ' warranted ' .. target:NameID() .. ' for ' .. reason, {
			['Target Name'] 	= target:Name(),
			['Target SteamID']	= target:SteamID(),
			['Officer Name'] 	= officer:Name(),
			['Officer SteamID']	= officer:SteamID(),
		})
	end
end)

plogs.AddHook('playerUnWarranted', function(target, officer)
	if IsValid(officer) then
		plogs.PlayerLog(officer, 'Police', officer:NameID() .. ' unwarranted ' .. target:NameID(), {
			['Target Name'] 	= target:Name(),
			['Target SteamID']	= target:SteamID(),
			['Officer Name'] 	= officer:Name(),
			['Officer SteamID']	= officer:SteamID(),
		})
	else
		plogs.Log('Police', target:NameID() .. '\'s warrant has expired', {
			['Name'] 	= target:Name(),
			['SteamID']	= target:SteamID(),
		})
	end
end)


-- Purchases
plogs.Register('Purchases', false)

plogs.AddHook('playerBoughtCustomEntity', function(pl, ent_tbl, ent)
	plogs.PlayerLog(pl, 'Purchases', pl:NameID() .. ' purchased ' .. ent_tbl.name .. ' for $' .. ent_tbl.price, {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)


-- Adverts
plogs.Register('Advert', false)

plogs.AddHook('onChatCommand', function(pl, cmd, arg_str)
	if (cmd == 'advert') then
		plogs.PlayerLog(pl, 'Advert', pl:NameID() .. ' adverted "' .. arg_str .. '"', {
			['Name'] 	= pl:Name(),
			['SteamID']	= pl:SteamID()
		})
	end
end)

-- Lockpicks
plogs.Register('Lockpick', false)

plogs.AddHook('lockpickStarted', function(pl)
	plogs.PlayerLog(pl, 'Lockpick', pl:NameID() .. ' started lockpicking', {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)

plogs.AddHook('onLockpickCompleted', function(pl, succ)
	plogs.PlayerLog(pl, 'Lockpick', pl:NameID() .. ' finished lockpicking ' .. (succ and 'successfully' or 'unsuccessfully'), {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)


-- Door buys
plogs.Register('Doors', false)

plogs.AddHook('playerBoughtDoor', function(pl, ent, cost)
	plogs.PlayerLog(pl, 'Doors', pl:NameID() .. ' bought a door for $' .. cost, {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)

plogs.AddHook('playerSellDoor', function(pl, ent)
	plogs.PlayerLog(pl, 'Doors', pl:NameID() .. ' sold a door', {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)


-- Pockets
plogs.Register('Pocket', false)

plogs.AddHook('onPocketItemAdded', function(pl, ent)
	plogs.PlayerLog(pl, 'Pocket', pl:NameID() .. ' pocketed ' .. ent:GetClass(), {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)

timer.Simple(0, function()
	DarkRP.log = function() end
end)