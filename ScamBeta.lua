local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

function FindTradeRemotes()
    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") and tostring(v.Name):lower():find("trade") then
            print(v.Name)
        end
    end
end

function FreezeTarget(target)
    if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        target.Character.HumanoidRootPart.Anchored = true
    end
    if target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
        target.Character.Humanoid.WalkSpeed = 0
        target.Character.Humanoid.JumpPower = 0
    end
    if target:FindFirstChild("PlayerGui") and target.PlayerGui:FindFirstChild("TradeGUI") then
        local gui = target.PlayerGui.TradeGUI
        if gui:FindFirstChild("ExitButton") then
            gui.ExitButton.Visible = false
        end
        for _, btn in pairs(gui:GetChildren()) do
            if btn.Name:lower():find("additem") then
                btn.Visible = false
            end
        end
    end
end

function AutoTrade(target)
    local tradeReady = ReplicatedStorage.Remotes:FindFirstChild("Trade_Ready") or ReplicatedStorage.Remotes:FindFirstChild("ReadyTrade")
    local tradeAccept = ReplicatedStorage.Remotes:FindFirstChild("Trade_Accept") or ReplicatedStorage.Remotes:FindFirstChild("AcceptTrade")
    if tradeReady and tradeAccept then
        tradeReady:FireServer(target)
        wait(0.5)
        tradeAccept:FireServer(target)
    end
    FreezeTarget(target)
end
