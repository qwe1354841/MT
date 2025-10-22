--区域任务表单
FormRegionTask = {}

function FormRegionTask.GetData(player, ui_type)
	if RegionTask then
		RegionTask.GetData(player, ui_type)
	end
	return ""
end

function FormRegionTask.MoveToNPC(player)
	if RegionTask then
		RegionTask.MoveToNPC(player)
	end
	return ""
end

--打断开宝箱
function FormRegionTask.StopOpenBox(player)
    if RegionTask then
        RegionTask.StopOpenBox(player)
    end
    return ""
end
