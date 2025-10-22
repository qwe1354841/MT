--宠物属性预览表单
FormPetDataPreview = {}

function FormPetDataPreview.GetAttrData(player,Pet_Key)
    if player == nil or Pet_Key == nil then
        return ""
    end
    if PetDataPreview then
        PetDataPreview.GetAttrData(player,Pet_Key)
    end
    return ""
end