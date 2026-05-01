local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
	Name = "Baldi",
	LoadingTitle = "xxx",
	LoadingSubtitle = "by Finalelele",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},

	ToggleUIKeybind = "k", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	Discord = {
		Enabled = false,
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local chr = game.Players.LocalPlayer.Character
local antiFall
local brightness
local espBaldi
local espPlayer
local noclip
local stamina
local espBooks = false
local complete
local function whatComplete(v)
	if v.Name == "CountingSession" then
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.CountingSession.Server.SetFinishState:FireServer({["Value"] = "Correct", ["User"] = game.Players.LocalPlayer})
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.CountingSession.Server.DeleteUi:FireServer({["Value"] = "True", ["User"] = game.Players.LocalPlayer})
	elseif v.Name == "BalloonSession" then
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.BalloonSession.Server.SetFinishState:FireServer({["Value"] = "Correct", ["User"] = game.Players.LocalPlayer})
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.BalloonSession.Server.DeleteUi:FireServer({["Value"] = "True", ["User"] = game.Players.LocalPlayer})
	elseif v.Name == "BMatchingSession" then
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.BMatchingSession.Server.SetFinishState:FireServer({["Value"] = "Correct", ["User"] = game.Players.LocalPlayer})
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.BMatchingSession.Server.DeleteUi:FireServer({["Value"] = "True", ["User"] = game.Players.LocalPlayer})
	elseif v.Name == "MechanicSession" then
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.MechanicSession.Server.SetFinishState:FireServer({["Value"] = "Red", ["User"] = game.Players.LocalPlayer})
		task.wait(0.2)
		game.Players.LocalPlayer.PlayerGui.MechanicSession.Server.DeleteUi:FireServer({["Value"] = "True", ["User"] = game.Players.LocalPlayer})
	end
end

local chekking = workspace.Game.Players.ChildAdded:Connect(function(v)
	if v.Name == game.Players.LocalPlayer.Name then
		chr = v
	elseif v.Name == "Baldi" and game.Players.LocalPlayer.Character.Name == "Baldi" then
		chr = game.Players.LocalPlayer.Character
	end
end)

local Tab = Window:CreateTab("Esp", 4483362458)
local Toggle = Tab:CreateToggle({
	Name = "Esp Enemy",
	CurrentValue = false,
	Flag = "Esp Enemy", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			for _, v in ipairs (workspace.Game.Players:GetChildren()) do
				if v.Name == "Baldi" and not v:FindFirstChild("EspBaldi") and game.Players.LocalPlayer.Character.Name ~= "Baldi" then
					local hg = Instance.new("Highlight")
					hg.Parent = v
					hg.FillColor = Color3.fromRGB(255, 0, 0)
					hg.Name = "EspBaldi"
				end
			end
			espBaldi = workspace.Game.Players.ChildAdded:Connect(function()
				for _, v in ipairs (workspace.Game.Players:GetChildren()) do
					if v.Name == "Baldi" and not v:FindFirstChild("EspBaldi") and game.Players.LocalPlayer.Character.Name ~= "Baldi" then
						local hg = Instance.new("Highlight")
						hg.Parent = v
						hg.FillColor = Color3.fromRGB(255, 0, 0)
						hg.Name = "EspBaldi"
					end
				end
			end)
		else
			espBaldi:Disconnect()
			for _, v in ipairs (workspace.Game.Players:GetChildren()) do
				if v:FindFirstChild("EspBaldi") then
					v.EspBaldi:Destroy()
				end
			end
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Esp Players",
	CurrentValue = false,
	Flag = "Esp Players", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			for _, v in ipairs (workspace.Game.Players:GetChildren()) do
				if v.Name ~= "Baldi" and not v:FindFirstChild("EspPlayer") and v.Name ~= game.Players.LocalPlayer.Name then
					local hg = Instance.new("Highlight")
					hg.Parent = v
					hg.FillColor = Color3.fromRGB(0, 255, 0)
					hg.Name = "EspPlayer"
				end
			end
			espPlayer = workspace.Game.Players.ChildAdded:Connect(function()	
				for _, v in ipairs (workspace.Game.Players:GetChildren()) do
					if v.Name ~= "Baldi" and not v:FindFirstChild("EspPlayer") and v.Name ~= game.Players.LocalPlayer.Name then
						local hg = Instance.new("Highlight")
						hg.Parent = v
						hg.FillColor = Color3.fromRGB(0, 255, 0)
						hg.Name = "EspPlayer"
					end
				end
			end)
		else
			espPlayer:Disconnect()
			for _, v in ipairs (workspace.Game.Players:GetChildren()) do
				if v:FindFirstChild("EspPlayer") then
					v.EspPlayer:Destroy()
				end
			end
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Esp Books",
	CurrentValue = false,
	Flag = "Esp Books", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			espBooks = true
			while espBooks == true do	
				if workspace.Game:FindFirstChild("Map") then
					if workspace.Game.Map:FindFirstChild("Notebooks") then
						for _, v in ipairs (workspace.Game.Map.Notebooks:GetChildren()) do
							if v.Name == "Notebook" and not v:FindFirstChild("EspBook") then
								local hg = Instance.new("Highlight")
								hg.Parent = v
								hg.FillColor = Color3.fromRGB(0, 0, 255)
								hg.Name = "EspBook"
							end
						end
					end
				end
				task.wait(5)
			end
		else
			espBooks = false
		end
	end,
})

local Tab = Window:CreateTab("Misc", 4483362458)
local Toggle = Tab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Flag = "Noclip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			chr.HumanoidRootPart.CanCollide = false
			if game.ReplicatedStorage:FindFirstChild("CrouchBlock") then
				game.ReplicatedStorage.CrouchBlock:Destroy()
			end
			task.wait(0.2)
			chr.CrouchBlock.Parent = game.ReplicatedStorage
			
			noclip = workspace.Game.Players.ChildAdded:Connect(function(v)
				if v.Name == game.Players.LocalPlayer.Name or (v.Name == "Baldi" and game.Players.LocalPlayer.Team == game.Teams.Baldi) then
					task.wait(1)
					chr.HumanoidRootPart.CanCollide = false
					if game.ReplicatedStorage:FindFirstChild("CrouchBlock") then
						game.ReplicatedStorage.CrouchBlock:Destroy()
					end
					task.wait(0.2)
					if chr:FindFirstChild("CrouchBlock") then
						chr.CrouchBlock.Parent = game.ReplicatedStorage
					end
				end
			end)
		else
			chr.HumanoidRootPart.CanCollide = true
			game.ReplicatedStorage.CrouchBlock.Parent = chr
			noclip:Disconnect()
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Fullbright",
	CurrentValue = false,
	Flag = "Fullbright", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			brightness = game.RunService.RenderStepped:Connect(function()
				game.Lighting.Ambient = Color3.fromRGB(170, 170, 170)
				game.Lighting.FogEnd = 99999
				game.Lighting.GlobalShadows = false
			end)
		else
			brightness:Disconnect()	
			game.Lighting.Ambient = Color3.fromRGB(35, 35, 35)
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Inf Stamina",
	CurrentValue = false,
	Flag = "Inf Stamina", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			stamina = game.RunService.Heartbeat:Connect(function()
				if chr:FindFirstChild("Values") then
					chr.Values.Stamina.Value = 100
					chr.Values.Boostometer.Value = 100
				end
			end)
		else
			stamina:Disconnect()	
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Complete",
	CurrentValue = false,
	Flag = "Auto Complete", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			for _, v in ipairs (game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				whatComplete(v)
			end
			complete = game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(whatComplete)
		else
			complete:Disconnect()	
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Anti fall (if you using noclip)",
	CurrentValue = false,
	Flag = "Anti fall", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			antiFall = workspace.Game.ChildAdded:Connect(function(v)
				if v.Name == "Map" then
					task.wait(1)
					if workspace.Game.Map.Environment:FindFirstChild("Floor") then
						workspace.Game.Map.AntiVoidKillBarrier.CFrame = workspace.Game.Map.Environment.Floor.CFrame
					elseif workspace.Game.Map.Environment:FindFirstChild("Floor1") then
						workspace.Game.Map.AntiVoidKillBarrier.CFrame = workspace.Game.Map.Environment.Floor1.CFrame
					end
					workspace.Game.Map.AntiVoidKillBarrier.CanTouch = false
					workspace.Game.Map.AntiVoidKillBarrier.Size = Vector3.new(2048, 2, 2048)
				end
			end)
			workspace.Game.Lobby.Environment.AntiVoidKillBarrier.CFrame = workspace.Game.Lobby.Environment.AntiVoidKillBarrier.CFrame + Vector3.new(0, 23, 0)
		else
			antiFall:Disconnect()
			workspace.Game.Lobby.Environment.AntiVoidKillBarrier.CFrame = workspace.Game.Lobby.Environment.AntiVoidKillBarrier.CFrame - Vector3.new(0, 23, 0)	
		end
	end,
})

local Button = Tab:CreateButton({
	Name = "Spawn At Map If You Die",
	Callback = function()
		if workspace.Game:FindFirstChild("Map") then
			if workspace.Game.Map:FindFirstChild("Spawns") then
				if game.Players.LocalPlayer.Team == game.Teams.Lobby then
					chr.HumanoidRootPart.CFrame = workspace.Game.Map.Spawns.Player.SpawnLocation.CFrame + Vector3.new(0, 5, 0)
					game.Players.LocalPlayer.Team = game.Teams.Players
				end
			end
		end
	end,
})
