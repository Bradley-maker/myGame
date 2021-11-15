require "player.player_main"
require "libraries.gamestate"

-- init table
savegame = {}

-- Create function to generate a random number and convert to string

function saveGameFileGen()
math.randomseed(os.time())
ranNum1 = math.math.random(0, 9)
ranNum2 = math.math.random(0, 9)
ranNum3 = math.math.random(0, 9)
ranNum4 = math.math.random(0, 9)
allNumNS = ranNum1..ranNum2..ranNum3..ranNum4
allNum = tostring(allNumNS)
file = player.name..allNum

end


-- Core functions
function saveGame()


end

function loadGame()


end

function deleteGame()


end
