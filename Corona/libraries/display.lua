display.formatNumber = function(number)
    if number > 1000 then
        return string.format("%.2e", number)
    else
        return string.format("%d", number)
    end
end
