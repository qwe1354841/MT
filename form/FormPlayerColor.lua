--角色染色表单
FormPlayerColor = {}

--染色颜色数据
function FormPlayerColor.GetColorData(player)
    if not player then
        return
    end
    if PlayerColor then
        PlayerColor.GetData(player)
    end
    return ""
end

--染色模板预览
function FormPlayerColor.Pre_Plan(player,plan_index)
    if not player then
        return
    end
    if PlayerColor then
        PlayerColor.Pre_Plan(player,plan_index)
    end
    return ""
end

--自定义染色
function FormPlayerColor.Dyeing_Item(player,part,itemlist,is_pre)
    if not player then
        return
    end
    if PlayerColor then
        PlayerColor.Dyeing_Item(player,part,itemlist,is_pre) 
    end
    return ""
end

--模板染色
function FormPlayerColor.Dyeing_Plan(player,index)
    if not player then
        return
    end
    if PlayerColor then
        PlayerColor.Dyeing_Plan(player,index)
    end
    return ""
end