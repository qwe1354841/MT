--宠物染色表单
FormPetColor = {}

--宠物染色颜色数据
function FormPetColor.GetColorData(player,guid)
    if not player then
        return
    end
    if PetColor then
        PetColor.GetData(player,guid)
    end
    return ""
end

--宠物染色模板预览
function FormPetColor.Pre_Plan(player,guid,plan_index)
    if not player then
        return
    end
    if PetColor then
        PetColor.Pre_Plan(player,guid,plan_index)
    end
    return ""
end

--宠物自定义染色
function FormPetColor.Dyeing_Item(player,guid,part,item_str,is_pre)
    if not player then
        return
    end
    if PetColor then
        PetColor.Dyeing_Item(player,guid,part,item_str,is_pre)
    end
    return ""
end

--宠物模板染色
function FormPetColor.Dyeing_Plan(player,guid,index)
    if not player then
        return
    end
    if PetColor then
        PetColor.Dyeing_Plan(player,guid,index)
    end
    return ""
end