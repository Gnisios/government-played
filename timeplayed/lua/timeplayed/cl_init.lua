local ply = LocalPlayer()



net.Receive("startTimer", function()
	timer.Create("minutesCP", 60, 0, function()
		if file.Exists("serverplayers/"..ply:SteamID64()..".txt", "DATA") == false then
				file.Write("serverplayers/"..ply:SteamID64()..".txt", "1")
		else
			file.Write("serverplayers/"..ply:SteamID64()..".txt", 
				file.Read("serverplayers/"..ply:SteamID64()..".txt", "DATA") + 1)
		end
	end)
end)



net.Receive("removeTimer", function()
	if timer.Exists("minutesCP") then
		timer.Remove("minutesCP")
	end
end)

net.Receive("plyDisconnect", function()
	if timer.Exists("minutesCP") then
		timer.Remove("minutesCP")
	end
end)


