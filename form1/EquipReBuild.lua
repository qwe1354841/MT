--装备重铸

EquipReBuild = {}

EquipReBuild.LibraryLink = {
	{EquipType = 0, SiteType = 0, Role = 0, Level = 0, Alevel = 0, LockAttr = {"血量上限","物防"}, 
		RandAttr = {'Kangxing_Yifu',1,'Qiangfa_Yifu',2,'Shuxing_Yifu',1},
		Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},
		},
	{EquipType = 1, SiteType = 1, Role = 0, Level = 0, Alevel = 2, LockAttr = {"血量上限","物防"}, 
		RandAttr = {'Kangxing_Yifu',1,'Qiangfa_Yifu',2,'Shuxing_Yifu',1},
		Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},
		},




}


EquipReBuild.KeyNameLink = {
	['男魔仙器根骨向'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男魔帽子根骨向'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔仙器根骨向二阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向二阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向二阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向二阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向二阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向二阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向二阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向二阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向二阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向二阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向二阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向二阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向二阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向二阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向二阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向二阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向二阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向二阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向二阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向二阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向二阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男魔帽子根骨向二阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向二阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向二阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向二阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向二阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向二阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向二阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向二阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向二阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向二阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向二阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向二阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向二阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向二阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向二阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向二阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向二阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向二阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向二阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向二阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向二阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向二阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向二阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向二阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向二阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向二阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向二阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向二阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向二阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向二阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向二阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向二阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向二阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向二阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向二阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向二阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向二阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向二阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向二阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向二阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向二阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向二阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向二阶'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向二阶'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向二阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向二阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向二阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向二阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向二阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向二阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向二阶'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向二阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向二阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向二阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向二阶'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向二阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向二阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向二阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向二阶'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向二阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向二阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向二阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向二阶'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
--

	['男魔仙器根骨向三阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向三阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向三阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向三阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向三阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向三阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向三阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向三阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向三阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向三阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向三阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向三阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向三阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向三阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向三阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向三阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向三阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向三阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向三阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向三阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向三阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔帽子根骨向三阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向三阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向三阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向三阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向三阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向三阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向三阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向三阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向三阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向三阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向三阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向三阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向三阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向三阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向三阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向三阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向三阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向三阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向三阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向三阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向三阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向三阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向三阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向三阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向三阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向三阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向三阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向三阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向三阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向三阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向三阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向三阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向三阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向三阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向三阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向三阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向三阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向三阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向三阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向三阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向三阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向三阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向三阶'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向三阶'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向三阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向三阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向三阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向三阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向三阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向三阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向三阶'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向三阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向三阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向三阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向三阶'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向三阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向三阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向三阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向三阶'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向三阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向三阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向三阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向三阶'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	--

	['男魔仙器根骨向四阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向四阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向四阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向四阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向四阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向四阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向四阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向四阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向四阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向四阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向四阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向四阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向四阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向四阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向四阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向四阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向四阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向四阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向四阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向四阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向四阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男魔帽子根骨向四阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向四阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向四阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向四阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向四阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向四阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向四阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向四阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向四阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向四阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向四阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向四阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向四阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向四阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向四阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向四阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向四阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向四阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向四阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向四阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向四阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向四阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向四阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向四阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向四阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向四阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向四阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向四阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向四阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向四阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向四阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向四阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向四阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向四阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向四阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向四阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向四阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向四阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向四阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向四阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向四阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向四阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向四阶'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向四阶'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向四阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向四阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向四阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向四阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向四阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向四阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向四阶'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向四阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向四阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向四阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向四阶'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向四阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向四阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向四阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向四阶'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向四阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向四阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向四阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向四阶'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	--

	['男魔仙器根骨向五阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向五阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向五阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向五阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向五阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向五阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向五阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向五阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向五阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向五阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向五阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向五阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向五阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向五阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向五阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向五阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向五阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向五阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向五阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向五阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向五阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男魔帽子根骨向五阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向五阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向五阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向五阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向五阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向五阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向五阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向五阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向五阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向五阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向五阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向五阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向五阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向五阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向五阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向五阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向五阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向五阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向五阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向五阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向五阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向五阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向五阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向五阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向五阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向五阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向五阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向五阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向五阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向五阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向五阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向五阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向五阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向五阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向五阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向五阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向五阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向五阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向五阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向五阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向五阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向五阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向五阶'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向五阶'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向五阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向五阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向五阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向五阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向五阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向五阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向五阶'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向五阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向五阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向五阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向五阶'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向五阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向五阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向五阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向五阶'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向五阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向五阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向五阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向五阶'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	--

	['男魔仙器根骨向六阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向六阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向六阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向六阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向六阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向六阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向六阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向六阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向六阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向六阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向六阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向六阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向六阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向六阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向六阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向六阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向六阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向六阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向六阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向六阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向六阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男魔帽子根骨向六阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向六阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向六阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向六阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向六阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向六阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向六阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向六阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向六阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向六阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向六阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向六阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向六阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向六阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向六阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向六阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向六阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向六阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向六阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向六阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向六阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向六阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向六阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向六阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向六阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向六阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向六阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向六阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向六阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向六阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向六阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向六阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向六阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向六阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向六阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向六阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向六阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向六阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向六阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向六阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向六阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向六阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向六阶'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向六阶'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向六阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向六阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向六阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向六阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向六阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向六阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向六阶'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向六阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向六阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向六阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向六阶'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向六阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向六阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向六阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向六阶'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向六阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向六阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向六阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向六阶'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	--

	['男魔仙器根骨向七阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器根骨向七阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Vit_DemonSpellGroup',3,'DemonWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔仙器敏捷向七阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔仙器敏捷向七阶'] = {RandAttr = {'DemonWeapon_AntiElement',1,'DemonWeapon_Damage',1,'DemonWeapon_Agi_DemonSpellGroup',3,'DemonWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人仙器根骨向七阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器根骨向七阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Vit_HumanSpellGroup',4,'HumanWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人仙器敏捷向七阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人仙器敏捷向七阶'] = {RandAttr = {'HumanWeapon_AntiElement',1,'HumanWeapon_Damage',1,'HumanWeapon_Agi_HumanSpellGroup',4,'HumanWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器灵性向七阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器灵性向七阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Int_IgnoreResist',1,'FairyWeapon_Int_Enhanced',1,'FairyWeapon_Int_Bsk',2,'FairyWeapon_Int_Stat',1,'FairyWeapon_Int_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙仙器敏捷向七阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙仙器敏捷向七阶'] = {RandAttr = {'FairyWeapon_AntiElement',1,'FairyWeapon_Damage',1,'FairyWeapon_Agi_IgnoreResist',1,'FairyWeapon_Agi_Enhanced',1,'FairyWeapon_Agi_Bsk',2,'FairyWeapon_Agi_Stat',1,'FairyWeapon_Agi_Dmg',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男鬼仙器根骨向七阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器根骨向七阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Vit_GhostSpellGroup',4,'GhostWeapon_Vit_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼仙器敏捷向七阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼仙器敏捷向七阶'] = {RandAttr = {'GhostWeapon_AntiElement',1,'GhostWeapon_Damage',1,'GhostWeapon_Agi_GhostSpellGroup',4,'GhostWeapon_Agi_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男龙仙器根骨向七阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器根骨向七阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Vit_PhyStatGroup',1,'DragonWeapon_Vit_IgnoreDef',1,'DragonWeapon_Vit_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Vit_Stat',1,'DragonWeapon_Vit_Speed',1,'DragonWeapon_Vit_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器力量向七阶'] = {RandAttr = {'Weapon_Damage',1,'Weapon_PhyStatGroup',3,'Weapon_IgnoreDef',1,'Weapon_IgnoreDefRate',1,'Weapon_AntiElement',1,'Weapon_Stat',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙仙器敏捷向七阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙仙器敏捷向七阶'] = {RandAttr = {'DragonWeapon_Damage',1,'DragonWeapon_Agi_PhyStatGroup',1,'DragonWeapon_Agi_IgnoreDef',1,'DragonWeapon_Agi_IgnoreDefRate',1,'DragonWeapon_AntiElement',1,'DragonWeapon_Agi_Stat',1,'DragonWeapon_Agi_Speed',1,'DragonWeapon_Agi_DragonSpellGroup',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男魔帽子根骨向七阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子根骨向七阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Vit_Resist',1,'DemonHead_Vit_DemonSpellGroup',2,'DemonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔帽子敏捷向七阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔帽子敏捷向七阶'] = {RandAttr = {'DemonHead_Stat',1,'DemonHead_Agi_Resist',1,'DemonHead_Agi_DemonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男人帽子根骨向七阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子根骨向七阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Vit_Resist',1,'HumanHead_Vit_HumanSpellGroup',2,'HumanHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人帽子敏捷向七阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人帽子敏捷向七阶'] = {RandAttr = {'HumanHead_Stat',1,'HumanHead_Agi_Resist',1,'HumanHead_Agi_HumanSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子灵性向七阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子灵性向七阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Int_Resist',1,'FairyHead_Int_FairySpellGroup',2,'FairyHead_Int_Mp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙帽子敏捷向七阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙帽子敏捷向七阶'] = {RandAttr = {'FairyHead_Stat',1,'FairyHead_Agi_Resist',1,'FairyHead_Agi_FairySpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼帽子根骨向七阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子根骨向七阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Vit_Resist',1,'GhostHead_Vit_GhostSpellGroup',2,'GhostHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼帽子敏捷向七阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼帽子敏捷向七阶'] = {RandAttr = {'GhostHead_Stat',1,'GhostHead_Agi_Resist',1,'GhostHead_Agi_GhostSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙帽子根骨向七阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子根骨向七阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Vit_Resist',1,'DragonHead_Vit_DragonSpellGroup',2,'DragonHead_Vit_Hp',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子力量向七阶'] = {RandAttr = {'Head_Stat',1,'Head_Resist',1,'Head_Absorb',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙帽子敏捷向七阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙帽子敏捷向七阶'] = {RandAttr = {'Head_Stat',1,'DragonHead_Agi_Resist',1,'DragonHead_Agi_DragonSpellGroup',2,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男人衣服根骨向七阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服根骨向七阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Vit_Resist',1,'HumanChest_Vit_HumanSpellGroup',2,'HumanChest_Vit_Hp',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男人衣服敏捷向七阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女人衣服敏捷向七阶'] = {RandAttr = {'HumanChest_Stat',1,'HumanChest_Agi_Resist',1,'HumanChest_Agi_HumanSpellGroup',2,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男魔衣服根骨向七阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服根骨向七阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Vit_Resist',1,'DemonChest_Vit_DemonSpellGroup',2,'DemonChest_Vit_Hp',1,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男魔衣服敏捷向七阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女魔衣服敏捷向七阶'] = {RandAttr = {'DemonChest_Stat',1,'DemonChest_Agi_Resist',1,'DemonChest_Agi_DemonSpellGroup',2,'DemonChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['男仙衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服灵性向七阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服灵性向七阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Int_Resist',1,'FairyChest_Int_FairySpellGroup',2,'FairyChest_Int_Mp',1,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男仙衣服敏捷向七阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女仙衣服敏捷向七阶'] = {RandAttr = {'FairyChest_Stat',1,'FairyChest_Agi_Resist',1,'FairyChest_Agi_FairySpellGroup',2,'FairyChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男鬼衣服根骨向七阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服根骨向七阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Vit_Resist',1,'GhostChest_Vit_GhostSpellGroup',2,'GhostChest_Vit_Hp',1,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男鬼衣服敏捷向七阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女鬼衣服敏捷向七阶'] = {RandAttr = {'GhostChest_Stat',1,'GhostChest_Agi_Resist',1,'GhostChest_Agi_GhostSpellGroup',2,'GhostChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['男龙衣服根骨向七阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服根骨向七阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Vit_Resist',1,'DragonChest_Vit_DragonSpellGroup',2,'Chest_Def',1,'HumanChest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服力量向七阶'] = {RandAttr = {'Chest_Stat',1,'Chest_Resist',1,'Chest_Absorb',1,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['男龙衣服敏捷向七阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['女龙衣服敏捷向七阶'] = {RandAttr = {'Chest_Stat',1,'DragonChest_Agi_Resist',1,'DragonChest_Agi_DragonSpellGroup',2,'Chest_Def',1,'Anti_PetNeidan',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用腰带倍道向七阶'] = {RandAttr = {'Waist_IncreaseSpeed_Resist',1,'Waist_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用腰带负速向七阶'] = {RandAttr = {'Waist_DecreaseSpeed_Resist',1,'Waist_DecreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用挂坠倍道向七阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_IncreaseSpeed_ResistFairy',1,'Trinket_IncreaseSpeed_ResistHuman',1,'Trinket_IncreaseSpeed_Speed',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠气血向七阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Hp_Resist',1,'Trinket_Hp_HpPct',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用挂坠物理向七阶'] = {RandAttr = {'Trinket_Hp',1,'Trinket_Mp',1,'Trinket_Phy_AntiElement',1,'Trinket_Phy_Hit',1,'Trinket_Phy_Crit',1,'Trinket_Phy_AddAtk',1,'Trinket_Phy_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用项链根骨向七阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链力量向七阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链灵性向七阶'] = {RandAttr = {'Neck_NAgi_Resist',1,'Neck_NAgi_Stat',1,'Neck_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用项链敏捷向七阶'] = {RandAttr = {'Neck_Agi_Resist',1,'Neck_Agi_Stat',1,'Neck_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	
	['通用护腕根骨向七阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕力量向七阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕灵性向七阶'] = {RandAttr = {'Wrist_NAgi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用护腕敏捷向七阶'] = {RandAttr = {'Wrist_Agi_Resist',1,'Wrist_HpMp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用戒指根骨向七阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指力量向七阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指灵性向七阶'] = {RandAttr = {'Finger_NAgi_Stat',1,'Finger_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用戒指敏捷向七阶'] = {RandAttr = {'Finger_Agi_Stat',1,'Finger_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},

	['通用靴子根骨向七阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子力量向七阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_Damage',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子灵性向七阶'] = {RandAttr = {'Feet_NAgi_Resist',1,'Feet_NAgi_Stat',1,'Feet_NAgi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['通用靴子敏捷向七阶'] = {RandAttr = {'Feet_Agi_Resist',1,'Feet_Agi_Stat',1,'Feet_Agi_Hp',1},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	--

	['1级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['2级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['3级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['4级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['5级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['6级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['7级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
	['8级护身符'] = {SpecialAttrs = {{Name = "品质", minValue = 1, maxValue = 1000, isShow = 1},}, RandAttr = {'Ward',2},Consume = {MoneyType = 5, MoneyVal = 15000, itemList = {"仙梦石"}},},
}

function EquipReBuild.GetAllowList(player)
	if not EquipReBuild.AllowList_Str then
		if EquipReBuild.AllowList then
			EquipReBuild.AllowList_Str = Lua_tools.serialize(EquipReBuild.AllowList)
		end
	end
	local str = [[if EquipRecastUI then EquipRecastUI.AllowList = ]]..EquipReBuild.AllowList_Str..[[ EquipRecastUI.AllowRefresh() end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipReBuild.GetData(player, item_guid)
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local itemKey = item:GetKeyName()
	
	local LinkTb = EquipReBuild.KeyNameLink[itemKey]
	--sLuaApp:LuaDbg("itemKey = " .. itemKey)
	if not LinkTb then
		local itemData = ItemConfig.GetByKeyName(itemKey)
		local EquipType = itemData.Subtype
		local SiteType = itemData.Subtype2
		local Role = itemData.Role
		local Level = itemData.Itemlevel
		local Alevel = itemData.ArmorLevel
	
		LinkTb = EquipReBuild.LinkTbTest(EquipType, SiteType, Role, Level, Alevel)
	end
	if not LinkTb then
		sLuaApp:NotifyTipsMsg(player, "找不到该装备的重铸配置")
		local str = [[if EquipRecastUI then EquipRecastUI.Refresh() end]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	local str = [[if EquipRecastUI then if not EquipRecastUI.Consume then EquipRecastUI.Consume = {} end EquipRecastUI.Consume]].."['"..itemKey.."']"..[[ = ]]..Lua_tools.serialize(LinkTb.Consume or {})..[[ EquipRecastUI.Refresh() end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipReBuild.ReBuilding(player, item_guid, guard_guid)
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local guard = sGuardSystem:GetGuard(tonumber(guard_guid))
	local item_id = item:GetId()
	if guard == nil then
		if item:GetOwnerGUID() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	else
		local guard = sGuardSystem:GetGuard(guard_guid)
		local Master = guard:GetMaster()
		if item:GetOwnerGUID() ~= player:GetGUID() then
			if item:GetOwnerGUID() ~= guard:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
			if Master:GetGUID() ~= player:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
		end
	end
	
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)
	if itemData.Type ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "并非装备，无法操作")
		return ""
	end
	local LinkTb = EquipReBuild.KeyNameLink[keyName]
	--sLuaApp:LuaDbg("itemKey = " .. keyName)
	if not LinkTb then
		local EquipType = itemData.Subtype
		local SiteType = itemData.Subtype2
		local Role = itemData.Role
		local Level = itemData.Itemlevel
		local Alevel = itemData.ArmorLevel
		
		LinkTb = EquipReBuild.LinkTbTest(EquipType, SiteType, Role, Level, Alevel)
	end
	if not LinkTb then
		sLuaApp:NotifyTipsMsg(player, "找不到该装备的重铸配置")
		return
	end
	
	local Tb_consume = LinkTb.Consume
	if Tb_consume then
		local DefectList = Lua_tools.GetDefectList(player, Tb_consume.itemList)
		if #DefectList ~= 0 then
			OneKeyBuy.Main(player, DefectList)
			sLuaApp:NotifyTipsMsg(player, "重铸需要的材料不够哦")
			return
		end
		if Lua_tools.IsMoneyEnough(player, Tb_consume.MoneyType, Tb_consume.MoneyVal) == false then
			sLuaApp:NotifyTipsMsg(player, "重铸需要的"..Lua_tools.GetMoneyName(Tb_consume.MoneyType).."不够哦")
			return
		end
		if Lua_tools.SubMoney(player, Tb_consume.MoneyType, Tb_consume.MoneyVal, "system", "装备洗练", "装备洗练") == false then
			sLuaApp:NotifyTipsMsg(player, "重铸需要的"..Lua_tools.GetMoneyName(Tb_consume.MoneyType).."不够哦")
			return
		end
		if Lua_tools.SubItem(player, Tb_consume.itemList, "system", "装备洗练", "装备洗练") == false then
			sLuaApp:NotifyTipsMsg(player, "重铸需要的材料不够哦")
			return
		end
	end
	
	local AttrList = item:GetDynAttrsByMark(0)
	local newList = {}
	for k,v in ipairs(AttrList) do
		if LinkTb['LockAttr'] then
			if LinkTb['LockAttr'][v.attr] then
				newList[v.attr] = v.value
			end
		end
	end
	
	local SPA_Mode = 0
	local SPAttrs = {}
	local SPNames = {}
	local SPShows = {}
	if LinkTb.SpecialAttrs then
		for a,b in ipairs(LinkTb.SpecialAttrs) do
			local value
			if b.minValue == b.maxValue then
				value = b.minValue
				if type(value) == "string" then
					value = assert(load("local level = "..(Level or itemData.Itemlevel).." return "..value))()
					sLuaApp:LuaDbg("level = " .. (Level or itemData.Itemlevel) .. "   func = " .. value)
					value = math.floor(value) 
				end
			else
				local valueMax = b.maxValue
				local valueMin = b.minValue
				if type(valueMax) == "string" then
					valueMax = assert(load("local level = "..(Level or itemData.Itemlevel).." return "..valueMax))()
					valueMax = math.floor(valueMax) 
				end
				if type(valueMin) == "string" then
					valueMin = assert(load("local level = "..(Level or itemData.Itemlevel).." return "..valueMin))()
					valueMin = math.floor(valueMin)
				end
				value = sLuaApp:RandInteger(valueMin,valueMax)
			end
			SPAttrs[a] = value
			SPNames[a] = b.Name
			SPShows[a] = b.isShow or 0
			SPA_Mode = 1
			--sLuaApp:NotifyTipsMsg(player, "随机到的【"..b.Name.."】的值为"..value)
		end
	end
	
	if EquipAttrRandom then
		if EquipAttrRandom.EquipReBuild then
			for k,v in ipairs(LinkTb['RandAttr']) do
				if type(v) == "string" then
					local rand_Tb = EquipAttrRandom.EquipReBuild[v]
					local rand_An = LinkTb['RandAttr'][k+1]
					if type(rand_An) ~= "number" then
						rand_An = 1
					end
					local str = ""
					if SPA_Mode == 1 then
						for a,b in ipairs(SPAttrs) do
							str = str .. "local SPAttr_" .. a .. " = " .. b .. " "
						end
					end
					for a,b in pairs(EquipAttrRandom.ReturnAttrList("EquipReBuild", v, rand_An)) do
						local value
						if b.minValue == b.maxValue then
							value = b.minValue
							if type(value) == "string" then
								value = assert(load("local level = "..(Level or itemData.Itemlevel).." "..str.." return "..value))()
								sLuaApp:LuaDbg("level = " .. (Level or itemData.Itemlevel) .. "   func = " .. value)
								value = math.floor(value) 
							end
						else
							local valueMax = b.maxValue
							local valueMin = b.minValue
							if type(valueMax) == "string" then
								valueMax = assert(load("local level = "..(Level or itemData.Itemlevel).." "..str.." return "..valueMax))()
								valueMax = math.floor(valueMax)
							end
							if type(valueMin) == "string" then
								valueMin = assert(load("local level = "..(Level or itemData.Itemlevel).." "..str.." return "..valueMin))()
								valueMin = math.floor(valueMin)
							end
							value = sLuaApp:RandInteger(valueMin,valueMax)
						end
						newList[a] = value
					end
				end
			end
		end
	end
	
	local attrNum = 0
	local spAttrNum = 0
	local Inte = 0
	if EquipIntensify then
		Inte = EquipIntensify.GetInteRand(item)
	end
	for k,v in ipairs(SPAttrs) do
		spAttrNum = spAttrNum + 1
		item:SetString("ITEM_RebuidingSPAttrNa_"..spAttrNum, SPNames[k])
		item:SetInt("ITEM_RebuidingSPAttrVa_"..spAttrNum, v)
		item:SetInt("ITEM_RebuidingSPAttrSh_"..spAttrNum, SPShows[k] or 0)
	end
	item:SetInt("ITEM_RebuidingSPAttrNum", spAttrNum)
	for k,v in pairs(newList) do
		attrNum = attrNum + 1
		item:SetInt("ITEM_RebuidingAttrId_"..attrNum, k)
		item:SetInt("ITEM_RebuidingAttrVa_"..attrNum, v)
		item:SetInt("ITEM_RebuidingAttrVaPlus_"..attrNum, math.floor(v*(Inte+10000)/10000))
	end
	sLuaApp:LuaDbg("attrNum = " .. attrNum .. "   spAttrNum = ".. spAttrNum)
	item:SetInt("ITEM_RebuidingAttrNum", attrNum)
	local str = [[if EquipRecastUI then EquipRecastUI.Refresh() end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipReBuild.RefreshSavedAttr(item)
	local Inte = EquipIntensify.GetInteRand(item)
	for i = 1, item:GetInt("ITEM_RebuidingAttrNum") do
		item:SetInt("ITEM_RebuidingAttrVaPlus_"..i, math.floor(item:GetInt("ITEM_RebuidingAttrVa_"..i)*(Inte+10000)/10000))
	end
end

function EquipReBuild.LinkTbTest(EquipType, SiteType, Role, Level, Alevel)
	local key = EquipType .. "_" .. SiteType .. "_" .. Role .. "_" .. Level .. "_" .. Alevel
	local LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_" .. Role .. "_" .. Level .. "_0"
	LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_" .. Role .. "_0_"..Alevel
	LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_" .. Role .. "_0_0"
	LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_0_" .. Level .. "_" .. Alevel
	LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_0_" .. Level .. "_0"
	LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_0_0_" .. Alevel
	LinkTb = EquipReBuild.Links[key]
	if LinkTb then
		return LinkTb
	end
	key = EquipType .. "_" .. SiteType .. "_0_0_0"
	LinkTb = EquipReBuild.LibraryLink[key]
	if LinkTb then
		return LinkTb
	end
	key = "0_0_0_0_0"
	LinkTb = EquipReBuild.LibraryLink[key]
	if LinkTb then
		return LinkTb
	end
	
	return nil
end

function EquipReBuild.Confirm(player, item_guid, guard_guid)
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local item_id = item:GetId()
	local guard = sGuardSystem:GetGuard(tonumber(guard_guid))
	if guard == nil then
		if item:GetOwnerGUID() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	else
		local guard = sGuardSystem:GetGuard(guard_guid)
		local Master = guard:GetMaster()
		if item:GetOwnerGUID() ~= player:GetGUID() then
			if item:GetOwnerGUID() ~= guard:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
			if Master:GetGUID() ~= player:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
		end
	end
	
	local AttrNum = item:GetInt("ITEM_RebuidingAttrNum")
	local SPAttrNum = item:GetInt("ITEM_RebuidingSPAttrNum")
	if AttrNum + SPAttrNum <= 0 then
		sLuaApp:NotifyTipsMsg(player, "装备还没有被重铸过")
		return ""
	end
	item:SetDynAttrsByMark(0,0)
	for i = 1,AttrNum do
		item:SetDynAttr(0, item:GetInt("ITEM_RebuidingAttrId_"..i), item:GetInt("ITEM_RebuidingAttrVa_"..i))
		item:SetInt("ITEM_RebuidingAttrId_"..i, 0)
		item:SetInt("ITEM_RebuidingAttrVa_"..i, 0)
		item:SetInt("ITEM_RebuidingAttrVaPlus_"..i, 0)
	end
	item:SetInt("ITEM_RebuidingAttrNum",0)
	for i = 1,SPAttrNum do
		item:SetString("ITEM_SPAttrNa_"..i, item:GetString("ITEM_RebuidingSPAttrNa_"..i))
		item:SetInt("ITEM_SPAttrVa_"..i, item:GetInt("ITEM_RebuidingSPAttrVa_"..i))
		item:SetString("ITEM_RebuidingSPAttrNa_"..i, "")
		item:SetInt("ITEM_RebuidingSPAttrVa_"..i, 0)
		item:SetInt("ITEM_SPAttrSh_"..i, item:GetInt("ITEM_RebuidingSPAttrSh_"..i))
		item:SetInt("ITEM_RebuidingSPAttrSh_"..i, 0)
	end
	item:SetInt("ITEM_RebuidingSPAttrNum", 0)
	item:SetInt("ITEM_SPAttrNum", SPAttrNum)
	
	local Inte = 0
	if EquipIntensify then
		Inte = EquipIntensify.GetInteRand(item)
		if Inte > 0 then
			EquipIntensify.RefreshAttr(item)
		end
	end

	if SevenDayCallBack.EquipReBuild then
		SevenDayCallBack.EquipReBuild(player)
	end
	
	sLuaApp:NotifyTipsMsg(player, "装备重铸成功！")
end

function EquipReBuild.Initialization(check)
	if check ~= 0 then
		return
	end
	--print("EquipReBuild.Initialization")
	if not EquipReBuildConfig then
		require("form/EquipBuild_Config")
	end
	if EquipReBuildConfig then
		--print("EquipReBuildConfig")
		if not EquipReBuild.Links then
			EquipReBuild.Links = {}
		end
		
		if EquipReBuild.LibraryLink then
			for k,v in pairs(EquipReBuild.LibraryLink) do
				local key = ''..(v.EquipType or '0')..'_'..(v.SiteType or '0')..'_'..(v.Role or '0')..'_'..(v.Level or '0')..'_'..(v.Alevel or '0')
				EquipReBuild.Links[key] = {}
				if v.LockAttr then
					EquipReBuild.Links[key]['LockAttr'] = {}
					for a,b in ipairs(v.LockAttr) do
						EquipReBuild.Links[key]['LockAttr'][AttrConfig.GetByKeyName(b).Id] = 1
					end
					EquipReBuild.Links[key]['RandAttr'] = v.RandAttr
				end				
			end
		end
		--print(Lua_tools.serialize(EquipReBuild.Synthesis))
	end
	EquipReBuild.AllowList = {}
	for k,v in pairs(EquipReBuild.KeyNameLink) do
		local id = ItemConfig.GetByKeyName(k).Id
		if id then
			EquipReBuild.AllowList[id] = 1
		end
	end
end

--EquipReBuild.Initialization(0)