GAME_VERSION = "DEV 1.0.0"

require "player.player_main"

function love.load()
wf = require "libraries/windfield"
world = wf.newWorld(0,0)
camera = require("libraries.cam")
cam = camera()

sti = require("libraries/sti")
gameMap = sti("maps/testTown.lua")
playerLoad()
-- After loading player add vars to the player table

player.collider = world:newCircleCollider(300,400,20)
player.collider:setFixedRotation(true)

walls = {}
if gameMap.layers["Walls"] then
  for i,v in pairs(gameMap.layers["Walls"].objects) do
    local wall = world:newRectangleCollider(v.x,v.y,v.width,v.height)
    wall:setType("static")
 -- table.insert(walls,wall)
  end
end


end

function love.draw()
cam:attach()
  gameMap:drawLayer(gameMap.layers["Ground"])
  gameMap:drawLayer(gameMap.layers["Trees"])
  playerDraw()
  --world:draw()
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

world:update(dt)
player.x = player.collider:getX()
player.y = player.collider:getY() - player.spriteSheet:getHeight()/3
end
