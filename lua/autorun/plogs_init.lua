local include_sv = (SERVER) and include or function() end
local include_cl = (SERVER) and AddCSLuaFile or include
local include_sh = function(path) include_sv(path) include_cl(path) end

plogs		= plogs			or {}
plogs.cfg 	= plogs.cfg 	or {}
plogs.types	= plogs.types	or {}
plogs.data	= plogs.data	or {}

plogs.Version = '2.7.1'

function plogs.Error(str)
	return ErrorNoHalt('[pLogs] ' .. str)
end

-- Lib modules from: https://github.com/SuperiorServers/plib_v2
include_sh 'plogs/lib/pon1.lua'
include_cl 'plogs/lib/pdraw.lua'
include_sv 'plogs/lib/table.lua'

include_sh 'plogs_cfg.lua' 
include_sh 'plogs/workarounds/sanity_checker.lua'

if (SERVER) and plogs.cfg.EnableMySQL then
	include_sv 'plogs_mysql_cfg.lua'
	if (system.IsWindows() and file.Exists('lua/bin/gmsv_tmysql4_win32.dll', 'MOD')) or (system.IsLinux() and file.Exists('lua/bin/gmsv_tmysql4_linux.dll', 'MOD')) then
		include_sv 'plogs/lib/ptmysql.lua'
		plogs.sql = ptmysql
	elseif (system.IsWindows() and file.Exists('lua/bin/gmsv_mysqloo_win32.dll', 'MOD')) or (system.IsLinux() and file.Exists('lua/bin/gmsv_mysqloo_linux.dll', 'MOD')) then
		include_sv 'plogs/lib/pmysqloo.lua'
		plogs.sql = pmysqloo
	end

	if (plogs.sql == nil) then
		plogs.Error('MySQL is enabled but pLogs could not find the tmysql or mysqloo module installed!') -- reduce support tickets by 50%
		plogs.cfg.EnableMySQL = false
	else
		include_sv 'plogs/mysql.lua'
	end
end

include_sh 'plogs/core_sh.lua'
include_sv 'plogs/core_sv.lua'
include_sh 'plogs/console.lua'

include_cl 'plogs/vgui/skin.lua'
include_cl 'plogs/vgui/frame.lua'
include_cl 'plogs/vgui/tablist.lua'

include_cl 'plogs/menu.lua'

if (not file.IsDir('plogs/saves', 'data')) then
	file.CreateDir('plogs/saves')
end

hook.Add('Initialize', 'plogs.Loghooks.Initialize', function()
	local files, _ = file.Find('plogs_hooks' .. '/*.lua', 'LUA')
	for _, f in ipairs(files) do
	if plogs.cfg.LogTypes[f:sub(1, f:len() - 4):lower()] then continue end
		include_sh('plogs_hooks/' .. f)
	end
end)

local msg = {
	'\n\n',
	[[         __                  ]],
	[[ _ __   / /  ___   __ _ ___  ]],
	[[| '_ \ / /  / _ \ / _` / __| ]],
	[[| |_) / /__| (_) | (_| \__ \ ]],
	[[| .__/\____/\___/ \__, |___/ ]],
	[[|_|               |___/      ]],
	'\n',
	[[Version ]] .. plogs.Version .. [[ by aStonedPenguin]],
	'\n\n',
}

for k, v in ipairs(msg) do 
	MsgC(Color(250,0,0), v .. '\n')
end