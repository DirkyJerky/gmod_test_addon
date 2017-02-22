function DoHash(ply, _)
    local name = ply:GetName()
    local sum = 0
    for i = 1, #name do
        sum = sum + string.byte(name[i])
    end

    return sum % 32
end
    

function TTTHashColumnDisplay(panel)
    ---------------  Label, DataFunc, Width, Sort_ID, Sort_func
    panel:AddColumn("Hash",  DoHash ,  100 ,  "hash", function(plya, plyb) return DoHash(plya) - DoHash(plyb) end)

    ---------------               Label,        _,     _, Sort_ID, Sort_func
    panel:AddFakeColumn("Second-Letter",  DoHash ,  100 ,  "second_letter", function(plya, plyb) return string.byte(plya:GetName()[2]) - string.byte(plyb:GetName()[2]) end)
end

hook.Add("TTTScoreboardColumns", "TTTHashColumnDisplay", TTTHashColumnDisplay)
