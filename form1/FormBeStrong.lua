--变强表单
FormBeStrong = {}


function FormBeStrong.GetPromotionConfig(player)
    if not MainUISwitch.CheckOpenLevel(player,"变强") then
		return ""
	end
    if Achievement then
        Achievement.GetPromotionConfig(player)
    end
    return ""
end

function FormBeStrong.GetAchievement(player)
    if not MainUISwitch.CheckOpenLevel(player,"变强") then
		return ""
	end
    if Achievement then
        Achievement.GetAchievement(player)
    end
    return ""
end

function FormBeStrong.GetReward(player,data)
    if not MainUISwitch.CheckOpenLevel(player,"变强") then
		return ""
	end
    if Achievement then
        Achievement.GetReward(player,data)
    end
    return ""
end



