require "player.player_main"

function love.load()
camera = require("libraries.cam")
cam = camera()

sti = require("libraries/sti")
gameMap = sti("maps/testTown.lua")
playerLoad()

end

function love.draw()
cam:attach()
  gameMap:drawLayer(gameMap.layers["Ground"])
  gameMap:drawLayer(gameMap.layers["Trees"])
  playerDraw()
cam:detach()
end

function love.update(dt)
playerUpdate(dt)
cam:lookAt(player.x,player.y)

local w = love.graphics.getWidth()
local h = love.graphics.getHeight()

  if cam.x < w/2 then
    cam.x = w/2
  end
  if cam.y < h/2 then
    cam.y = h/2
  end

  local mapW = gameMap.width * gameMap.tilewidth
  local mapH = gameMap.height * gameMap.tileheight

  if cam.x > (mapW - w/2) then
    cam.x = (mapW - w/2)
  end

  if cam.y > (mapH - h/2) then
    cam.y = (mapH - h/2)
  end

end
