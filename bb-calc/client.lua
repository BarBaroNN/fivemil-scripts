RegisterCommand('calc', function() SetNuiFocus(true, true) SendNUIMessage() end)
RegisterNUICallback('nui', function() SetNuiFocus(false, false) end)

RegisterNUICallback('validate', function(data, res)
  -- gets string with the math problem
  -- validates the string to make sure request isnt abused
  -- solves the problem with Lua's loadstring function and returns the asnwer to the nui
  -- if the request is abused, returns nil

  local problem = data.str
  if problem:find("%a") then return res({v = nil}) end -- check if there are letters in the problem, shouldnt be because we are solving only regular problems without varibles
  local answer = load("return " .. problem)()
  return res({v = answer})
end)