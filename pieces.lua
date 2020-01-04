local other = require("other")

local pieces = {}

function pieces.knights_draw(x, y)
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.circle("fill", x, y, gridsize/2 - 10)
end

function pieces.knight_possible_spot(mousex, mousey, x, y)
    if mousex == x + 1 and mousey == y + 2 then
        return true
    elseif mousex == x - 1 and mousey == y + 2 then
        return true
    elseif mousex == x + 1 and mousey == y - 2 then
        return true
    elseif mousex == x - 1 and mousey == y - 2 then
        return true
    else
        return false
    end
end

function pieces.knight_move()
    knight.x = other.mouse_gridx(love.mouse.getX())*gridsize + gridsize/2
    knight.y = other.mouse_gridy(love.mouse.getY())*gridsize + gridsize/2
    knight.xspot = other.mouse_gridx(love.mouse.getX())
    knight.yspot = other.mouse_gridy(love.mouse.getY())
    knight.grabbed = false
end

return pieces