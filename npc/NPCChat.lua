--NPC闲聊
NPCChat = {}

NPCChat.NPCList = {
    --长安城
    ["长安-切磋-哪吒"] = {MapKey = "长安城" , x = 206 , y = 184 , text1 = "不知父亲大人和哥哥他们最近如何？" , text2 = "我的爱好就是收服各种神兽。"},
    ["长安城-领双"] = {MapKey = "长安城" , x = 285 , y = 193 , text1 = "天降福泽，事半功倍！" , text2 = "不要忘记领取我这里的福利。"},
    ["长安城-运镖-艾大米"] = {MapKey = "长安城" , x = 495 , y = 135 , text1 = "我们艾家商会可是全长安城最大的商会！" , text2 = "帮我们护送银子，少不了你的好处。"},
    ["长安城-装备商店"] = {MapKey = "长安城" , x = 363 , y = 300 , text1 = "上好的五彩刻丝石青银鼠褂，不来瞧一瞧吗？" , text2 = "朝阳五凤挂珠钗、翡翠撒花洋绉裙，可是我们镇店之宝！。"},
    ["长安城-武器商店"] = {MapKey = "长安城" , x = 382 , y = 289 , text1 = "刀枪剑戟，斧钺钩叉，镗棍槊棒，鞭锏锤爪，拐子流星。" , text2 = "刀剑无眼，莫要冲动行事。"},
    ["长安城-饰品商店"] = {MapKey = "长安城" , x = 407 , y = 340 , text1 = "何处瑶天笙弄，听云鹤缥缈，玉佩丁冬。" , text2 = "珩佩流响，缨绂有容！"},
    ["长安城-杂货商店"] = {MapKey = "长安城" , x = 528 , y = 176 , text1 = "日用百货，应有尽有！" , text2 = "来一来看一看，上好的货色！"},
    ["长安城-药品商店"] = {MapKey = "长安城" , x = 550 , y = 246 , text1 = "良医之道，必先诊脉处方，次即针灸，内外相扶，病必当愈。" , text2 = "胆欲大而心欲小，智欲圆而行欲方。"},
    ["长安城-宠物商店"] = {MapKey = "长安城" , x = 320 , y = 341 , text1 = "苏家灵宠，品质保证！" , text2 = "我的两个妹妹那里也有上好的灵宠呦。"},
    ["长安城-仓库"] = {MapKey = "长安城" , x = 605 , y = 133 , text1 = "想当年，我也是长安一枝花！" , text2 = "将物品存在我们这里，保证安全！"},
    ["长安城-邮箱"] = {MapKey = "长安城" , x = 340 , y = 149 , text1 = "欲寄彩笺兼尺素，山长水阔知何处。" , text2 = "来看看有没有你的邮件。"},
    ["长安城-染色师"] = {MapKey = "长安城" , x = 477 , y = 214 , text1 = "爱美之心，人皆有之！" , text2 = "我的染色剂都是天然染料。"},
    ["长安城-红娘"] = {MapKey = "长安城" , x = 261 , y = 261 , text1 = "关关雎鸠，在河之洲。窈窕淑女，君子好逑。" , text2 = "不要错过你的那位有缘人。"},
    ["长安城-轿夫"] = {MapKey = "长安城" , x = 220 , y = 261 , text1 = "等发了俸禄，就有银子让我那小儿子去上私塾了。" , text2 = "轿夫也是门技术活，不能让客人感到颠簸。"},
    ["闲散-大唐卫士"] = {MapKey = "长安城" , x = 149 , y = 83 , text1 = "闲杂人等，不得靠近！" , text2 = "擅闯皇宫者，斩立决！"},
    ["长安拜访-刘圣手"] = {MapKey = "长安城" , x = 568 , y = 130 , text1 = "天下宝贝甚多，可有缘者甚少呦" , text2 = "说起寻宝，我若称第二，没人敢称第一。"},
    ["不败战神"] = {MapKey = "长安城" , x = 276 , y = 133 , text1 = "会当凌绝顶，一览众山小。" , text2 = "天梯从来都只是勇敢者的游戏。"},
    ["长安城-离婚"] = {MapKey = "长安城" , x = 190 , y = 276 , text1 = "汪汪汪汪汪汪汪汪汪！" , text2 = "别叫我单身狗，叫我孤狼！"},



    --西梁女国
    ["切磋-女儿国国王"] = {MapKey = "西梁女国" , x = 69 , y = 35 , text1 = "说什么王权富贵？怕什么戒律清规！" , text2 = "只愿天长地久，与我意中人紧相随。"},
    ["西梁女国-传送"] = {MapKey = "西梁女国" , x = 102 , y = 71 , text1 = "一个人好无聊，谁能陪我玩一会？" , text2 = "想去什么地方我都可以把你传送过去哦。"},
    ["西梁女国-仓库"] = {MapKey = "西梁女国" , x = 75 , y = 89 , text1 = "天下攘攘，皆为利往！" , text2 = "干我们这一行的，信誉是第一位。"},
    ["西梁女国-领双"] = {MapKey = "西梁女国" , x = 168 , y = 103 , text1 = "天降福泽，事半功倍！" , text2 = "不要忘记领取我这里的福利。"},
    ["西梁女国-药品商店"] = {MapKey = "西梁女国" , x = 240 , y = 75 , text1 = "行走江湖，少不了要准备一些药物。" , text2 = "明治病之术者，杜未生之疾。"},
    ["西梁女国-饰品商店"] = {MapKey = "西梁女国" , x = 104 , y = 145 , text1 = "君子无故，玉不去身！" , text2 = "珩佩流响，缨绂有容！"},
    ["西梁女国-武器商店"] = {MapKey = "西梁女国" , x = 171 , y = 157 , text1 = "大丈夫当配三尺之剑，立不世之功！" , text2 = "无论多好的兵刃，也需要一个优秀的主人！"},
    ["西梁女国-宠物商店"] = {MapKey = "西梁女国" , x = 168 , y = 56 , text1 = "我们苏家的灵宠可是闻名天下。" , text2 = "好好对待你的宠物，它们的世界里只有你。"},
    ["西梁女国-杂货商店"] = {MapKey = "西梁女国" , x = 206 , y = 32 , text1 = "我卖的虽然不是什么奇珍异宝，但样样都是必备物品。" , text2 = "来一来看一看，上好的货色！"},
    ["西梁女国-装备商店"] = {MapKey = "西梁女国" , x = 241 , y = 112 , text1 = "好马配好鞍，好船配好帆。" , text2 = "二龙抢珠金抹额、束发嵌宝紫金冠，可是我们镇店之宝！。"},

    --傲来村
    ["傲来村-邮箱"] = {MapKey = "傲来村" , x = 128 , y = 51 , text1 = "江水三千里，家书十五行。" , text2 = "云中谁寄锦书来，雁字回时，月满西楼。"},
    ["傲来村-装备商店"] = {MapKey = "傲来村" , x = 151 , y = 91 , text1 = "长安运来的上好绸缎，光鲜亮丽！" , text2 = "佛靠金装，人靠衣装！"},
    ["傲来村-武器商店"] = {MapKey = "傲来村" , x = 186 , y = 124 , text1 = "宝剑锋从磨砺出！" , text2 = "工欲善其事，必先利其器"},
    ["傲来村-饰品商店"] = {MapKey = "傲来村" , x = 62 , y = 31 , text1 = "君子无故，玉不去身！" , text2 = "玉之美，有如君子之德。"},
    ["傲来村-杂货商店"] = {MapKey = "傲来村" , x = 102 , y = 137 , text1 = "奇珍异宝，应有尽有！" , text2 = "来一来看一看，都是上好的货色。"},
    ["傲来村-药品商店"] = {MapKey = "傲来村" , x = 50 , y = 118 , text1 = "古之初为道者，莫不兼修医术，以救近祸焉！" , text2 = "药能活人，亦能杀人，生死关头，间不容发，可不慎欤。"},
    ["傲来村-宠物商店"] = {MapKey = "傲来村" , x = 134 , y = 27 , text1 = "我们苏家的灵宠个个都是精心培育的。" , text2 = "有宠物的陪伴，是不是不感到孤单了呢。"},
    ["傲来村-仓库"] = {MapKey = "傲来村" , x = 81 , y = 98 , text1 = "天下攘攘，皆为利往！" , text2 = "将物品存在我们这里，保证安全！"},
    ["傲来村-领双"] = {MapKey = "傲来村" , x = 104 , y = 41 , text1 = "双倍经验福利，错过就没了啊！" , text2 = "天降福泽，事半功倍！"},
}

function NPCChat.on_npc_create(npc)
    if NPCChat.NPCList[npc:GetKeyName()] == nil then
        return
    else
        local RandNum = sLuaApp:RandInteger(40*1000,70*1000)
        sLuaTimerSystem:AddTimerEx(npc , RandNum , -1 , "NPCChat.CallBack" , "")
        local NPCkey = npc:GetKeyName()
        npc:SetString("NpcMapKey",NPCChat.NPCList[NPCkey].MapKey)
        npc:SetString("NpcText1",NPCChat.NPCList[NPCkey].text1)
        npc:SetString("NpcText2",NPCChat.NPCList[NPCkey].text2)
        npc:SetInt("NpcMapX",NPCChat.NPCList[NPCkey].x)
        npc:SetInt("NpcMapY",NPCChat.NPCList[NPCkey].y)
    end
end

function NPCChat.CallBack(npc)
    if npc == nil then
        return ""
    end
    local TextNum = sLuaApp:RandInteger(1,2)
    local NPCName = npc:GetName()
    local map = sMapSystem:GetMapByKey(npc:GetString("NpcMapKey"))
    local text = npc:GetString("NpcText"..TextNum)

    local str = [[
        if ChatUI then
            ChatUI.WorldNPCMessage("]]..text..[[","]].. NPCName..[[")
        end
    ]]
    sLuaApp:ShowAroundForm(map , npc:GetInt("NpcMapX") , npc:GetInt("NpcMapY") , "脚本表单" , str)
end