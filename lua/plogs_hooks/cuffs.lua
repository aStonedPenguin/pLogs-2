plogs.Register('Handcuff', false)

plogs.AddHook('OnHandcuffed', function(pl, targ)
	plogs.PlayerLog(pl, 'Handcuff', pl:NameID() .. ' cuffed ' .. targ:NameID(), {
		['Name'] 			= pl:Name(),
		['SteamID']			= pl:SteamID(),
		['Target Name'] 	= targ:Name(),
		['Target SteamID']	= targ:SteamID()
	})
end)

plogs.AddHook('OnHandcuffBreak', function(pl, cuffs, friend)
	if IsValid(friend) then
		plogs.PlayerLog(pl, 'Handcuff', friend:NameID() .. ' uncuffed ' .. pl:NameID(), {
			['Name'] 			= pl:Name(),
			['SteamID']			= pl:SteamID(),
			['Fried Name'] 		= friend:Name(),
			['Target SteamID']	= friend:SteamID()
		})
	else
		plogs.PlayerLog(pl, 'Handcuff', pl:NameID() .. ' broke free from thier handcuffs', {
			['Name'] 			= pl:Name(),
			['SteamID']			= pl:SteamID()
		})
	end
end)