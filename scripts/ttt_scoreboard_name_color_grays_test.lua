function DoHash(ply)
    local name = ply:GetName()
    local sum = 0
    for i = 1, #name do
        sum = sum + string.byte(name[i])
    end

    return sum % 8
end
    
function TTTHashColorForPlayer(ply)
    local color_table = {}

    color_table[0] = Color(255, 255, 255, 255)
    color_table[1] = Color(223, 223, 223, 255)
    color_table[2] = Color(191, 191, 191, 255)
    color_table[3] = Color(159, 159, 159, 255)
    color_table[4] = Color(127, 127, 127, 255)
    color_table[5] = Color(95, 95, 95, 255)
    color_table[6] = Color(63, 63, 63, 255)
    color_table[7] = Color(31, 31, 31, 255)

    return color_table[DoHash(ply)]
end

hook.Add("TTTScoreboardColorForPlayer", "TTTHashColorForPlayer", TTTHashColorForPlayer)
