plogs.sql._db = plogs.sql._db or plogs.sql.newdb(plogs.cfg.IP , plogs.cfg.User, plogs.cfg.Pass, plogs.cfg.DB, plogs.cfg.Port)

local db = plogs.sql._db

function plogs.sql.LogIP(steamid64, ip, callback)
	return db:query_ex('REPLACE INTO ip_log(SteamID64, Data, Date) VALUES(?, "?", ' .. os.time() .. ');', {steamid64, ip}, callback)
end

function plogs.sql.Log(steamid64, data, callback)
	return db:query_ex('INSERT INTO playerevents(SteamID64, Date, Data) VALUES(?, ' .. os.time() .. ', "?");', {steamid64, data}, callback)
end

function plogs.sql.LoadIPs(steamid64, callback)
	return db:query_ex('SELECT * FROM ip_log WHERE SteamID64=?;', {steamid64}, callback)
end

function plogs.sql.LoadLogs(steamid64, callback)
	return db:query_ex('SELECT * FROM playerevents WHERE SteamID64=? ORDER BY Date DESC LIMIT ' .. plogs.cfg.LogLimit .. ';', {steamid64}, callback)
end

hook.Add('InitPostEntity', 'plogs.SQL.InitPostEntity', function()
	db:query_sync([[
		CREATE TABLE IF NOT EXISTS `ip_log` (
			`SteamID64` BIGINT(20) NOT NULL,
			`Data` VARCHAR(50) NOT NULL,
			`Date` INT(11) NOT NULL,
			PRIMARY KEY (`SteamID64`, `Data`)
		)
		COLLATE='latin1_swedish_ci'
		ENGINE=MyISAM;
	]])
	db:query_sync([[
		CREATE TABLE IF NOT EXISTS `playerevents` (
			`SteamID64` BIGINT(20) NOT NULL,
			`Date` INT(11) NOT NULL,
			`Data` TEXT NOT NULL
		)
		COLLATE='latin1_swedish_ci'
		ENGINE=MyISAM;
	]])
end)