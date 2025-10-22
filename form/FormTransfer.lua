--地图跳转相关表单
FormTransfer = {}

function FormTransfer.Jump_ByWorldMap(player,map_keyname,index)
	
	if TransferSys then
		TransferSys.Main(player,map_keyname,index)
	end
	return ""
end
