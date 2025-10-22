--筋斗云相关表单
FormJinDouYun = {}

function FormJinDouYun.Main(player,quest_id)
    if not player or not quest_id then
        return
    end
    if JinDouYun then
        JinDouYun.Main(player,quest_id)
    end

    return ""
end