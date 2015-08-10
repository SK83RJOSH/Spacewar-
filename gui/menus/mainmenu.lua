MainMenu = Menu:extend("MainMenu")

function MainMenu:init()
	MainMenu.super.init(self, love.window.getTitle())

	self:addComponent(ButtonComponent(Vector2(-1, 200), "Play", Assets.fonts.Hyperspace_Bold.large, function()
		setGameState(GameState.Game)
	end))

	self:addComponent(ButtonComponent(Vector2(-1, 250), "Host Game", Assets.fonts.Hyperspace_Bold.large, function()
		local status, error = World.setNetworkState(NetworkState.Host, {
			port = tonumber(Settings.get('network_port'))
		})

		if status then
			setGameState(GameState.Game)
		else
			GUI.pushMenu(ErrorMenu(error))
		end
	end))

	self:addComponent(ButtonComponent(Vector2(-1, 300), "Join Game", Assets.fonts.Hyperspace_Bold.large, function()
		GUI.pushMenu(JoinMenu())
	end))

	self:addComponent(ButtonComponent(Vector2(-1, 350), "Options", Assets.fonts.Hyperspace_Bold.large, function()
		GUI.pushMenu(OptionsMenu())
	end))

	self:addComponent(ButtonComponent(Vector2(-1, 400), "Quit", Assets.fonts.Hyperspace_Bold.large, function()
		love.event.quit()
	end))
end
