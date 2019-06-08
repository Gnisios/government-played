----------------------------------------
-- Hours In Government Counting Addon --
----------------------------------------

-- Addon originally created for my DarkRP server "Frenesy", is used for the addon "Gunsmith (Armurerie)"


AddCSLuaFile ("cl_init.lua")


if file.Exists("serverplayers", "DATA") == false then
	file.CreateDir("serverplayers")
end



function PlayerChangedTeam(ply, oldTeam, newTeam)
	if newTeam == TEAM_COMMISSAIRE or TEAM_GIGN or TEAM_POLICEAGENT or TEAM_BAC then -- EDIT HERE THE TEAMS FOR WHICH HOURS ARE COUNTED (ADD OR REMOVE "or" IF NECESSARY)
		timer.Create("minutesCP", 60, 0, function()
			if file.Exists("serverplayers/"..ply:SteamID64()..".txt", "DATA") == false then
				file.Write("serverplayers/"..ply:SteamID64()..".txt", "1")
			else
				file.Write("serverplayers/"..ply:SteamID64()..".txt", 
					file.Read("serverplayers/"..ply:SteamID64()..".txt", "DATA") + 1)
			end
		end)
		
	else
		if timer.Exists("minutesCP") then
			timer.Remove("minutesCP")
		end
	end
end

hook.Add("OnPlayerChangedTeam", "teamChange", PlayerChangedTeam)



