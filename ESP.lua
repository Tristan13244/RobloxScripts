local Players = game:GetService("Players")

local function RefreshHighlights()
  for _, Player in pairs(Players:GetPlayers()) do
    if Player ~= Players.LocalPlayer then -- Ignore yourself
      local Character = Player.Character
      if Character then
        local Highlight = Character:FindFirstChildWhichIsA("Highlight")
        if Highlight then
          Highlight:Destroy() -- Remove old highlight if it exists
        end
        local NewHighlight = Instance.new("Highlight")
        NewHighlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
        NewHighlight.Parent = Character
      end
    end
  end
end

-- Call the function initially to create highlights
RefreshHighlights()

-- Optionally, call the function repeatedly to keep highlights updated
-- (This is recommended as players join/leave)
task.wait(1) -- Wait for 1 second
RefreshHighlights() -- Call again
