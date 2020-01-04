x = 100
y = 100
function love.update()
    if x > 1000 then
        x = x + 10
        y = y + 0.1
    else
        x = 100
        y = 100
    end
end

function love.draw()
    love.graphics.setPointSize(10)
    love.graphics.points(x, math.sin(y)*100 + 100)
end