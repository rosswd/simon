-- Simon Game

-- Setup
function love.load()
    x1 = 200
    x2 = 400
    y1 = 150
    y2 = 350
    w = 160
    h = 160
    love.graphics.setBackgroundColor(0, 0, 0)
    love.window.setTitle('Simon the Game')

    intro = 'Simon will play a random sequence and then ask you to repeat it.' .. 
    ' As the game progresses, the sequence will get more difficult. Good Luck!'
    love.window.showMessageBox('Welcome', intro)

    redSound = love.audio.newSource('sounds/01.wav', 'static')
    greenSound = love.audio.newSource('sounds/02.wav', 'static')
    blueSound = love.audio.newSource('sounds/03.wav', 'static')
    yellowSound = love.audio.newSource('sounds/04.wav', 'static')
end

-- Update
function love.update(dt)
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
    love.graphics.setColor(204, 0, 0)
    love.graphics.rectangle("fill", x1, y1, w, h)

    love.graphics.setColor(0, 204, 0)
    love.graphics.rectangle("fill", x2, y1, w, h)

    love.graphics.setColor(0, 0, 204)
    love.graphics.rectangle("fill", x1, y2, w, h)

    love.graphics.setColor(204, 204, 0)
    love.graphics.rectangle("fill", x2, y2, w, h)
end

function randomSequence(max)
    sequence = {}
    for i=1,max do
        --print('random: ' .. math.random(i))
        sequence = table.insert(sequence[i], math.random(i))
    end
    return sequence
end

function playSequence()
    randomSequence()
    -- set each number to corresponding square
    -- change background and play sound for each square
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