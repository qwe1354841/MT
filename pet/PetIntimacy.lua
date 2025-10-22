--宠物基础表单

PetIntimacy = {}

PetIntimacy.Config = {
	{Inti = 0, AttrList = {"连击概率",10,"连击数量",2,"物理攻击致命机率",10}},
	{Inti = 500, AttrList = {"连击概率",30,"连击数量",2,"物理攻击致命机率",30}},
	{Inti = 1000, AttrList = {"连击概率",50,"连击数量",2,"物理攻击致命机率",50}},
	{Inti = 2000, AttrList = {"连击概率",80,"连击数量",2,"物理攻击致命机率",80}},
	{Inti = 5000, AttrList = {"连击概率",120,"连击数量",3,"物理攻击致命机率",120}},
	{Inti = 10000, AttrList = {"连击概率",160,"连击数量",3,"物理攻击致命机率",160}},
	{Inti = 20000, AttrList = {"连击概率",200,"连击数量",3,"物理攻击致命机率",200}},
	{Inti = 50000, AttrList = {"连击概率",250,"连击数量",4,"物理攻击致命机率",500}},
	{Inti = 100000, AttrList = {"连击概率",300,"连击数量",4,"物理攻击致命机率",600}},
	{Inti = 200000, AttrList = {"连击概率",350,"连击数量",4,"物理攻击致命机率",700}},
	{Inti = 500000, AttrList = {"连击概率",400,"连击数量",5,"物理攻击致命机率",800}},
	{Inti = 1000000, AttrList = {"连击概率",500,"连击数量",5,"物理攻击致命机率",850}},
	{Inti = 2000000, AttrList = {"连击概率",600,"连击数量",6,"物理攻击致命机率",900}},
	{Inti = 5000000, AttrList = {"连击概率",750,"连击数量",6,"物理攻击致命机率",950}},
	{Inti = 10000000, AttrList = {"连击概率",1000,"连击数量",7,"物理攻击致命机率",1000}},
}

function PetIntimacy.GetData(player)
	
end

function PetIntimacy.Refresh(pet)
	local Inti_val = pet:GetAttr(PET_ATTR_CLOSE_POINT)
	sLuaApp:LuaDbg(" Inti_val = " .. Inti_val)
	local level = PetIntimacy.CheckLevel(Inti_val)
	if level ~= pet:GetInt("PET_IntimacyLevel") then
		pet:SetInt("PET_IntimacyLevel", level)
		local Tb_attr = PetIntimacy.Config[level].AttrIdList
		if not Tb_attr then
			Tb_attr = PetIntimacy.CreateAttrIdList(level)
		end
		Tb_val = PetIntimacy.Config[level].AttrValList
		local ArtMark = PetAttrClassify.PetIntimacy or 16
		for k,v in ipairs(Tb_attr) do
			pet:SetDynAttr(ArtMark, v, Tb_val[k])
		end
	end
end

function PetIntimacy.CheckLevel(Inti_val)
	if not PetIntimacy.LevelMax then
		PetIntimacy.LevelMax = #PetIntimacy.Config
	end
	if Inti_val >= PetIntimacy.Config[PetIntimacy.LevelMax].Inti then		
		return PetIntimacy.LevelMax
	end
	for k,v in ipairs(PetIntimacy.Config) do
		if v.Inti > Inti_val then
			return k-1
		end
	end
end

function PetIntimacy.CreateAttrIdList(level)
	local AttrList = PetIntimacy.Config[level].AttrList
	local index = 1
	for k,v in ipairs(AttrList) do
		if not PetIntimacy.Config[level].AttrIdList then
			PetIntimacy.Config[level].AttrIdList = {}
		end
		if type(v) == "string" then
			sLuaApp:LuaDbg(" v = " .. v)
			PetIntimacy.Config[level].AttrIdList[index] = AttrConfig.GetByKeyName(v).Id
			if not PetIntimacy.Config[level].AttrValList then
				PetIntimacy.Config[level].AttrValList = {}
			end
			if type(AttrList[k+1]) == "number" then
				PetIntimacy.Config[level].AttrValList[index] = AttrList[k+1]
			else
				PetIntimacy.Config[level].AttrValList[index] = 1
			end
			index = index + 1
		end
	end
	return PetIntimacy.Config[level].AttrIdList
end