-- 生产系统 表单
FormProduce = {}

------------------------------------------- start 生产系统-烹饪 start -------------------------------------------------
-- 获取烹饪数据
function FormProduce.GetProduceFoodData(player)
    if not MainUISwitch.CheckOpenLevel(player,"生产","烹饪") then
        return ""
    end
    if player and ProduceFoodSystem then
        ProduceFoodSystem.GetProduceFoodData(player)
    end
    return ""
end

-- 制作烹饪物品
function FormProduce.MakeFood(player,id,isFirstUseNotBind)
    if not MainUISwitch.CheckOpenLevel(player,"生产","烹饪") then
        return ""
    end
    if player and id and isFirstUseNotBind and ProduceFoodSystem then
        ProduceFoodSystem.MakeFood(player,id,isFirstUseNotBind)
    end
    return ""
end
------------------------------------------- end 生产系统-烹饪 end ---------------------------------------------------


------------------------------------------- start 生产系统-炼药 start -------------------------------------------------
-- 获取炼药数据
function FormProduce.GetProduceMedicineData(player)
    if not MainUISwitch.CheckOpenLevel(player,"生产","炼药") then
        return ""
    end
    if player and ProduceMedicineSystem then
        ProduceMedicineSystem.getData(player)
    end
    return ""
end

-- 制作炼药物品
function FormProduce.MakeMedicine(player,id,isFirstUseNotBind)
    if not MainUISwitch.CheckOpenLevel(player,"生产","炼药") then
        return ""
    end
    if player and id and isFirstUseNotBind and ProduceMedicineSystem then
        ProduceMedicineSystem.MakeMedicine(player,id,isFirstUseNotBind)
    end
    return ""
end


------------------------------------------- end 生产系统-炼药 end ---------------------------------------------------