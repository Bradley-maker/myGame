gamestate = {}

gamestate.current = "splashScreen"
gamestate.lastState = nil


function gamestate:load()
--gamestate.current = getCurrentState()


end

function gamestate:udate(dt)
gamestate.current = getCurrentState()

end

function gamestate:setState(state)
gamestate.lastState = gamestate.current

gamestate.current = state

end

function getCurrentState()

return gamestate.current


end
