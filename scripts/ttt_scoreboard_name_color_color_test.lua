function DoHash(ply)
    local name = ply:GetName()
    local sum = 0
    for i = 1, #name do
        sum = sum + string.byte(name[i])
    end

    return sum % 7
end
    
function TTTHashColorForPlayer(ply)
    local color_table = {}

    color_table[0] = Color(148, 0, 211, 255)
    color_table[1] = Color(75, 255, 130, 255)
    color_table[2] = Color(0, 0, 255, 255)
    color_table[3] = Color(0, 255, 0, 255)
    color_table[4] = Color(255, 255, 0, 255)
    color_table[5] = Color(255, 127, 0, 255)
    color_table[6] = Color(255, 0, 0, 255)

    return color_table[DoHash(ply)]
end

hook.Add("TTTScoreboardColorForPlayer", "TTTHashColorForPlayer", TTTHashColorForPlayer)
