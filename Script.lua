-- Criar FPS Counter sem GUI externa

-- Verifica se já existe e remove
if game.CoreGui:FindFirstChild("FPSCounter") then
    game.CoreGui.FPSCounter:Destroy()
end

-- Criar o texto
local fpsGui = Instance.new("ScreenGui")
fpsGui.Name = "FPSCounter"
fpsGui.ResetOnSpawn = false
fpsGui.Parent = game.CoreGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 200, 0, 40)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
fpsLabel.TextStrokeTransparency = 0
fpsLabel.TextScaled = true
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.Text = "FPS: Calculando..."
fpsLabel.Parent = fpsGui

-- Lógica pra calcular FPS
local lastTick = tick()
local fps = 0

game:GetService("RunService").RenderStepped:Connect(function()
    local now = tick()
    fps = math.floor(1 / (now - lastTick))
    lastTick = now
    fpsLabel.Text = "FPS: " .. tostring(fps)
end)
