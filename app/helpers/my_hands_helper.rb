module MyHandsHelper
    def suit_name(key)
        case key.to_s
            when 'man' then '萬子'
            when 'pin' then '筒子'
            when 'sou' then '索子'
            when 'ji' then '字牌'
        else key.to_s
        end
    end
end
