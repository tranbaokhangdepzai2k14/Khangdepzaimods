local Library = loadstring(game:HttpGet("https://minvn.site/V5UILib"))()
local win = Library:Window("KhangMods V1", "Menu Hack Blox Fruits", Color3.fromRGB(85,170,255), Enum.KeyCode.RightControl)

local farming = false
local nangtoc = false

local QuestData = {
    {Min=1,Max=9,Q="BanditQuest1",L=1,Mob="Bandit",QPos=Vector3.new(1060,16,1547),MPos=Vector3.new(1150,17,1610)},
    {Min=10,Max=14,Q="MonkeyQuest",L=1,Mob="Monkey",QPos=Vector3.new(-1602,37,153),MPos=Vector3.new(-1468,40,110)},
    {Min=15,Max=29,Q="MonkeyQuest",L=2,Mob="Gorilla",QPos=Vector3.new(-1602,37,153),MPos=Vector3.new(-1320,39,-530)},
    {Min=30,Max=39,Q="BuggyQuest1",L=1,Mob="Pirate",QPos=Vector3.new(-1140,4,3826),MPos=Vector3.new(-1211,4,3901)},
    {Min=40,Max=59,Q="BuggyQuest1",L=2,Mob="Brute",QPos=Vector3.new(-1140,4,3826),MPos=Vector3.new(-1084,14,4307)},
    {Min=60,Max=74,Q="BuggyQuest2",L=1,Mob="Desert Bandit",QPos=Vector3.new(897,6,4387),MPos=Vector3.new(932,7,4484)},
    {Min=75,Max=89,Q="BuggyQuest2",L=2,Mob="Desert Officer",QPos=Vector3.new(897,6,4387),MPos=Vector3.new(1572,10,4373)},
    {Min=90,Max=99,Q="SnowQuest",L=1,Mob="Snow Bandit",QPos=Vector3.new(1388,87,-1297),MPos=Vector3.new(1347,87,-1395)},
    {Min=100,Max=119,Q="SnowQuest",L=2,Mob="Snowman",QPos=Vector3.new(1388,87,-1297),MPos=Vector3.new(1205,138,-1446)},
    {Min=120,Max=149,Q="MarineQuest2",L=1,Mob="Chief Petty Officer",QPos=Vector3.new(-5035,29,4326),MPos=Vector3.new(-4880,23,4276)},
    {Min=150,Max=174,Q="SkyQuest",L=1,Mob="Sky Bandit",QPos=Vector3.new(-4842,718,717),MPos=Vector3.new(-4953,360,690)},
    {Min=175,Max=189,Q="SkyQuest",L=2,Mob="Dark Master",QPos=Vector3.new(-4842,718,717),MPos=Vector3.new(-5224,391,370)},
    {Min=190,Max=209,Q="PrisonerQuest",L=1,Mob="Prisoner",QPos=Vector3.new(5308,2,474),MPos=Vector3.new(5411,96,475)},
    {Min=210,Max=249,Q="PrisonerQuest",L=2,Mob="Dangerous Prisoner",QPos=Vector3.new(5308,2,474),MPos=Vector3.new(5268,96,802)},
    {Min=250,Max=299,Q="ColosseumQuest",L=1,Mob="Toga Warrior",QPos=Vector3.new(-1576,8,-2985),MPos=Vector3.new(-1772,8,-2740)},
    {Min=300,Max=324,Q="ColosseumQuest",L=2,Mob="Gladiator",QPos=Vector3.new(-1576,8,-2985),MPos=Vector3.new(-1294,7,-3336)},
    {Min=325,Max=374,Q="MagmaQuest",L=1,Mob="Military Soldier",QPos=Vector3.new(-5310,78,-6974),MPos=Vector3.new(-5411,78,-6727)},
    {Min=375,Max=399,Q="MagmaQuest",L=2,Mob="Military Spy",QPos=Vector3.new(-5310,78,-6974),MPos=Vector3.new(-5786,79,-7557)},
    {Min=400,Max=449,Q="FishmanQuest",L=1,Mob="Fishman Warrior",QPos=Vector3.new(61122,19,1566),MPos=Vector3.new(60854,19,1545)},
    {Min=450,Max=474,Q="FishmanQuest",L=2,Mob="Fishman Commando",QPos=Vector3.new(61122,19,1566),MPos=Vector3.new(61891,19,1511)},
    {Min=475,Max=524,Q="SkyExp1Quest",L=1,Mob="God's Guard",QPos=Vector3.new(-4628,872,-1667),MPos=Vector3.new(-4698,845,-1328)},
    {Min=525,Max=549,Q="SkyExp1Quest",L=2,Mob="Shanda",QPos=Vector3.new(-4628,872,-1667),MPos=Vector3.new(-7872,554,-2455)},
    {Min=550,Max=624,Q="SkyExp2Quest",L=1,Mob="Royal Squad",QPos=Vector3.new(-7894,563,-1465),MPos=Vector3.new(-7645,561,-1371)},
    {Min=625,Max=649,Q="SkyExp2Quest",L=2,Mob="Royal Soldier",QPos=Vector3.new(-7894,563,-1465),MPos=Vector3.new(-7900,697,-1109)},
    {Min=650,Max=674,Q="FountainQuest",L=1,Mob="Galley Pirate",QPos=Vector3.new(5256,39,4049),MPos=Vector3.new(5557,39,3956)},
    {Min=675,Max=700,Q="FountainQuest",L=2,Mob="Galley Captain",QPos=Vector3.new(5256,39,4049),MPos=Vector3.new(5015,39,3836)}
}
function GetQuestInfo()
    local lv = game.Players.LocalPlayer.Data.Level.Value
    for i,v in ipairs(QuestData) do
        if lv >= v.Min and lv <= v.Max then
            return {questName = v.Q,questLevel = v.L,mobName = v.Mob,questPos = v.QPos,mobPos = v.MPos}
        end
    end
    return QuestData[#QuestData]
end

function GetNearestMob(mobname)
    local nearest = nil
    local shortest = math.huge
    for _,mob in pairs(workspace.Enemies:GetChildren()) do
        if mob.Name == mobname and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).magnitude
            if dist < shortest then
                shortest = dist
                nearest = mob
            end
        end
    end
    return nearest
end

function AutoFarm()
    spawn(function()
        while farming do
            pcall(function()
                local plr = game.Players.LocalPlayer
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local q = GetQuestInfo()
                    if not plr.PlayerGui.Main.Quest.Visible then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest",q.questName,q.questLevel)
                        wait(0.5)
                    end
                    local mob = GetNearestMob(q.mobName)
                    if mob then
                        repeat
                            plr.Character.Humanoid:ChangeState(11)
                            plr.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack",true)
                            wait(0.2)
                        until not farming or mob.Humanoid.Health <= 0 or not mob.Parent
                    else
                        plr.Character.HumanoidRootPart.CFrame = q.mobPos
                        wait(0.5)
                    end
                    if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health <= 0 then
                        repeat wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
                        plr.Character.HumanoidRootPart.CFrame = q.mobPos
                    end
                end
                wait(0.2)
            end)
        end
    end)
end

win:Toggle("Tự động farm cấp",function(v)
    farming = v
    if v then AutoFarm() end
end)

function IsAngelRace()
    local race = ""
    pcall(function() race = game.Players.LocalPlayer.Data.Race.Value end)
    return race == "Angel" or race == "Thiên Thần"
end

function AngelV2() pcall(function() game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener","Buy",2) end) end
function AngelV3() pcall(function() game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener","Buy",3) end) end
function AngelV4() pcall(function() game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener","Buy",4) end) end

function TeleportServerForAngel()
    local HttpService = game:GetService("HttpService")
    local PlaceID = game.PlaceId
    local function GetServers(cursor)
        local url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=2&limit=100"
        if cursor then url = url.."&cursor="..cursor end
        local servers = HttpService:JSONDecode(game:HttpGet(url))
        return servers
    end
    local servers = GetServers()
    for _,v in pairs(servers.data) do
        if v.playing > 5 and v.id ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v.id)
            wait(7)
            break
        end
    end
end

function AutoAngelUpgrade()
    spawn(function()
        while nangtoc do
            pcall(function()
                if not IsAngelRace() then
                    TeleportServerForAngel()
                else
                    local v4 = false
                    pcall(function() v4 = game.Players.LocalPlayer.Data.AngelV4.Value end)
                    if not v4 then
                        AngelV2()
                        wait(2)
                        AngelV3()
                        wait(2)
                        AngelV4()
                    end
                end
                wait(10)
            end)
        end
    end)
end

win:Toggle("Tự động nâng tộc Thiên Thần",function(v)
    nangtoc = v
    if v then AutoAngelUpgrade() end
end)

Library:Credit("KhangMods | Farm mọi cấp - Nâng tộc Thiên Thần")
