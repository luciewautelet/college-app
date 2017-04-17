module StudentHelper
    
def recup_lower?(best)
    @tmp = 10000
    @tmp2 = 0
    @i = 0
    best.each() do |b|
        if b.to_i < best[@tmp2].to_i
            @tmp = b
            @tmp2 = @i
        end
        @i = @i + 1
    end
    @tmp2
end

def condition_success?(best)
    if best[0] >= 40 && best[1] >=  40
        if best[2] > 34
            if (40 - best[2] * 2) >= (best[0] - 40 +  best[1] - 40)
                true
            else
                false
            end
        else
            false
        end
    elsif best[0] >= 40 && best[2] >=  40
        if best[1] > 34
            if (40 - best[1] * 2) >= (best[0] - 40 +  best[2] - 40)
                true
            else
                false
            end
        else
            false
        end
    elsif best[1] >= 40 && best[2] >=  40
        if best[0] > 34
            if (40 - best[0] * 2) >= (best[1] - 40 +  best[2] - 40)
                true
            else
                false
            end
        else
            false
        end
    else
        false
    end    
end
end
