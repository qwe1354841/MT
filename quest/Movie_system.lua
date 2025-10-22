--剧情动画系统
Movie_system = {}


Movie_system.MovieConfig = {
	--quest_state 中 quest_state分别代表任务 可接、已接 或 可交付 的三个状态。1表示必须满足，0表示必须不满足，-1表示无所谓
	--凡是有地图相关的配置，全部采取 表格中4参数配置 4个参数分别为  地图 keyname， 地图ID， 玩家出现位置x，玩家出现出现y
	--teamMovie配置为组队任务配置，该配置为true时，只有队长完成动画才会进入完成后触发，且队长完成动画会导致队友同样完成
	--["Quest_1"] = {movie_name = "SMovie_101", quest_state = {1,-1,-1}, map = {"玄阴池", 213, 252, 25}, savepoint = "1", remarks = "开场动画"},
	["Quest_200"] = {movie_name = "SMovie_103", quest_state = {1,-1,-1}, map = {"傲来村", 201, 107, 51}, savepoint = "3", remarks = "开场动画", teamMovie = true},
	["Quest_228"] = {movie_name = "SMovie_104", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 67, 45}, savepoint = "4", remarks = "开场动画", teamMovie = true},
	--["Quest_222"] = {movie_name = "SMovie_104", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 67, 45}, savepoint = "4", remarks = "开场动画", teamMovie = true},
	--["Quest_223"] = {movie_name = "SMovie_104", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 67, 45}, savepoint = "4", remarks = "开场动画", teamMovie = true},
	--["Quest_224"] = {movie_name = "SMovie_104", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 67, 45}, savepoint = "4", remarks = "开场动画", teamMovie = true},
	--["Quest_225"] = {movie_name = "SMovie_104", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 67, 45}, savepoint = "4", remarks = "开场动画", teamMovie = true},
	["Quest_236"] = {movie_name = "SMovie_105", quest_state = {-1,-1,-1}, map = {"长安城", 210, 480, 147}, savepoint = "5", remarks = "长安城1", teamMovie = true},
	["Quest_237"] = {movie_name = "SMovie_106", quest_state = {-1,-1,-1}, map = {"长安城", 210, 110, 79}, savepoint = "6", remarks = "长安城2", teamMovie = true},
	["Quest_256"] = {movie_name = "SMovie_107", quest_state = {-1,-1,-1}, map = {"慈恩寺", 204, 108, 26}, savepoint = "7", remarks = "长安城2", teamMovie = true},
	["Quest_264"] = {movie_name = "SMovie_108", quest_state = {-1,-1,-1}, map = {"大雁塔七层", 307, 62, 35}, savepoint = "8", remarks = "长安城2", teamMovie = true},
	["Quest_421"] = {movie_name = "SMovie_109", quest_state = {-1,-1,-1}, map = {"解阳山", 207, 33, 141}, savepoint = "109", remarks = "775接任务剧情动画", teamMovie = true},
	["Quest_427"] = {movie_name = "SMovie_110", quest_state = {-1,-1,-1}, map = {"天界", 238, 17, 140}, savepoint = "110", remarks = "第一次进天界剧情动画", teamMovie = true},
	["Quest_430"] = {movie_name = "SMovie_111", quest_state = {-1,-1,-1}, map = {"天界", 238, -1, -1}, savepoint = "111", remarks = "天界收敛宝物剧情动画", teamMovie = true},
	["Quest_439"] = {movie_name = "SMovie_112", quest_state = {-1,-1,-1}, map = {"丹炉地宫一层-不遇敌", 442, -1, -1}, savepoint = "112", remarks = "被投入丹炉剧情动画", teamMovie = true},
	["Quest_441"] = {movie_name = "SMovie_113", quest_state = {-1,-1,-1}, map = {"丹炉地宫二层-不遇敌", 443, -1, -1}, savepoint = "113", remarks = "深入丹炉二层剧情动画", teamMovie = true},
	["Quest_443"] = {movie_name = "SMovie_114", quest_state = {-1,-1,-1}, map = {"丹炉地宫三层-不遇敌", 444, 147, 104}, savepoint = "114", remarks = "深入丹炉三层剧情动画", teamMovie = true},
	["Quest_452"] = {movie_name = "SMovie_115", quest_state = {-1,-1,-1}, map = {"解阳山", 207, 31, 49}, savepoint = "115", remarks = "805完成任务跳地图剧情动画", teamMovie = true},
	["Quest_456"] = {movie_name = "SMovie_116", quest_state = {-1,-1,-1}, map = {"丹炉地宫一层-不遇敌", 442, 63, 90}, savepoint = "116", remarks = "再返丹炉剧情动画", teamMovie = true},
	["Quest_459"] = {movie_name = "SMovie_117", quest_state = {-1,-1,-1}, map = {"丹炉地宫五层-不遇敌", 446, -1, -1}, savepoint = "117", remarks = "深入丹炉五层剧情动画", teamMovie = true},
	["Quest_464"] = {movie_name = "SMovie_118", quest_state = {-1,-1,-1}, map = {"丹炉地宫五层-不遇敌", 446, -1, -1}, savepoint = "118", remarks = "815完成剧情动画", teamMovie = true},
	["Quest_471"] = {movie_name = "SMovie_119", quest_state = {-1,-1,-1}, map = {"长安城", 210, 172, 118}, savepoint = "119", remarks = "825完成剧情动画", teamMovie = true},
	["Quest_482"] = {movie_name = "SMovie_120", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "120", remarks = "836完成剧情动画", teamMovie = true},
	["Quest_484"] = {movie_name = "SMovie_121", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "121", remarks = "838接任务剧情动画", teamMovie = true},
	["Quest_491"] = {movie_name = "SMovie_122", quest_state = {-1,-1,-1}, map = {"酆都", 215, 202, 70}, savepoint = "122", remarks = "845进酆都剧情动画", teamMovie = true},
	["Quest_493"] = {movie_name = "SMovie_123", quest_state = {-1,-1,-1}, map = {"两界山", 216, 40, 19}, savepoint = "123", remarks = "847两界山进地图剧情动画", teamMovie = true},
	["Quest_495"] = {movie_name = "SMovie_124", quest_state = {-1,-1,-1}, map = {"两界山", 216, -1, -1}, savepoint = "124", remarks = "849任务完成剧情动画", teamMovie = true},
	["Quest_496"] = {movie_name = "SMovie_125", quest_state = {-1,-1,-1}, map = {"两界山", 216, -1, -1}, savepoint = "125", remarks = "850任务完成剧情动画", teamMovie = true},
	["Quest_497"] = {movie_name = "SMovie_126", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "126", remarks = "851任务完成剧情动画", teamMovie = true},
	["Quest_508"] = {movie_name = "SMovie_140", quest_state = {-1,-1,-1}, map = {"丹炉地宫二层", 241, -1, -1}, savepoint = "874", remarks = "丹炉地宫二层", teamMovie = true},
	["Quest_509"] = {movie_name = "SMovie_141", quest_state = {-1,-1,-1}, map = {"丹炉地宫一层", 240, -1, -1}, savepoint = "875", remarks = "丹炉地宫一层", teamMovie = true},
	["Quest_512"] = {movie_name = "SMovie_142", quest_state = {-1,-1,-1}, map = {"两界山", 216, -1, -1}, savepoint = "879", remarks = "两界山", teamMovie = true},
	["Quest_529"] = {movie_name = "SMovie_143", quest_state = {-1,-1,-1}, map = {"丹炉地宫一层", 442, -1, -1}, savepoint = "887", remarks = "魔力食物", teamMovie = true},
	["Quest_520"] = {movie_name = "SMovie_144", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "888", remarks = "蟠桃园", teamMovie = true},
	--["Quest_90405"] = {movie_name = "SMovie_145", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "889", remarks = "蟠桃园", teamMovie = true},
	["Quest_522"] = {movie_name = "SMovie_146", quest_state = {-1,-1,-1}, map = {"西梁女国", 217, -1, -1}, savepoint = "891", remarks = "西梁女国", teamMovie = true},
	["Quest_532"] = {movie_name = "SMovie_147", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "902", remarks = "蟠桃园", teamMovie = true},
	["Quest_533"] = {movie_name = "SMovie_148", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "903", remarks = "蟠桃园", teamMovie = true},
	["Quest_534"] = {movie_name = "SMovie_149", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "904", remarks = "蟠桃园", teamMovie = true},
	["Quest_535"] = {movie_name = "SMovie_150", quest_state = {-1,-1,-1}, map = {"蟠桃园", 239, -1, -1}, savepoint = "905", remarks = "蟠桃园", teamMovie = true},

	["Quest_90701"] = {movie_name = "SMovie_701", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔一层", 401, 67, 89}, savepoint = "701", remarks = "秘境-大雁塔一层"},
	["Quest_90702"] = {movie_name = "SMovie_702", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔二层", 402, 105, 49}, savepoint = "702", remarks = "秘境-大雁塔二层"},
	["Quest_90703"] = {movie_name = "SMovie_703", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔三层", 403, 170, 64}, savepoint = "703", remarks = "秘境-大雁塔层"},
	["Quest_90704"] = {movie_name = "SMovie_704", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔四层", 404, 41, 68}, savepoint = "704", remarks = "秘境-大雁塔四层"},
	["Quest_90705"] = {movie_name = "SMovie_705", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔五层", 405, 72, 46}, savepoint = "705", remarks = "秘境-大雁塔五层"},
	["Quest_90706"] = {movie_name = "SMovie_706", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔六层", 406, 80, 98}, savepoint = "706", remarks = "秘境-大雁塔六层"},
	["Quest_90707"] = {movie_name = "SMovie_707", quest_state = {-1,-1,-1}, map = {"秘境-大雁塔七层", 407, 58, 34}, savepoint = "707", remarks = "秘境-大雁塔七层"},
	["Quest_90708"] = {movie_name = "SMovie_708", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址一层", 408, 119, 112}, savepoint = "708", remarks = "秘境-砂城遗址一层"},
	["Quest_90709"] = {movie_name = "SMovie_709", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址二层", 409, 46, 81}, savepoint = "709", remarks = "秘境-砂城遗址二层"},
	["Quest_90710"] = {movie_name = "SMovie_710", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址三层", 410, 80, 39}, savepoint = "710", remarks = "秘境-砂城遗址三层"},
	["Quest_90711"] = {movie_name = "SMovie_711", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址四层", 411, 30, 47}, savepoint = "711", remarks = "秘境-砂城遗址四层"},
	["Quest_90712"] = {movie_name = "SMovie_712", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址五层", 412, 114, 119}, savepoint = "712", remarks = "秘境-砂城遗址五层"},
	["Quest_90713"] = {movie_name = "SMovie_713", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址六层", 413, 144, 28}, savepoint = "713", remarks = "秘境-砂城遗址六层"},
	["Quest_90714"] = {movie_name = "SMovie_714", quest_state = {-1,-1,-1}, map = {"秘境-砂城遗址七层", 414, 23, 32}, savepoint = "714", remarks = "秘境-砂城遗址七层"},
	["Quest_90715"] = {movie_name = "SMovie_715", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟一层", 415, 41, 98}, savepoint = "715", remarks = "秘境-水帘洞窟一层"},
	["Quest_90716"] = {movie_name = "SMovie_716", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟二层", 416, 30, 61}, savepoint = "716", remarks = "秘境-水帘洞窟二层"},
	["Quest_90717"] = {movie_name = "SMovie_717", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟三层", 417, 33, 48}, savepoint = "717", remarks = "秘境-水帘洞窟三层"},
	["Quest_90718"] = {movie_name = "SMovie_718", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟四层", 418, 171, 50}, savepoint = "718", remarks = "秘境-水帘洞窟四层"},
	["Quest_90719"] = {movie_name = "SMovie_719", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟五层", 419, 29, 47}, savepoint = "719", remarks = "秘境-水帘洞窟五层"},
	["Quest_90720"] = {movie_name = "SMovie_720", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟六层", 420, 35, 100}, savepoint = "720", remarks = "秘境-水帘洞窟六层"},
	["Quest_90721"] = {movie_name = "SMovie_721", quest_state = {-1,-1,-1}, map = {"秘境-水帘洞窟七层", 421, 34, 60}, savepoint = "721", remarks = "秘境-水帘洞窟七层"},
	["Quest_90722"] = {movie_name = "SMovie_722", quest_state = {-1,-1,-1}, map = {"秘境-70一层", 426, -1, -1}, savepoint = "722", remarks = "秘境-70一层"},
	["Quest_90723"] = {movie_name = "SMovie_723", quest_state = {-1,-1,-1}, map = {"秘境-70二层", 427, -1, -1}, savepoint = "723", remarks = "秘境-70二层"},
	["Quest_90724"] = {movie_name = "SMovie_724", quest_state = {-1,-1,-1}, map = {"秘境-70三层", 428, -1, -1}, savepoint = "724", remarks = "秘境-70三层"},
	["Quest_90725"] = {movie_name = "SMovie_725", quest_state = {-1,-1,-1}, map = {"秘境-70四层", 429, -1, -1}, savepoint = "725", remarks = "秘境-70四层"},
	["Quest_90726"] = {movie_name = "SMovie_726", quest_state = {-1,-1,-1}, map = {"秘境-70五层", 430, -1, -1}, savepoint = "726", remarks = "秘境-70五层"},
	["Quest_90727"] = {movie_name = "SMovie_727", quest_state = {-1,-1,-1}, map = {"秘境-70六层", 431, -1, -1}, savepoint = "727", remarks = "秘境-70六层"},
	["Quest_90728"] = {movie_name = "SMovie_728", quest_state = {-1,-1,-1}, map = {"秘境-70七层", 432, -1, -1}, savepoint = "728", remarks = "秘境-70七层"},
	["Quest_90800"] = {movie_name = "SMovie_800", quest_state = {-1,-1,-1}, map = {"副本-梦回千古", 422, -1, -1}, savepoint = "-1", remarks = "副本-梦回千古", teamMovie = true},
	["Quest_90801"] = {movie_name = "SMovie_801", quest_state = {-1,-1,-1}, map = {"副本-梦回千古", 422, -1, -1}, savepoint = "-1", remarks = "副本-梦回千古", teamMovie = true},
	["Quest_90802"] = {movie_name = "SMovie_802", quest_state = {-1,-1,-1}, map = {"副本-梦回千古", 422, -1, -1}, savepoint = "-1", remarks = "副本-梦回千古", teamMovie = true},
	["Quest_90803"] = {movie_name = "SMovie_803", quest_state = {-1,-1,-1}, map = {"45副本", 423, -1, -1}, savepoint = "-1", remarks = "45副本", teamMovie = true},
	["Quest_90804"] = {movie_name = "SMovie_804", quest_state = {-1,-1,-1}, map = {"45副本", 423, -1, -1}, savepoint = "-1", remarks = "45副本", teamMovie = true},
	["Quest_90805"] = {movie_name = "SMovie_805", quest_state = {-1,-1,-1}, map = {"45副本", 423, -1, -1}, savepoint = "-1", remarks = "45副本", teamMovie = true},
	["Quest_90806"] = {movie_name = "SMovie_806", quest_state = {-1,-1,-1}, map = {"45副本", 423, -1, -1}, savepoint = "-1", remarks = "45副本", teamMovie = true},
	["Quest_90807"] = {movie_name = "SMovie_807", quest_state = {-1,-1,-1}, map = {"45副本", 423, -1, -1}, savepoint = "-1", remarks = "45副本", teamMovie = true},
	["Quest_90808"] = {movie_name = "SMovie_808", quest_state = {-1,-1,-1}, map = {"45副本", 423, -1, -1}, savepoint = "-1", remarks = "45副本", teamMovie = true},
	["Quest_90809"] = {movie_name = "SMovie_809", quest_state = {-1,-1,-1}, map = {"70副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "70副本-花果山", teamMovie = true},
	["Quest_90810"] = {movie_name = "SMovie_810", quest_state = {-1,-1,-1}, map = {"70副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "70副本-花果山", teamMovie = true},
	["Quest_90811"] = {movie_name = "SMovie_811", quest_state = {-1,-1,-1}, map = {"70副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "70副本-花果山", teamMovie = true},
	["Quest_90812"] = {movie_name = "SMovie_812", quest_state = {-1,-1,-1}, map = {"70副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "70副本-花果山", teamMovie = true},
	["Quest_90813"] = {movie_name = "SMovie_813", quest_state = {-1,-1,-1}, map = {"70副本-水帘洞窟", 424, -1, -1}, savepoint = "-1", remarks = "70副本-水帘洞窟", teamMovie = true},
	["Quest_90814"] = {movie_name = "SMovie_814", quest_state = {-1,-1,-1}, map = {"80副本-酆都", 433, -1, -1}, savepoint = "-1", remarks = "80副本-酆都", teamMovie = true},
	["Quest_90815"] = {movie_name = "SMovie_815", quest_state = {-1,-1,-1}, map = {"80副本-解阳山", 434, -1, -1}, savepoint = "-1", remarks = "80副本-解阳山", teamMovie = true},
	["Quest_90816"] = {movie_name = "SMovie_816", quest_state = {-1,-1,-1}, map = {"80副本-解阳山", 434, -1, -1}, savepoint = "-1", remarks = "80副本-解阳山", teamMovie = true},
	["Quest_90817"] = {movie_name = "SMovie_817", quest_state = {-1,-1,-1}, map = {"80副本-解阳山", 434, -1, -1}, savepoint = "-1", remarks = "80副本-解阳山", teamMovie = true},
	["Quest_601"] = {movie_name = "SMovie_201", quest_state = {-1,-1,-1}, map = {"长安城", 210, 529, 256}, savepoint = "201", remarks = "谪剑仙支线开启", teamMovie = true},
	["Quest_615"] = {movie_name = "SMovie_202", quest_state = {-1,-1,-1}, map = {"傲来村", 201, 81, 48}, savepoint = "202", remarks = "青丘狐支线开启", teamMovie = true},
	["Quest_619"] = {movie_name = "SMovie_203", quest_state = {-1,-1,-1}, map = {"长安城", 210, -1, -1}, savepoint = "203", remarks = "青丘狐支线1", teamMovie = true},
	["Quest_627"] = {movie_name = "SMovie_204", quest_state = {-1,-1,-1}, map = {"长安城", 210, 484, 269}, savepoint = "204", remarks = "傲红莲支线开启", teamMovie = true},
	["Quest_635"] = {movie_name = "SMovie_205", quest_state = {-1,-1,-1}, map = {"江南野外", 209, -1, -1}, savepoint = "205", remarks = "傲红莲支线1", teamMovie = true},
	["Quest_637"] = {movie_name = "SMovie_206", quest_state = {-1,-1,-1}, map = {"长安城", 210, 497, 83}, savepoint = "206", remarks = "傲红莲支线2", teamMovie = true},
	["Quest_641"] = {movie_name = "SMovie_207", quest_state = {-1,-1,-1}, map = {"长安城", 210, 112, 287}, savepoint = "207", remarks = "花弄影支线开启", teamMovie = true},
	["Quest_657"] = {movie_name = "SMovie_208", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 150, 115}, savepoint = "208", remarks = "阎魔令支线开启", teamMovie = true},
	["Quest_666"] = {movie_name = "SMovie_209", quest_state = {-1,-1,-1}, map = {"江南野外", 209, -1, -1}, savepoint = "209", remarks = "阎魔令支线1", teamMovie = true},
	["Quest_671"] = {movie_name = "SMovie_210", quest_state = {-1,-1,-1}, map = {"酆都", 215, 139, 35}, savepoint = "210", remarks = "冥河使支线开启", teamMovie = true},
	["Quest_673"] = {movie_name = "SMovie_211", quest_state = {-1,-1,-1}, map = {"长安城", 210, -1, -1}, savepoint = "211", remarks = "冥河使支线1", teamMovie = true},
	["Quest_678"] = {movie_name = "SMovie_212", quest_state = {-1,-1,-1}, map = {"江南野外", 209, -1, -1}, savepoint = "212", remarks = "冥河使支线2", teamMovie = true},
	["Quest_685"] = {movie_name = "SMovie_213", quest_state = {-1,-1,-1}, map = {"傲来村", 201, 99, 57}, savepoint = "213", remarks = "神霄卫支线开启", teamMovie = true},
	["Quest_698"] = {movie_name = "SMovie_214", quest_state = {-1,-1,-1}, map = {"东海海湾", 208, 19, 63}, savepoint = "214", remarks = "雨师君支线开启", teamMovie = true},
	["Quest_706"] = {movie_name = "SMovie_215", quest_state = {-1,-1,-1}, map = {"水帘洞窟一层-不遇敌", 600, 83, 65}, savepoint = "215", remarks = "雨师君支线1", teamMovie = true},
	["Quest_716"] = {movie_name = "SMovie_216", quest_state = {-1,-1,-1}, map = {"东海海湾", 208, 13, 65}, savepoint = "216", remarks = "海鲛灵支线开启", teamMovie = true},
	["Quest_725"] = {movie_name = "SMovie_217", quest_state = {-1,-1,-1}, map = {"江南野外", 209, 116, 191}, savepoint = "217", remarks = "海鲛灵支线1", teamMovie = true},
	["Quest_728"] = {movie_name = "SMovie_218", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 160, 65}, savepoint = "218", remarks = "飞翼姬支线开启", teamMovie = true},
	["Quest_738"] = {movie_name = "SMovie_219", quest_state = {-1,-1,-1}, map = {"江南野外", 209, 81, 182}, savepoint = "219", remarks = "飞翼姬支线1", teamMovie = true},
	["Quest_741"] = {movie_name = "SMovie_220", quest_state = {-1,-1,-1}, map = {"长安城", 210, 125, 265}, savepoint = "220", remarks = "烟云客支线开启", teamMovie = true},
	["Quest_742"] = {movie_name = "SMovie_221", quest_state = {-1,-1,-1}, map = {"慈恩寺", 204, 207, 124}, savepoint = "221", remarks = "烟云客支线1", teamMovie = true},
	["Quest_755"] = {movie_name = "SMovie_222", quest_state = {-1,-1,-1}, map = {"傲来村野", 203, 142, 104}, savepoint = "222", remarks = "凤凰仙支线开启", teamMovie = true},
	["Quest_90818"] = {movie_name = "SMovie_818", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90819"] = {movie_name = "SMovie_819", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90820"] = {movie_name = "SMovie_820", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90821"] = {movie_name = "SMovie_821", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90822"] = {movie_name = "SMovie_822", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90823"] = {movie_name = "SMovie_823", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90824"] = {movie_name = "SMovie_824", quest_state = {-1,-1,-1}, map = {"90副本-傲来村", 423, -1, -1}, savepoint = "-1", remarks = "90副本-傲来村", teamMovie = true},
	["Quest_90825"] = {movie_name = "SMovie_825", quest_state = {-1,-1,-1}, map = {"100副本-玄阴池", 422, -1, -1}, savepoint = "-1", remarks = "100副本-玄阴池", teamMovie = true},
	["Quest_90826"] = {movie_name = "SMovie_826", quest_state = {-1,-1,-1}, map = {"100副本-玄阴池", 422, -1, -1}, savepoint = "-1", remarks = "100副本-玄阴池", teamMovie = true},
	["Quest_90827"] = {movie_name = "SMovie_827", quest_state = {-1,-1,-1}, map = {"100副本-玄阴池", 422, -1, -1}, savepoint = "-1", remarks = "100副本-玄阴池", teamMovie = true},
	["Quest_90828"] = {movie_name = "SMovie_828", quest_state = {-1,-1,-1}, map = {"100副本-玄阴池", 422, -1, -1}, savepoint = "-1", remarks = "100副本-玄阴池", teamMovie = true},
	["Quest_90829"] = {movie_name = "SMovie_829", quest_state = {-1,-1,-1}, map = {"110副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "110副本-花果山", teamMovie = true},
	["Quest_90830"] = {movie_name = "SMovie_830", quest_state = {-1,-1,-1}, map = {"110副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "110副本-花果山", teamMovie = true},
	["Quest_90831"] = {movie_name = "SMovie_831", quest_state = {-1,-1,-1}, map = {"110副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "110副本-花果山", teamMovie = true},
	["Quest_90832"] = {movie_name = "SMovie_832", quest_state = {-1,-1,-1}, map = {"110副本-花果山", 424, -1, -1}, savepoint = "-1", remarks = "110副本-花果山", teamMovie = true},
	["Quest_90833"] = {movie_name = "SMovie_833", quest_state = {-1,-1,-1}, map = {"110副本-水帘洞窟", 424, -1, -1}, savepoint = "-1", remarks = "110副本-水帘洞窟", teamMovie = true},
	["Quest_90834"] = {movie_name = "SMovie_834", quest_state = {-1,-1,-1}, map = {"120副本-酆都", 433, -1, -1}, savepoint = "-1", remarks = "120副本-酆都", teamMovie = true},
	["Quest_90835"] = {movie_name = "SMovie_835", quest_state = {-1,-1,-1}, map = {"120副本-解阳山", 434, -1, -1}, savepoint = "-1", remarks = "120副本-解阳山", teamMovie = true},
	["Quest_90836"] = {movie_name = "SMovie_836", quest_state = {-1,-1,-1}, map = {"120副本-解阳山", 434, -1, -1}, savepoint = "-1", remarks = "120副本-解阳山", teamMovie = true},
	["Quest_90837"] = {movie_name = "SMovie_837", quest_state = {-1,-1,-1}, map = {"120副本-解阳山", 434, -1, -1}, savepoint = "-1", remarks = "120副本-解阳山", teamMovie = true},
	["Quest_90838"] = {movie_name = "SMovie_838", quest_state = {-1,-1,-1}, map = {"110副本-水帘洞窟", 424, -1, -1}, savepoint = "-1", remarks = "110副本-水帘洞窟", teamMovie = true},
	["Quest_90839"] = {movie_name = "SMovie_839", quest_state = {-1,-1,-1}, map = {"110副本-水帘洞窟", 424, -1, -1}, savepoint = "-1", remarks = "110副本-水帘洞窟", teamMovie = true},
	["Quest_90840"] = {movie_name = "SMovie_840", quest_state = {-1,-1,-1}, map = {"110副本-水帘洞窟", 424, -1, -1}, savepoint = "-1", remarks = "110副本-水帘洞窟", teamMovie = true},
	["Quest_90841"] = {movie_name = "SMovie_841", quest_state = {-1,-1,-1}, map = {"120副本-解阳山", 424, -1, -1}, savepoint = "-1", remarks = "836完成剧情动画", teamMovie = true},
}

--完成后触发
--Mod = None		（动画播完之后进入无任何触发）
--Mod = Fight         Param = 触发的数值 （动画播完之后进入哪场战斗）
--Mod = MapChange         Param = [1]地图备注名（不计算） [2]地图ID [3]进入后X轴坐标 [4]进入后Y轴坐标 （动画播完之后去到哪场地图）
--Mod = SetStr         Param = [1]储存的str名 [2]储存的str内容 （动画播完之后激活指定引导，这个相关的用法详见小烤鸭）
--Mod = ReadyTask		Param = 任务值 （动画播完之后指定任务变成完成可交付状态，要求已经接取了该任务）
--Mod = CompleteTask		Param = 任务值 （动画播完之后强制交付指定任务，要求已经接取了该任务）
--Mod = AcceptTask		Param = 任务值 （动画播完之后接取指定任务）
--Mod = FBExitPopup		Param = [1]地图的keyname [2]弹窗类型  [3]弹窗倒计时  [4]弹窗内容（完成后弹出副本退出倒计时弹窗）
--Mod = Custom		动画播完后进入延时回调 Param = [1]地图的keyname [2]延迟几秒  [3]对应脚本和方法名  [4]参数，默认为""

Movie_system.MovieList = {
	--["SMovie_101"] = {savepoint = "0", EndTrigger = {mod = "Fight",param = 363}, remarks = "开场动画"},
	--["SMovie_102"] = {savepoint = "1", EndTrigger = {mod = "MapChange",param = {"傲来村", 201, 107,51}}, remarks = "战斗后动画"},
	["SMovie_103"] = {savepoint = "3", EndTrigger = {mod = "Custom",param = {"傲来村", 100, "Guidance.MovieEnd", "First_Login"}}, remarks = "傲来村说书人动画", teamMovie = true},
	["SMovie_104"] = {savepoint = "4", EndTrigger = {mod = "None",param = {"GuideID2","15"}}, remarks = "未知动画", teamMovie = true},
	["SMovie_105"] = {savepoint = "5", EndTrigger = {mod = "None",param = {"GuideID2","15"}}, remarks = "长安城1", teamMovie = true},
	["SMovie_106"] = {savepoint = "6", EndTrigger = {mod = "None",param = {"长安城", 210, 488, 145}}, remarks = "长安城2", teamMovie = true},
	["SMovie_107"] = {savepoint = "7", EndTrigger = {mod = "None",param = {"慈恩寺", 204, 184, 66}}, remarks = "长安城2", teamMovie = true},
	["SMovie_108"] = {savepoint = "8", EndTrigger = {mod = "None",param = {"大雁塔三层", 303, 84, 64}}, remarks = "未知动画", teamMovie = true},
	
	["SMovie_109"] = {savepoint = "109", EndTrigger = {mod = "AcceptTask",param = 421}, remarks = "775接任务剧情动画", teamMovie = true},
	["SMovie_110"] = {savepoint = "110", EndTrigger = {mod = "None",param = {"天界", 238, 17, 140}}, remarks = "第一次进天界剧情动画", teamMovie = true},
	["SMovie_111"] = {savepoint = "111", EndTrigger = {mod = "CompleteTask",param = 430}, remarks = "天界收敛宝物剧情动画", teamMovie = true},
	["SMovie_112"] = {savepoint = "112", EndTrigger = {mod = "AcceptTask",param = 439}, remarks = "被投入丹炉剧情动画", teamMovie = true},
	["SMovie_113"] = {savepoint = "113", EndTrigger = {mod = "AcceptTask",param = 441}, remarks = "深入丹炉二层剧情动画", teamMovie = true},
	["SMovie_114"] = {savepoint = "114", EndTrigger = {mod = "AcceptTask",param = 443}, remarks = "深入丹炉三层剧情动画", teamMovie = true},
	["SMovie_115"] = {savepoint = "115", EndTrigger = {mod = "AcceptTask",param = 452}, remarks = "805完成任务跳地图剧情动画", teamMovie = true},
	["SMovie_116"] = {savepoint = "116", EndTrigger = {mod = "AcceptTask",param = 456}, remarks = "再返丹炉剧情动画", teamMovie = true},
	["SMovie_117"] = {savepoint = "117", EndTrigger = {mod = "AcceptTask",param = 459}, remarks = "深入丹炉五层剧情动画", teamMovie = true},
	["SMovie_118"] = {savepoint = "118", EndTrigger = {mod = "CompleteTask",param = 464}, remarks = "815完成剧情动画", teamMovie = true},
	["SMovie_119"] = {savepoint = "119", EndTrigger = {mod = "CompleteTask",param = 471}, remarks = "825完成剧情动画", teamMovie = true},
	["SMovie_120"] = {savepoint = "120", EndTrigger = {mod = "AcceptTask",param = 483}, remarks = "825完成剧情动画", teamMovie = true},
	["SMovie_121"] = {savepoint = "121", EndTrigger = {mod = "CompleteTask",param = 484}, remarks = "838接任务剧情动画", teamMovie = true},
	["SMovie_122"] = {savepoint = "122", EndTrigger = {mod = "CompleteTask",param = 491}, remarks = "845进酆都剧情动画", teamMovie = true},
	["SMovie_123"] = {savepoint = "123", EndTrigger = {mod = "AcceptTask",param = 493}, remarks = "847两界山进地图剧情动画", teamMovie = true},
	["SMovie_124"] = {savepoint = "124", EndTrigger = {mod = "CompleteTask",param = 495}, remarks = "849任务完成剧情动画", teamMovie = true},
	["SMovie_125"] = {savepoint = "125", EndTrigger = {mod = "CompleteTask",param = 496}, remarks = "850任务完成剧情动画", teamMovie = true},
	["SMovie_126"] = {savepoint = "126", EndTrigger = {mod = "CompleteTask",param = 497}, remarks = "851任务完成剧情动画", teamMovie = true},
	["SMovie_140"] = {savepoint = "874", EndTrigger = {mod = "CompleteTask",param = 508}, remarks = "丹炉地宫二层", teamMovie = true},
	["SMovie_141"] = {savepoint = "875", EndTrigger = {mod = "CompleteTask",param = 509}, remarks = "丹炉地宫一层", teamMovie = true},
	["SMovie_142"] = {savepoint = "879", EndTrigger = {mod = "CompleteTask",param = 512}, remarks = "两界山", teamMovie = true},
	["SMovie_143"] = {savepoint = "887", EndTrigger = {mod = "AcceptTask",param = 529}, remarks = "魔力食物", teamMovie = true},
	["SMovie_144"] = {savepoint = "888", EndTrigger = {mod = "AcceptTask",param = 520}, remarks = "蟠桃园", teamMovie = true},
	--["SMovie_145"] = {savepoint = "889", EndTrigger = {mod = "CompleteTask",param = 889}, remarks = "蟠桃园", teamMovie = true},
	["SMovie_146"] = {savepoint = "891", EndTrigger = {mod = "AcceptTask",param = 522}, remarks = "西梁女国", teamMovie = true},
	["SMovie_147"] = {savepoint = "902", EndTrigger = {mod = "AcceptTask",param = 533}, remarks = "蟠桃园", teamMovie = true},
	["SMovie_148"] = {savepoint = "903", EndTrigger = {mod = "AcceptTask",param = 534}, remarks = "蟠桃园", teamMovie = true},
	["SMovie_149"] = {savepoint = "904", EndTrigger = {mod = "AcceptTask",param = 535}, remarks = "蟠桃园", teamMovie = true},
	["SMovie_150"] = {savepoint = "905", EndTrigger = {mod = "AcceptTask",param = 536}, remarks = "蟠桃园", teamMovie = true},

	
	["SMovie_701"] = {savepoint = "701", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔一层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔一层"},
	["SMovie_702"] = {savepoint = "702", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔二层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔二层"},
	["SMovie_703"] = {savepoint = "703", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔三层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔三层"},
	["SMovie_704"] = {savepoint = "704", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔四层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔四层"},
	["SMovie_705"] = {savepoint = "705", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔五层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔五层"},
	["SMovie_706"] = {savepoint = "706", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔六层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔六层"},
	["SMovie_707"] = {savepoint = "707", EndTrigger = {mod = "Custom",param = {"秘境-大雁塔七层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-大雁塔七层"},
	["SMovie_708"] = {savepoint = "708", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址一层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址一层"},
	["SMovie_709"] = {savepoint = "709", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址二层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址二层"},
	["SMovie_710"] = {savepoint = "710", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址三层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址三层"},
	["SMovie_711"] = {savepoint = "711", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址四层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址四层"},
	["SMovie_712"] = {savepoint = "712", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址五层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址五层"},
	["SMovie_713"] = {savepoint = "713", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址六层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址六层"},
	["SMovie_714"] = {savepoint = "714", EndTrigger = {mod = "Custom",param = {"秘境-砂城遗址七层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-砂城遗址七层"},
	["SMovie_715"] = {savepoint = "715", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟一层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟一层"},
	["SMovie_716"] = {savepoint = "716", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟二层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟二层"},
	["SMovie_717"] = {savepoint = "717", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟三层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟三层"},
	["SMovie_718"] = {savepoint = "718", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟四层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟四层"},
	["SMovie_719"] = {savepoint = "719", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟五层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟五层"},
	["SMovie_720"] = {savepoint = "720", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟六层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟六层"},
	["SMovie_721"] = {savepoint = "721", EndTrigger = {mod = "Custom",param = {"秘境-水帘洞窟七层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-水帘洞窟七层"},
	["SMovie_722"] = {savepoint = "722", EndTrigger = {mod = "Custom",param = {"秘境-70一层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70一层"},
	["SMovie_723"] = {savepoint = "723", EndTrigger = {mod = "Custom",param = {"秘境-70二层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70二层"},
	["SMovie_724"] = {savepoint = "724", EndTrigger = {mod = "Custom",param = {"秘境-70三层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70三层"},
	["SMovie_725"] = {savepoint = "725", EndTrigger = {mod = "Custom",param = {"秘境-70四层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70四层"},
	["SMovie_726"] = {savepoint = "726", EndTrigger = {mod = "Custom",param = {"秘境-70五层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70五层"},
	["SMovie_727"] = {savepoint = "727", EndTrigger = {mod = "Custom",param = {"秘境-70六层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70六层"},
	["SMovie_728"] = {savepoint = "728", EndTrigger = {mod = "Custom",param = {"秘境-70七层", 10, "FormList:is_guaji_enter_map", ""}}, remarks = "秘境-70七层"},
	["SMovie_800"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"副本-梦回千古", 303, 84, 64}}, remarks = "副本-梦回千古", teamMovie = true},
	["SMovie_801"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"副本-梦回千古", 303, 84, 64}}, remarks = "副本-梦回千古", teamMovie = true},
	["SMovie_802"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"副本-梦回千古", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "副本-梦回千古", teamMovie = true},
	["SMovie_803"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"45副本", 303, 84, 64}}, remarks = "45副本", teamMovie = true},
	["SMovie_804"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"45副本", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "45副本", teamMovie = true},
	["SMovie_805"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"45副本", 303, 84, 64}}, remarks = "45副本", teamMovie = true},
	["SMovie_806"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"45副本", 303, 84, 64}}, remarks = "45副本", teamMovie = true},
	["SMovie_807"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"45副本", 303, 84, 64}}, remarks = "45副本", teamMovie = true},
	["SMovie_808"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"45副本", 303, 84, 64}}, remarks = "45副本", teamMovie = true},
	["SMovie_809"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"70副本-花果山", 303, 84, 64}}, remarks = "70副本-花果山", teamMovie = true},
	["SMovie_810"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"70副本-花果山", 303, 84, 64}}, remarks = "70副本-花果山", teamMovie = true},
	["SMovie_811"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"70副本-花果山", 303, 84, 64}}, remarks = "70副本-花果山", teamMovie = true},
	["SMovie_812"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"70副本-花果山", 303, 84, 64}}, remarks = "70副本-花果山", teamMovie = true},
	["SMovie_813"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"70副本-水帘洞窟", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "70副本-水帘洞窟", teamMovie = true},
	["SMovie_814"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"80副本-酆都", 303, 84, 64}}, remarks = "80副本-酆都", teamMovie = true},
	["SMovie_815"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"80副本-解阳山", 303, 84, 64}}, remarks = "80副本-解阳山", teamMovie = true},
	["SMovie_816"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"80副本-解阳山", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "80副本-解阳山", teamMovie = true},
	["SMovie_817"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"80副本-解阳山", 303, 84, 64}}, remarks = "80副本-解阳山", teamMovie = true},
	["SMovie_201"] = {savepoint = "201", EndTrigger = {mod = "AcceptTask",param = 601}, remarks = "谪剑仙支线开启", teamMovie = true},
	["SMovie_202"] = {savepoint = "202", EndTrigger = {mod = "AcceptTask",param = 615}, remarks = "青丘狐支线开启", teamMovie = true},
	["SMovie_203"] = {savepoint = "203", EndTrigger = {mod = "None",param = {"长安城", 210, -1, -1}}, remarks = "青丘狐支线1", teamMovie = true},
	["SMovie_204"] = {savepoint = "204", EndTrigger = {mod = "AcceptTask",param = 627}, remarks = "傲红莲支线开启", teamMovie = true},
	["SMovie_205"] = {savepoint = "205", EndTrigger = {mod = "CompleteTask",param = 635}, remarks = "傲红莲支线1", teamMovie = true},
	["SMovie_206"] = {savepoint = "206", EndTrigger = {mod = "AcceptTask",param = 637}, remarks = "傲红莲支线2", teamMovie = true},
	["SMovie_207"] = {savepoint = "207", EndTrigger = {mod = "AcceptTask",param = 641}, remarks = "花弄影支线开启", teamMovie = true},
	["SMovie_208"] = {savepoint = "208", EndTrigger = {mod = "AcceptTask",param = 657}, remarks = "阎魔令支线开启", teamMovie = true},
	["SMovie_209"] = {savepoint = "209", EndTrigger = {mod = "AcceptTask",param = 667}, remarks = "阎魔令支线1", teamMovie = true},
	["SMovie_210"] = {savepoint = "210", EndTrigger = {mod = "AcceptTask",param = 671}, remarks = "冥河使支线开启", teamMovie = true},
	["SMovie_211"] = {savepoint = "211", EndTrigger = {mod = "None",param = {"长安城", 210, -1, -1}}, remarks = "冥河使支线1", teamMovie = true},
	["SMovie_212"] = {savepoint = "212", EndTrigger = {mod = "CompleteTask",param = 678}, remarks = "冥河使支线2", teamMovie = true},
	["SMovie_213"] = {savepoint = "213", EndTrigger = {mod = "AcceptTask",param = 685}, remarks = "神霄卫支线开启", teamMovie = true},
	["SMovie_214"] = {savepoint = "214", EndTrigger = {mod = "AcceptTask",param = 698}, remarks = "雨师君支线开启", teamMovie = true},
	["SMovie_215"] = {savepoint = "215", EndTrigger = {mod = "AcceptTask",param = 706}, remarks = "雨师君支线1", teamMovie = true},
	["SMovie_216"] = {savepoint = "216", EndTrigger = {mod = "AcceptTask",param = 716}, remarks = "海鲛灵支线开启", teamMovie = true},
	["SMovie_217"] = {savepoint = "217", EndTrigger = {mod = "AcceptTask",param = 725}, remarks = "海鲛灵支线1", teamMovie = true},
	["SMovie_218"] = {savepoint = "218", EndTrigger = {mod = "AcceptTask",param = 728}, remarks = "飞翼姬支线开启", teamMovie = true},
	["SMovie_219"] = {savepoint = "219", EndTrigger = {mod = "AcceptTask",param = 738}, remarks = "飞翼姬支线1", teamMovie = true},
	["SMovie_220"] = {savepoint = "220", EndTrigger = {mod = "AcceptTask",param = 741}, remarks = "烟云客支线开启", teamMovie = true},
	--["SMovie_220"] = {savepoint = "220", EndTrigger = {mod = "MapChange",param = {"长安城", 210, 125, 265}}, remarks = "烟云客支线开启", teamMovie = true},
	["SMovie_221"] = {savepoint = "221", EndTrigger = {mod = "AcceptTask",param = 742}, remarks = "烟云客支线1", teamMovie = true},
	["SMovie_222"] = {savepoint = "222", EndTrigger = {mod = "AcceptTask",param = 755}, remarks = "凤凰仙支线开启", teamMovie = true},
	["SMovie_818"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"90副本-傲来村", 303, 84, 64}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_819"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"90副本-傲来村", 303, 84, 64}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_820"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"90副本-傲来村", 303, 84, 64}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_821"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"90副本-傲来村", 303, 84, 64}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_822"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"90副本-傲来村", 303, 84, 64}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_823"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"90副本-傲来村", 303, 84, 64}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_824"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"90副本-傲来村", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "90副本-傲来村", teamMovie = true},
	["SMovie_825"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"100副本-玄阴池", 303, 84, 64}}, remarks = "100副本-玄阴池", teamMovie = true},
	["SMovie_826"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"100副本-玄阴池", 303, 84, 64}}, remarks = "100副本-玄阴池", teamMovie = true},
	["SMovie_827"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"100副本-玄阴池", 303, 84, 64}}, remarks = "100副本-玄阴池", teamMovie = true},
	["SMovie_828"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"100副本-玄阴池", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "100副本-玄阴池", teamMovie = true},
	["SMovie_829"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-花果山", 303, 84, 64}}, remarks = "110副本-花果山", teamMovie = true},
	["SMovie_830"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-花果山", 303, 84, 64}}, remarks = "110副本-花果山", teamMovie = true},
	["SMovie_831"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-花果山", 303, 84, 64}}, remarks = "110副本-花果山", teamMovie = true},
	["SMovie_832"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-花果山", 303, 84, 64}}, remarks = "110副本-花果山", teamMovie = true},
	["SMovie_833"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-水帘洞窟", 303, 84, 84}}, remarks = "110副本-水帘洞窟", teamMovie = true},
	["SMovie_834"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"120副本-酆都", 303, 84, 64}}, remarks = "120副本-酆都", teamMovie = true},
	["SMovie_835"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"120副本-解阳山", 303, 84, 64}}, remarks = "120副本-解阳山", teamMovie = true},
	["SMovie_836"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"120副本-解阳山", 303, 84, 64}}, remarks = "120副本-解阳山", teamMovie = true},
	["SMovie_837"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"120副本-解阳山", 303, 84, 64}}, remarks = "120副本-解阳山", teamMovie = true},
	["SMovie_838"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-水帘洞窟", 303, 84, 84}}, remarks = "110副本-水帘洞窟", teamMovie = true},
	["SMovie_839"] = {savepoint = "-1", EndTrigger = {mod = "None",param = {"110副本-水帘洞窟", 303, 84, 84}}, remarks = "110副本-水帘洞窟", teamMovie = true},
	["SMovie_840"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"110副本-水帘洞窟", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "110副本-水帘洞窟", teamMovie = true},
	["SMovie_841"] = {savepoint = "-1", EndTrigger = {mod = "FBExitPopup",param = {"120副本-解阳山", 1, 30, "副本已经结束，需要立即离开吗？"}}, remarks = "120副本-解阳山", teamMovie = true},
}


--local skill1 = {"花果山演示1","花果山演示2","花果山演示3","花果山演示4","花果山演示5"}
--local skill2 = {"龙宫演示1","龙宫演示2","龙宫演示3","龙宫演示4","龙宫演示5"}
--local skill3 = {"慈恩寺演示1","慈恩寺演示2","慈恩寺演示3","慈恩寺演示4","慈恩寺演示5"}
--local skill4 = {"流沙界演示1","流沙界演示2","流沙界演示3","流沙界演示4","流沙界演示5"}
--local skill5 = {"净坛禅院演示1","净坛禅院演示2","净坛禅院演示3","净坛禅院演示4","净坛禅院演示5"}
--local skill6 = {"酆都演示1","酆都演示2","酆都演示3","酆都演示4","酆都演示5"}
--local weapon1 = {"1级绑定白重剑","1级绑定白弓箭","1级绑定白扇子","1级绑定白笛子","1级绑定白爪刺","1级绑定白扇子","1级绑定白阔刀","1级绑定白长枪","1级绑定白双剑","1级绑定白长鞭","1级绑定白短杖","1级绑定白弓箭"}
--local weapon2 = {"谪剑仙的神器","飞翼姬的神器","烟云客的神器","冥河使的神器","阎魔令的神器","雨师君的神器","神霄卫的神器","傲红莲的神器","花弄影的神器","青丘狐的神器","海鲛灵的神器","凤凰仙的神器"}

--lualib:JumpToEx( player_guid, map_id, x, y)

function Movie_system.QuestCallMovie(player, timer_id , quest_id)
	sLuaApp:LuaDbg("玩家-"..player:GetName().."-触发了任务-"..quest_id.."-的剧情动画")
	if Assist then
		Assist.CheckEnd(player)
	end
	--lualib:SysMsg_SendTipsMsg(player, " 任务id = " .. quest_id .. "   timeid = " .. time_id)
	--if lualib:Player_GetClientType(player) ~= 0 then
	--	if lualib:Map_Id(player) == 213 then
	--		lualib:JumpToEx(player, 201, 107, 51)
	--		return
	--	end	
	--end
	if player:GetType() ~= 3 then
		return
	end
	if player:IsFightState() == true then
		return
	end
	quest_id = tonumber(quest_id)
	if Movie_system.MovieConfig["Quest_"..quest_id] then
		local movie_table = Movie_system.MovieConfig["Quest_"..quest_id]
		local teammod = 0
		local isForce = 0
		local str = ""
		if movie_table["teamMovie"] then
			if movie_table["teamMovie"] == true then
				teammod = 1
			end
		end
		if teammod == 1 then
			if player:GetTeam() ~= nil then
				if movie_table['savepoint'] ~= "-1" then
                    local team = player:GetTeam()
					for k,v in ipairs(team:GetTeamMembers(true)) do
						if v:GetInt(""..movie_table['movie_name'].."_playTimes") == 0 then
							if str == "" then
								local str2 = "SMovie_System['" .. movie_table['movie_name'] .."_Force']"
								str = [[
									if SMovie_System then
										]]..str2..[[ = true
									end
								]]
							end
						end
					end
				end
			end
		end
		if movie_table['savepoint'] ~= "-1" then
			if player:GetInt("MovieSaver_"..movie_table['savepoint']) == 1 then
				--lualib:SysMsg_SendTipsMsg(player, " 读取值" .. "MovieSaver_"..movie_table['savepoint'])
				--秘境专做
				local end_table = Movie_system.MovieList[movie_table['movie_name']]
				if end_table['EndTrigger']['mod'] == "Custom" then
					sLuaTimerSystem:AddTimerEx(player, end_table['EndTrigger']['param'][2], 1, "" ..end_table['EndTrigger']['param'][3], ""..end_table['EndTrigger']['param'][4])
				end
				
				return
			end
		end
		--lualib:SysMsg_SendTipsMsg(player, " 读取值" .. "MovieSaver_"..movie_table['savepoint'])
		if player:GetMapKeyName() ~= movie_table['map'][1] then
			local map = player:GetMapKeyName()
			sLuaApp:LuaDbg("玩家在的地图 = "..map)
			sLuaApp:LuaDbg("Movie播放地图 = "..movie_table['map'][1])
			sLuaApp:NotifyTipsMsg(player, " 地图错误，回绝请求，movieID = " .. movie_table['movie_name'])
			return
		end
		--["Quest_200"] = {movie_name = "SMovie_103", quest_state = {-1,1,-1}, map = {"傲来村", 201, 107, 51}, savepoint = "3", remarks = "开场动画", teamMovie = true},
		if movie_table['map'][3] == -1 and movie_table['map'][4] == -1 then
			local posx = sMapSystem:GetPosX(player)
			local posy = sMapSystem:GetPosY(player)
			str = str .. [[
				]].."SMovie_System_SeverData['" .. movie_table['movie_name'] .. "_player_posx'] = " .. posx ..[[
				]].."SMovie_System_SeverData['" .. movie_table['movie_name'] .. "_player_posy'] = " .. posy ..[[
			]]
		end
		local flag = 0

		if movie_table['quest_state'][1] == -1 then
			flag = flag +1
		elseif movie_table['quest_state'][1] == 0 then
			if sQuestSystem:CanAccept(player, tonumber(quest_id)) ~= 0 then--判断玩家是否可以接取任务
				flag = flag +1
			end
		elseif movie_table['quest_state'][1] == 1 then
			if sQuestSystem:CanAccept(player, tonumber(quest_id)) == 0 then
				flag = flag +1
			end
		end
		if movie_table['quest_state'][2] == -1 then
			flag = flag +1
		elseif movie_table['quest_state'][2] == 0 then
			if sQuestSystem:GetQuestState(player, tonumber(quest_id)) ~= 3 and sQuestSystem:GetQuestState(player, tonumber(quest_id)) ~= 4 then--判断玩家是否接受了任务
				flag = flag +1
			end
		elseif movie_table['quest_state'][2] == 1 then
			if sQuestSystem:GetQuestState(player, tonumber(quest_id)) == 3 or sQuestSystem:GetQuestState(player, tonumber(quest_id)) == 4 then
				flag = flag +1
			end
		end
		if movie_table['quest_state'][3] == -1 then
			flag = flag +1
		elseif movie_table['quest_state'][3] == 0 then
			if sQuestSystem:CanFinish(player, tonumber(quest_id)) ~= 0 then--玩家能否完成任务
				flag = flag +1
			end
		elseif movie_table['quest_state'][3] == 1 then
			if sQuestSystem:CanFinish(player, tonumber(quest_id)) == 0 then
				flag = flag +1
			end
		end
		if flag == 3 then
			----str = str .. [[
			----GlobalProcessing.PlayMovie("]]..movie_table['movie_name']..[[")
			----]]
			str = str .. [[
				]]..movie_table['movie_name']..[[.main()
				]]
			if teammod == 1 and player:GetTeam() ~= nil then
				if player:IsTeamLeader() then
					if movie_table['map'][3] ~= -1 then
						if sMapSystem:Jump(player, sMapSystem:GetMapById(movie_table['map'][2]), movie_table['map'][3], movie_table['map'][4] , 1) then
							player:ForbidMove(true)
						end
					end	
				end
			else
				--先将玩家置于组队暂离状态
				if player:GetTeam() ~= nil then
					if player:IsTempLeave() == false then--玩家是否暂离
						sTeamSystem:SetTempLeave(player,true)--设置玩家暂离队伍
					end
				end
				
				if movie_table['map'][3] ~= -1 then
					if sMapSystem:GetMapById(movie_table['map'][2]) then
						if sMapSystem:Jump(player, sMapSystem:GetMapById(movie_table['map'][2]), movie_table['map'][3], movie_table['map'][4] , 1) then
							player:ForbidMove(true)
						end
					end
				end
			end
			----lualib:AddNormalBuff( player, 10, player)--给玩家添加战斗外buff 10
			sLuaApp:ShowForm( player, "脚本表单", ""..str) --通知客户端开始播放剧情动画
			----if player:GetInt("PluginSystem_Status") == 1 then
			----	sLuaTimerSystem:AddTimerEx(player, 10, 1, "PluginSystem:plugin_end","active")
			----end
			player:SetInt("MovieEndTrriger", 0)
			player:SetString("Movie_Playing", movie_table['movie_name'])

			local end_table = Movie_system.MovieList[movie_table['movie_name']]
			if end_table then
				if end_table['EndTrigger']['mod'] == "CompleteTask" then
					if teammod == 1 and player:GetTeam() ~= nil then
						if player:IsTempLeave() == false then
							if player:IsTeamLeader() == true then
                                local team = player:GetTeam()
								for k,v in ipairs(team:GetTeamMembers(true)) do
									if v:IsTempLeave() == false then
										if sQuestSystem:GetQuestState(v, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(v, end_table['EndTrigger']['param']) == 4 then
											sQuestSystem:ForceFinish(v, end_table['EndTrigger']['param'])
										end
									end
								end
							else
								if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then
									sQuestSystem:ForceFinish(player, end_table['EndTrigger']['param'])
								end
							end
						else
							if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then
								sQuestSystem:ForceFinish(player, end_table['EndTrigger']['param'])
							end
						end
					elseif end_table['EndTrigger']['param'] then
						if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then
							sQuestSystem:ForceFinish(player, end_table['EndTrigger']['param'])
						end
					end				
				elseif end_table['EndTrigger']['mod'] == "AcceptTask" then
					if teammod == 1 and player:GetTeam() ~= nil then
						if player:IsTeamLeader() == true and end_table['savepoint'] == -1 then
							local team = player:GetTeam()
							for k,v in ipairs(team:GetTeamMembers(true)) do
								if sQuestSystem:CanAccept(v, end_table['EndTrigger']['param']) == 0 then
									sQuestSystem:Accept(v, end_table['EndTrigger']['param'])
								end
							end
						elseif player:IsTempLeave() == false or end_table['savepoint'] ~= -1 then
							if sQuestSystem:CanAccept(player, end_table['EndTrigger']['param']) == 0 then
								sQuestSystem:Accept(player, end_table['EndTrigger']['param'])
							end
						end
					elseif end_table['EndTrigger']['param'] then
						if sQuestSystem:CanAccept(player, end_table['EndTrigger']['param']) == 0 then
							sQuestSystem:Accept(player, end_table['EndTrigger']['param'])
						end
					end
				end
			end
		end
	end
end

-- function Movie_system.on_fight_result(player, index, result)
-- 	if player:GetInt("Shenqi_Get") == 1 then
-- 		if index == 363 then
-- 			player:SetString("GuideID1","13")
-- 			local skillnum = 1
-- 			local model = player:GetId()
-- 			while(skillnum <6)--移除特殊技能
-- 				do
-- 					if player:GetAttr(ROLE_ATTR_RACE) == 1 then
--                         local skillContainer = player:GetSkillContainer()
--                         local skill = skillContainer:GetSkill(skill2[skillnum])
--                         skillContainer:DestroySkill(skill , false)
-- 					end
-- 					if player:GetAttr(ROLE_ATTR_RACE) == 2 then
--                         local skillContainer = player:GetSkillContainer()
--                         local skill = skillContainer:GetSkill(skill2[skillnum])
--                         skillContainer:DestroySkill(skill , false)
-- 					end
-- 					if player:GetAttr(ROLE_ATTR_RACE) == 3 then
--                         local skillContainer = player:GetSkillContainer()
--                         local skill = skillContainer:GetSkill(skill2[skillnum])
--                         skillContainer:DestroySkill(skill , false)
-- 					end
-- 					if player:GetAttr(ROLE_ATTR_RACE) == 4 then
--                         local skillContainer = player:GetSkillContainer()
--                         local skill = skillContainer:GetSkill(skill2[skillnum])
--                         skillContainer:DestroySkill(skill , false)
-- 					end
-- 					if player:GetAttr(ROLE_ATTR_RACE) == 5 then
--                         local skillContainer = player:GetSkillContainer()
--                         local skill = skillContainer:GetSkill(skill2[skillnum])
--                         skillContainer:DestroySkill(skill , false)
-- 					end
-- 					if player:GetAttr(ROLE_ATTR_RACE) == 6 then
--                         local skillContainer = player:GetSkillContainer()
--                         local skill = skillContainer:GetSkill(skill2[skillnum])
--                         skillContainer:DestroySkill(skill , false)
-- 					end
-- 				skillnum=skillnum + 1
-- 			end
--             local itemContainer = player:GetItemContainer(5)
--             --移除当前神器武器
--             local weapon = itemContainer:GetItemBySite(0)
--             sItemSystem:TakeOffEquip(player,weapon)
--             sItemSystem:DestroyItem(weapon,"剧情","剧情结束","删除神器武器")
-- 			--lualib:Player_RemoveEquip(player, weapon2[model])
--             local equip3 = itemContainer:GetItemBySite(3)
--             sItemSystem:TakeOffEquip(player,weapon)
--             sItemSystem:DestroyItem(equip3,"剧情","剧情结束","删除神器腰带")
-- 			--lualib:Player_RemoveEquip(player, "神器护腰")

-- 			sItemSystem:CreateEquip(player , sItemSystem:GetItemIdByKeyname("1级绑定白护腰") , true)
-- 			sItemSystem:CreateEquip(player , sItemSystem:GetItemIdByKeyname(weapon1[model]) , true)

-- 			local itemList = sItemSystem:AddItemEx(player , sItemSystem:GetItemIdByKeyname("血池4") , 1 , true , "剧情","剧情结束","玩家回复血量")
-- 			sItemSystem:UseItem(player,itemList[1])--回满血

-- 			sLuaApp:NotifyTipsMsg(player, "被共工暗算的你服用了千年石乳，呼吸渐渐平稳下来！")
-- 			local str = [[GlobalProcessing.PlayMovie("SMovie_102")]]
		
-- 			sLuaApp:ShowForm( player, "脚本表单", ""..str)
-- 			player:SetString("Movie_Playing", "SMovie_102")
-- 			player:SetInt("Shenqi_Get", 0)
-- 		end
-- 	end
-- end

-- function Movie_system.Shenqi_Baohu(player)
-- 	Movie_system.on_fight_result(player, 363, true)
-- end

function Movie_system.MovieEnd(player,moviename)
	sLuaApp:LuaDbg("玩家-"..player:GetName().."-触发了剧情-"..moviename.."-的结束回调")
	player:ForbidMove(false)
	if not Movie_system.MovieList[moviename] then
		return
	end
	if moviename ~= player:GetString("Movie_Playing") then
		player:SetString("Movie_Playing", "")
		return
	end
	local end_table = Movie_system.MovieList[moviename]
	player:SetInt(""..moviename.."_playTimes",player:GetInt(""..moviename.."_playTimes") + 1)
	if end_table['savepoint'] then
		if end_table['savepoint'] ~= "-1" then
			player:SetInt("MovieSaver_"..end_table['savepoint'],1)
		end
	end
	local teammod = 0
	local forceTrriger = 0
	if end_table["teamMovie"] then
		if end_table["teamMovie"] == true then
			teammod = 1
		end
	end

	local playerList = {}
	if player:GetTeam() ~= nil then
		if teammod == 1 and player:IsTeamLeader() == false then
			if player:IsTempLeave() == false then
				return
			end
		elseif teammod == 1 and player:IsTeamLeader() == true then
            local team = player:GetTeam()
			playerList = team:GetTeamMembers(true)
			local str = [[
				if SMovie_System then
					SMovie_System.MovieOver("]]..moviename..[[")
				end
			]]
			for k,v in ipairs(playerList) do
				if v:GetString("Movie_Playing") ~= "" then
					--lualib:ShowFormWithContent( v, "脚本表单", ""..str)
				end
			end
		end
	else
		teammod = 0
	end
	if end_table['EndTrigger'] then
		if end_table['EndTrigger']['mod'] == "MapChange" then
			if teammod ~= 1 then
				if sMapSystem:Jump(player, sMapSystem:GetMapById(end_table['EndTrigger']['param'][2]) , end_table['EndTrigger']['param'][3], end_table['EndTrigger']['param'][4] , 1) then
					player:ForbidMove(true)
				end
			elseif player:IsTeamLeader() or player:IsTempLeave() then
				if sMapSystem:Jump(player, sMapSystem:GetMapById(end_table['EndTrigger']['param'][2]) , end_table['EndTrigger']['param'][3], end_table['EndTrigger']['param'][4] , 1) then
					player:ForbidMove(true)
				end
			end			
			--if not lualib:JumpToEx(player, end_table['EndTrigger']['param'][2], end_table['EndTrigger']['param'][3], end_table['EndTrigger']['param'][4]) then
			--	lualib:SysMsg_SendTipsMsg(player, "动画【"..moviename.."】的服务端配置出错")
			--	return
			--end
		elseif end_table['EndTrigger']['mod'] == "Fight" then
			-- if end_table['EndTrigger']['param'] == 363 then
			-- 	local skillnum = 1
			-- 	local model = player:GetId()

            --     local itemContainer = player:GetItemContainer(5)
            --     local weapon = itemContainer:GetItemBySite(0)
            --     sItemSystem:TakeOffEquip(player,weapon)
            --     sItemSystem:DestroyItem(weapon,"剧情","剧情结束","删除神器武器")
            --     local equip3 = itemContainer:GetItemBySite(3)
            --     sItemSystem:TakeOffEquip(player,weapon)
            --     sItemSystem:DestroyItem(equip3,"剧情","剧情结束","删除神器腰带")

			-- 	--lualib:Player_RemoveEquip(player, weapon2[model])
			-- 	--lualib:Player_RemoveEquip(player, "神器护腰")
			-- 	--lualib:Player_RemoveEquip(player, "1级绑定白护腰")
            --     local skillContainer = player:GetSkillContainer()
			-- 	while(skillnum <6)--根据职业替换技能
			-- 		do
			-- 			if player:GetAttr(ROLE_ATTR_RACE) == 1 then
            --                 skillContainer:CreateSkill(skill1[skillnum] , skill1[skillnum+1] , skill1[skillnum+1] , false)
			-- 			end
			-- 			if player:GetAttr(ROLE_ATTR_RACE) == 2 then
            --                 skillContainer:CreateSkill(skill1[skillnum] , skill1[skillnum+1] , skill1[skillnum+1] , false)
			-- 			end
			-- 			if player:GetAttr(ROLE_ATTR_RACE) == 3 then
            --                 skillContainer:CreateSkill(skill1[skillnum] , skill1[skillnum+1] , skill1[skillnum+1] , false)
			-- 			end
			-- 			if player:GetAttr(ROLE_ATTR_RACE) == 4 then
            --                 skillContainer:CreateSkill(skill1[skillnum] , skill1[skillnum+1] , skill1[skillnum+1] , false)
			-- 			end
			-- 			if player:GetAttr(ROLE_ATTR_RACE) == 5 then
            --                 skillContainer:CreateSkill(skill1[skillnum] , skill1[skillnum+1] , skill1[skillnum+1] , false)
			-- 			end
			-- 			if player:GetAttr(ROLE_ATTR_RACE) == 6 then
            --                 skillContainer:CreateSkill(skill1[skillnum] , skill1[skillnum+1] , skill1[skillnum+1] , false)
			-- 			end
			-- 			skillnum=skillnum + 1
			-- 		end
            --     local weapon1 = itemContainer:GetItemBySite(0)
            --     sItemSystem:TakeOffEquip(player,weapon1)
            --     sItemSystem:DestroyItem(weapon1,"剧情","剧情结束","删除神器武器")
			-- 	--lualib:Player_RemoveEquip(player, weapon1[model])--移除自身白武器

            --     sItemSystem:CreateEquip(player , sItemSystem:GetItemIdByKeyname("神器护腰") , true)
            --     sItemSystem:CreateEquip(player , sItemSystem:GetItemIdByKeyname(weapon2[model]) , true)
			-- 	--lualib:Player_AddEquip(player, "神器护腰")--替换血量装备
			-- 	--lualib:Player_AddEquip(player, weapon2[model])--替换神器
			-- 	player:SetInt("Shenqi_Get", 1)

			-- end
			-- if sQuestSystem:GetQuestState(player, 363) ~= 3 and sQuestSystem:GetQuestState(player, 363) ~= 4 then
			-- 	sQuestSystem:Accept(player, 363)
			-- end
			-- lualib:TriggerQuestFight(player, "", 363, "on_fight_result")
		elseif end_table['EndTrigger']['mod'] == "SetStr" then
			if player:GetTeam() == nil then
				player:SetString(end_table['EndTrigger']['param'][1],end_table['EndTrigger']['param'][2])
			end
		elseif end_table['EndTrigger']['mod'] == "ReadyTask" then	--将任务设置为完成可交付状态 end_table['savepoint']
			if teammod == 1 and player:GetTeam() ~= nil then
				if player:IsTeamLeader() == true and end_table['savepoint'] == -1 then
					if playerList then
						for k,v in ipairs(playerList) do
							if sQuestSystem:GetQuestState(v, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(v, end_table['EndTrigger']['param']) == 4 then
								sQuestSystem:ForceReady(v, end_table['EndTrigger']['param'])
							end
						end
					end
				elseif player:IsTempLeave() or end_table['savepoint'] ~= -1 then
					if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then
						sQuestSystem:ForceReady(player, end_table['EndTrigger']['param'])
					end
				end
			elseif end_table['EndTrigger']['param'] then
				if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then 
					sQuestSystem:ForceReady(player, end_table['EndTrigger']['param'])
				end
			end
		elseif end_table['EndTrigger']['mod'] == "CompleteTask" then
			if teammod == 1 and player:GetTeam() ~= nil then
				if player:IsTeamLeader() == true and end_table['savepoint'] == -1 then
					if playerList then
						for k,v in ipairs(playerList) do
							if sQuestSystem:GetQuestState(v, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(v, end_table['EndTrigger']['param']) == 4 then
								sQuestSystem:ForceFinish(v, end_table['EndTrigger']['param'])
							end
						end
					end
				elseif player:IsTempLeave() and end_table['savepoint'] ~= -1 then
					if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then
						sQuestSystem:ForceFinish(player, end_table['EndTrigger']['param'])
					end
				end
			elseif end_table['EndTrigger']['param'] then
				if sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 3 or sQuestSystem:GetQuestState(player, end_table['EndTrigger']['param']) == 4 then
					sQuestSystem:ForceFinish(player, end_table['EndTrigger']['param'])
				end
			end
		elseif end_table['EndTrigger']['mod'] == "AcceptTask" then
			if teammod == 1 and player:GetTeam() ~= nil then
				if player:IsTeamLeader() == true and end_table['savepoint'] == -1 then
					if playerList then
						for k,v in ipairs(playerList) do
							if sQuestSystem:CanAccept(v, end_table['EndTrigger']['param']) == 0 then
								sQuestSystem:Accept(v, end_table['EndTrigger']['param'])
							end
						end
					end
				elseif player:IsTempLeave() or end_table['savepoint'] ~= -1 then
					if sQuestSystem:CanAccept(player, end_table['EndTrigger']['param']) == 0 then
						sQuestSystem:Accept(player, end_table['EndTrigger']['param'])
					end
				end
			elseif end_table['EndTrigger']['param'] then
				if sQuestSystem:CanAccept(player, end_table['EndTrigger']['param']) == 0 then
					sQuestSystem:Accept(player, end_table['EndTrigger']['param'])
				end
			end
		elseif end_table['EndTrigger']['mod'] == "Custom" then
			sLuaTimerSystem:AddTimerEx(player, end_table['EndTrigger']['param'][2], 1, "" ..end_table['EndTrigger']['param'][3], ""..end_table['EndTrigger']['param'][4])
		elseif end_table['EndTrigger']['mod'] == "FBExitPopup" then
			local map = player:GetMap()
			local Keyname = map:GetKeyName()
			if Keyname ~= end_table['EndTrigger']['param'][1] then
				--sLuaApp:NotifyTipsMsg(player, "完成后触发的地图与配置地图不符")
				return
			end
			--local ExitType = end_table['EndTrigger']['param'][2]
			--local ExitTime = end_table['EndTrigger']['param'][3]	-- 退出时间
			--local ExitWord = end_table['EndTrigger']['param'][4]	-- 退出文字
			--local Exitstr = [[
			--					if not ConfirmBox then
			--						GUI.OpenWnd("ConfirmBox")
			--					end
			--					ConfirmBox.SetMode(]]..ExitType..[[, "]]..ExitWord..[[" )
			--				]]
			--local Timestr = ""
			--if ExitTime > 0 then
			--	Timestr = Timestr .. [[
			--		if TrackWnd then
			--			TrackWnd.TimeStart( ]]..ExitTime..[[)
			--		end
			--	]]
			--end
			--if teammod == 1 and player:GetTeam() ~= nil then
			--	if player:IsTeamLeader() == true then
			--		sLuaApp:ShowForm( player, "脚本表单", ""..Exitstr)
			--		if ExitTime > 0 then
			--			sLuaTimerSystem:AddTimer(ExitTime*1000,1,"Movie_system.Dungeon_Finish",""..map:GetGUID())
			--			for k,v in ipairs(playerList) do
			--				sLuaApp:ShowForm( v, "脚本表单", ""..Timestr)
			--			end
			--		end
			--	elseif forceTrriger == 1 then
			--		if player:GetInt("MovieEndTrriger") ~= 1 then
			--			sLuaApp:ShowForm( player, "脚本表单", ""..Exitstr)
			--			player:SetInt("MovieEndTrriger", 1)
			--			if ExitTime > 0 then
			--				sLuaTimerSystem:AddTimer(ExitTime*1000,1,"Movie_system.Dungeon_Finish",""..map:GetGUID())
			--			end
			--		end					
			--	end
			--else
			--	if player:GetInt("MovieEndTrriger") ~= 1 then
			--		sLuaApp:ShowForm( player, "脚本表单", ""..Exitstr)
			--		player:SetInt("MovieEndTrriger", 1)
			--		if ExitTime > 0 then
			--			sLuaTimerSystem:AddTimer(ExitTime*1000,1,"Movie_system.Dungeon_Finish",""..map:GetGUID())
			--		end
			--	end
			--end
			local ExitTime = end_table['EndTrigger']['param'][3]	-- 退出时间
			if Dungeon then
				Dungeon.GetExitTime(player,ExitTime)
			end
			local Exitstr = [[GlobalUtils.ShowServerBoxMessage("副本已经结束，需要立即离开吗？",]]..ExitTime..[[)]]
			local Timestr = ""
			if ExitTime > 0 then
				Timestr = Timestr .. [[
					if TrackWnd then
						TrackWnd.TimeStart( ]]..ExitTime..[[)
					end
				]]
			end
			if teammod == 1 and player:GetTeam() ~= nil then
				if player:IsTeamLeader() == true then
					sLuaApp:ShowForm(player, "脚本表单", ""..Exitstr)
					player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
					player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
					if ExitTime > 0 then
						for k,v in ipairs(playerList) do
							sLuaApp:ShowForm( v, "脚本表单", ""..Timestr)
						end
					end
				elseif forceTrriger == 1 then
					if player:GetInt("MovieEndTrriger") ~= 1 then
						sLuaApp:ShowForm(player, "脚本表单", ""..Exitstr)
						player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
						player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
						player:SetInt("MovieEndTrriger", 1)
					end					
				end
			else
				if player:GetInt("MovieEndTrriger") ~= 1 then
					sLuaApp:ShowForm(player, "脚本表单", ""..Exitstr)
					player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
					player:SetString("SYSTEM_ConfirmBox_Function", "Dungeon.ConfirmQuitContinue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
					player:SetInt("MovieEndTrriger", 1)
				end
			end	
		end
	end
	player:SetString("Movie_Playing", "")
end

function Movie_system.LeaderMovieSkip(player, time_id, moviename)
	if not Movie_system.MovieList[moviename] then
		return
	end
	if moviename ~= player:GetString("Movie_Playing") then
		sLuaApp:LuaErr(player:GetName().." 客户端动画数据错误  " .. "moviename = "..player:GetString("Movie_Playing") .. "      Clientname = " .. moviename )
		return
	end
	if not Movie_system.MovieList[moviename]['teamMovie'] then
		return
	end
	if Movie_system.MovieList[moviename]['teamMovie'] == false then
		return
	end
	if player:GetTeam() ~= nil then
		if player:IsTeamLeader() then
			if Movie_system.MovieList[moviename]['teamMovie'] == true then
                local team = player:GetTeam()
                local playerList = team:GetTeamMembers(true)
				local str = [[
							if SMovie_System then
								SMovie_System.MovieOver("]]..moviename..[[")
							end
						]]
				for k,v in ipairs(playerList) do
					if v ~= player and v:GetString("Movie_Playing") == moviename then
						sLuaApp:ShowForm( v, "脚本表单", ""..str)
					end
				end
			end
		end
	end
end

function Movie_system.QuestRepair(player)
	if player:GetString("Movie_Playing") ~= "" then
		Movie_system.MovieEnd(player,player:GetString("Movie_Playing"))
	end
	for k, v in pairs(Movie_system.MovieConfig) do
		local movieid = tonumber(v.savepoint)
		if movieid >= 201 and movieid <= 222 then
			local questid = tonumber(string.sub(k,-3,-1))
			if not questid then
				return
			end
			if player:GetInt("MovieSaver_"..movieid) == 1 and sQuestSystem:CanAccept(player, questid) == 0 then
				sQuestSystem:ForceAccept(player, questid)
			end
		end
	end
	if player:GetInt("MovieSaver_888") == 1 and sQuestSystem:CanAccept(player, 520) == 0 then
		sQuestSystem:Accept(player, 520)
	end
end




