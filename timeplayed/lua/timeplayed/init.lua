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
		util.AddNetworkString("startTimer")
		net.Start("startTimer")
		net.Send(ply)
		
	else
		
		util.AddNetworkString("removeTimer")
		net.Start("removeTimer")
		net.Send(ply)
		
	end
end

hook.Add("OnPlayerChangedTeam", "teamChange", PlayerChangedTeam)


function plyDisconnect(ply)
	util.AddNetworkString("plyDisconnect")
	net.Start("plyDisconnect")
	net.Send(ply)
end

hook.Add("PlayerDisconnected", "disconnectedPlayer", plyDisconnect)



