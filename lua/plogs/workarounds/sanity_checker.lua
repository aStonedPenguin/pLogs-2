-- Let's reduce support tickets by 50%
local function LowerKeys(tab)
	for k, v in pairs(tab) do
		tab[string.lower(k)] = v
	end
end

plogs.cfg.Command = string.lower(plogs.cfg.Command or 'plogs')
plogs.cfg.Command = string.Replace(plogs.cfg.Command, '/', '')
plogs.cfg.Command = string.Replace(plogs.cfg.Command, '!', '')

plogs.cfg.UserGroups = plogs.cfg.UserGroups or {
	['owner'] 		= true,
	['superadmin'] 	= true,
	['admin'] 		= true,
	['moderator'] 	= true
}

plogs.cfg.IPUserGroups = plogs.cfg.IPUserGroups or {
	['superadmin'] 	= true
}

plogs.cfg.Width = math.Clamp((plogs.cfg.Width or .65), .25, 1)

plogs.cfg.Height = math.Clamp((plogs.cfg.Height or .65), .25, 1)

plogs.cfg.DarkUI = plogs.cfg.DarkUI or false

plogs.cfg.EchoServer = plogs.cfg.EchoServer or true

plogs.cfg.DevAccess = plogs.cfg.DevAccess or true

plogs.cfg.EnableMySQL = plogs.cfg.EnableMySQL or false

plogs.cfg.LogLimit = plogs.cfg.LogLimit or 128

plogs.cfg.ShowSteamID = plogs.cfg.ShowSteamID or true

plogs.cfg.LogTypes = plogs.cfg.LogTypes or {
	['chat'] 		= false,
	['commands']	= false,
	['connections'] = false,
	['kills'] 		= false,
	['props'] 		= false,
	['tools'] 		= false,
	['darkrp'] 		= true,
	['ulx']			= true,
	['pnlr']		= true, -- NLR Zones					|| 	https://scriptfodder.com/scripts/view/583
	['lac']			= true, -- Leys Serverside AntiCheat 	|| 	https://scriptfodder.com/scripts/view/1148
	['awarn2']		= true, -- AWarn2 						||	https://scriptfodder.com/scripts/view/629
	['hitmodule']	= true, -- Hitman Module				||	https://scriptfodder.com/scripts/view/1369
	['cuffs'] 		= false, -- Hand Cuffs 					||	https://scriptfodder.com/scripts/view/910
}

plogs.cfg.CommandBlacklist = plogs.cfg.CommandBlacklist or {
	['_sendDarkRPvars']		= true,
	['_sendAllDoorData']	= true,
	['ulib_cl_ready'] 		= true,
	['_xgui']				= true,
	['ulx']					= true,
}

LowerKeys(plogs.cfg.UserGroups)
LowerKeys(plogs.cfg.IPUserGroups)
LowerKeys(plogs.cfg.LogTypes)