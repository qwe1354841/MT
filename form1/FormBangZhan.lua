--帮战表单
FormBangZhan = {}

function FormBangZhan.Search(player)
	if not sLuaApp:IsActivityRunning(Act_BangZhan.ID) then 
		return""
	end
	if Act_BangZhan then
		Act_BangZhan.Search(player)
	end	
	return ""
end
function FormBangZhan.Search_Always(player)
	if not sLuaApp:IsActivityRunning(Act_BangZhan.ID) then 
		return""
	end
	if Act_BangZhan then
		Act_BangZhan.Search_Always(player)
	end	
	return ""
end
function FormBangZhan.Get_Server_Data(player)
	if Act_BangZhan then
		Act_BangZhan.get_server_data(player)
	end	
	return ""
end
