-- Simon Game

debug=true

-- Setup
function love.load()
    -- dimensions to draw rectangles
    x1, x2 = 200, 400
    y1, y2 = 150, 350
    w, h = 160, 160

    -- tables to hold rectangles
    red, green, blue, yellow = {}, {}, {}, {}

    -- sounds for each rectangle
    redSound = love.audio.newSource('sounds/01.wav', 'static')
    greenSound = love.audio.newSource('sounds/02.wav', 'static')
    blueSound = love.audio.newSource('sounds/03.wav', 'static')
    yellowSound = love.audio.newSource('sounds/04.wav', 'static')

    -- instructions
    intro = 'Simon will play a random sequence and then ask you to repeat it.' .. 
    ' As the game progresses, the sequence will get more difficult. Good Luck!'
    love.window.showMessageBox('Welcome to Simon', intro)
end

-- Update
function love.update(dt)
    -- Exit game
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('up') then
        love.graphics.setBackgroundColor(255, 255, 255)
    else
        love.graphics.setBackgroundColor(0, 0, 0)
    end

    if love.keyboard.isDown('r') then
        redSound:play()
    elseif love.keyboard.isDown('g') then
        greenSound:play()
    elseif love.keyboard.isDown('b') then
        blueSound:play()
    elseif love.keyboard.isDown('y') then
        yellowSound:play()
    end
end

-- Render
function love.draw()
    red.color = love.graphics.setColor(204, 0, 0)
    red.shape = love.graphics.rectangle("fill", x1, y1, w, h)

    green.color = love.graphics.setColor(0, 204, 0)
    green.shape = love.graphics.rectangle("fill", x2, y1, w, h)

    blue.color = love.graphics.setColor(0, 0, 204)
    blue.shape = love.graphics.rectangle("fill", x1, y2, w, h)

    yellow.color = love.graphics.setColor(204, 204, 0)
    yellow.shape = love.graphics.rectangle("fill", x2, y2, w, h)
end

function randomSequence(max)
    sequence = {}
    for i=1,max do
        table.insert(sequence, love.math.random(i))
    end
    return sequence
end

function playSequence()
    randomSequence(4)
    -- set each number to corresponding square
    -- change background and play sound for each square
    for key, value in ipairs(sequence)
        do
            if value == 1 then
                red.color = love.graphics.setColor(250, 100, 100)
                redSound:play()
            elseif value == 2 then
                green.color = love.graphics.setColor(100, 250, 100)
                greenSound:play()
            elseif value == 3 then
                blue.color = love.graphics.setColor(100, 100, 250)
                blueSound:play()
            elseif value == 4 then
                yellow.color = love.graphics.setColor(250, 250, 0)
                yellowSound:play()
            end
    end
end

function checkSequence()
    playerSequence = {}
    -- after sequence plays, put keys pressed into playerSequence
      -- pressing [enter] terminates the sequence
    -- compare playerSequence and randomSequence
    -- if match for input and position return true
      -- else return false
end

function updateScore()
    if checkSequence then
        score = score + 1
        love.graphics.print("Score: " .. score, 400, 200)
    end
end

function gameOver()
    love.graphics.print("GAME OVER! Your score was: " .. score, 400, 200)
end

function resetGame()
end

function startGame()
    repeat
        randomSequence()
        playSequence()
        checkSequence()
        updateScore()
    until checkSequence == false
        gameOver()
end
