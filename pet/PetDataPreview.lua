--宠物属性预览
PetDataPreview = {}

function PetDataPreview.GetAttrData(player,Pet_Key)
    if player == nil or Pet_Key == nil then
        return
    end
    local PetData = PetConfig.GetByKeyName(Pet_Key)
    local PetExtraData = PetExtraConfig.GetByIdLevel(PetData.Id,1)
    if not PetExtraData then
        PetExtraData = PetExtraConfig.GetByIdLevel(PetData.Id,0)
    end
    local str = [[
        if PetInfoUI then
            PetInfoUI.AttrTalentList = ]]..Lua_tools.serialize(PetExtraData)..[[
            PetInfoUI.Refresh()
        end
    ]]
	sLuaApp:ShowForm(player,"脚本表单", str)
end