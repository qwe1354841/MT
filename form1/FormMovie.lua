--剧情动画相关表单
FormMovie = {}

function FormMovie.MovieEnd(player,moviename)
    if not player or not moviename then
        return
    end
    if Movie_system then
        Movie_system.MovieEnd(player,moviename)
    end
    return ""
end

function FormMovie.LeaderSkip(player, movie_name)
    if not player or not movie_name then
        return
    end
    if Movie_system and Movie_system.LeaderMovieSkip then
        sLuaApp:LuaDbg("----------------------------------- LeaderSkip")
        sLuaTimerSystem:AddTimerEx(player,200,1,"Movie_system.LeaderMovieSkip",movie_name)
    end
    return ""
end