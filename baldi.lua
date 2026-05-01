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
local brightness
local espBaldi
local espPlayer
local noclip
local stamina
local espBooks = false

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
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			chr.HumanoidRootPart.CanCollide = false
			if game.ReplicatedStorage:FindFirstChild("CrouchBlock") then
				game.ReplicatedStorage.CrouchBlock:Destroy()
			end
			chr.CrouchBlock.Parent = game.ReplicatedStorage
			
			noclip = workspace.Game.Players.ChildAdded:Connect(function(v)
				if v.Name == game.Players.LocalPlayer.Name or (v.Name == "Baldi" and game.Players.LocalPlayer.Team == game.Teams.Baldi) then
					task.wait(1)
					chr.HumanoidRootPart.CanCollide = false
					if game.ReplicatedStorage:FindFirstChild("CrouchBlock") then
						game.ReplicatedStorage.CrouchBlock:Destroy()
					end
					chr.CrouchBlock.Parent = game.ReplicatedStorage
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
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			brightness = game.RunService.RenderStepped:Connect(function()
				game.Lighting.Ambient = Color3.fromRGB(128, 128, 128)
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
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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