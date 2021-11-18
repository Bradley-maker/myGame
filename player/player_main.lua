function playerLoad()
  love.graphics.setDefaultFilter("nearest", "nearest")
  anim8 = require("libraries.anim8")
 -- Define Player

 player = {}

 player.x = 300
 player.y = 400


 player.health = 100
 player.armor = 0
 player.spriteSheet = love.graphics.newImage("player/player-sheet.png")

 player.grid = anim8.newGrid(12,18, player.spriteSheet:getWidth(),player.spriteSheet:getHeight())


 player.name = nil

 player.speed = 300


 player.animations = {}
 player.animations.down = anim8.newAnimation(player.grid("1-4",1),0.2)
 player.animations.left = anim8.newAnimation(player.grid("1-4",2),0.2)
 player.animations.right = anim8.newAnimation(player.grid("1-4",3),0.2)
 player.animations.up = anim8.newAnimation(player.grid("1-4",4),0.2)

 player.anim = player.animations.left




end

function playerDraw()
player.anim:draw(player.spriteSheet,player.x,player.y,nil,5,nil,6,9)
end

function playerUpdate(dt)
local isMoving = false

local vx = 0
local vy = 0
  -- Movement commands
if love.keyboard.isDown("w") then
vy = player.speed * -1
player.anim = player.animations.up
isMoving = true
end

if love.keyboard.isDown("s") then
vy =  player.speed
player.anim = player.animations.down
isMoving = true
end

if love.keyboard.isDown("a") then
vx = player.speed * -1
player.anim = player.animations.left
isMoving = true
end

if love.keyboard.isDown("d") then
vx = player.speed
player.anim = player.animations.right
isMoving = true
end

player.collider:setLinearVelocity(vx,vy)

if isMoving == false then
player.anim:gotoFrame(2)
end
player.anim:update(dt)
end
