local other = {}

function other.mouse_gridx(x)
    local xspot = x/gridsize
    return math.floor(xspot)
end

function other.mouse_gridy(y)
    local yspot = y/gridsize
    return math.floor(yspot)
end

function other.highlight(x, y)
    love.graphics.setColor(0.2, 0.2, 0.8)
    if x >= 1 and x <= 8 and y >= 1 and y <= 8 then
        love.graphics.line(board[x][y][1], board[x][y][2], board[x + 1][y][1], board[x + 1][y][2])
        love.graphics.line(board[x][y][1], board[x][y][2], board[x][y + 1][1], board[x][y + 1][2])
        love.graphics.line(board[x][y + 1][1], board[x][y + 1][2], board[x + 1][y + 1][1], board[x + 1][y + 1][2])
        love.graphics.line(board[x + 1][y][1], board[x + 1][y][2], board[x + 1][y + 1][1], board[x + 1][y + 1][2])
    end
end

return other