local pieces = require("pieces")
local other = require("other")

x, y = 1, 1

gridsize = 50
board = {}

for i = 1, 9 do
    board[i] = {}
    for j = 1, 9 do
        board[i][j] = {i*gridsize, j*gridsize, false}
    end
end

function create_pieces()
    knight = {}

    knight.xspot = 2
    knight.yspot = 8
    knight.x = board[2][8][1] + gridsize/2
    knight.y = board[2][8][2] + gridsize/2
    knight.grabbed = false
end

create_pieces()

function love.update()
    x = love.mouse.getX()
    y = love.mouse.getY()

    if knight.grabbed then
        knight.x = love.mouse.getX()
        knight.y = love.mouse.getY()
    end

    function love.mousepressed(xcoord, ycooord)

        if not knight.grabbed then
            if xcoord >= knight.x - gridsize/2 and xcoord <= knight.x + gridsize/2 then
                knight.grabbed = true
            end
        elseif knight.grabbed then
            if pieces.knight_possible_spot(other.mouse_gridx(love.mouse.getX()), other.mouse_gridy(love.mouse.getY()), knight.xspot, knight.yspot) then
                pieces.knight_move()
            elseif pieces.knight_possible_spot(other.mouse_gridy(love.mouse.getY()), other.mouse_gridx(love.mouse.getX()), knight.yspot, knight.xspot) then
                pieces.knight_move()
            end
        end

    end
end

function love.draw()
    for i = 1, 9 do
        love.graphics.line(board[i][1][1], board[i][1][2], board[i][1][1], board[i][9][2])
        love.graphics.line(board[1][i][1], board[1][i][2], board[9][i][1], board[9][i][2])
    end

    for i = 1, 8 do
        for j = 1, 8 do
            if (i%2 == 0) and (j%2 == 0) or (i%2 == 1) and (j%2 == 1) then
                love.graphics.setColor(1, 1, 1)
            else
                love.graphics.setColor(0, 0, 0)
            end
            love.graphics.rectangle("fill", board[i][j][1], board[i][j][2], gridsize, gridsize)
        end
    end

    other.highlight(other.mouse_gridx(x), other.mouse_gridy(y))

    pieces.knights_draw(knight.x, knight.y)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print(tostring(other.mouse_gridx(x)), 500, 100)
    love.graphics.print(tostring(other.mouse_gridy(y)), 550, 100)
end