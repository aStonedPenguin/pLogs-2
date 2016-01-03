/*timer.Simple(1, function() -- If this didn't reduce support tickets and angry customers by over 50% I wouldn't do it. Sorry, stop using shitty addons people.
	hook._Call = hook._Call or hook.Call

	function hook.Call(name, gm, ...) 
		hook._Call('plogs_' .. name, nil, ...)
		print(name)
		return hook._Call(name, gm, ...)
	end
	
	function hook.Run(name, ...)
		hook._Call('plogs_' .. name, nil, ...)
		return hook._Call(name, GAMEMODE, ...)
	end
end)