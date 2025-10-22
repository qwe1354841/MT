--世界服务器
function System.OnStart()
    --print("on start")
    local t = {4, test="测试中文", 5.5, 89, aa="imj测试一下uf8"}
    
    local s = json.encode(t)
    sLuaApp:LuaWrn(s)

    local tt = json.decode(s)
    sLuaApp:LuaWrn(tt["aa"])

    --test()

    --assert(false, "aaaaa")

    sLuaApp:LuaErr("世界服务器开启了")
    --sLuaApp:ReloadLua(false, false)

    return false
end

function test()
    local a = bb / 100
end

local cc = 100 / 100

function System.test(arg1, arg2, arg3, arg4, arg5)
    Data.test = "abcedfg"
    sLuaApp:LuaInf(arg1)
    sLuaApp:LuaInf(arg2)
    sLuaApp:LuaInf(arg3)
    sLuaApp:LuaInf(arg4)
    sLuaApp:LuaInf(arg5)
    return true
end

--sLuaApp:LuaSys(Data.test)
sLuaApp:LuaSys("执行脚本打印内存池信息:")
sLuaApp:TraceMemoryPool()
function System.OnLoad()

end