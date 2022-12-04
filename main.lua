-- Define a function to play a sound when a mining node or herb is found on the minimap
    function playSoundOnMinimapNode()
        -- Use the World of Warcraft API to get the user's selected sound file from the addon's configuration settings
        local selectedSound = GetAddOnMetadata("MyAddon", "selectedSound")
      
        -- Use the World of Warcraft API to get a list of all mining nodes and herbs currently on the minimap
        local nodes = GetMinimapNodes()
      
        -- Loop through the list of nodes and check if any are mining nodes or herbs
        for _, node in pairs(nodes) do
          if node.type == "mining" or node.type == "herb" then
            -- If a mining node or herb is found, use the World of Warcraft API to play the user's selected sound file
            PlaySound(selectedSound)
          end
        end
      end
      
      -- Define a function to create the menu option for selecting a sound file
      function createSoundSelector()
        -- Use the World of Warcraft API to create a new dropdown menu option in the addon's configuration screen
        local selector = CreateFrame("FRAME", "MyAddonSoundSelector", MyAddonConfig, "UIDropDownMenuTemplate")
      
        -- Set the default selected value for the dropdown menu
        local selectedSound = GetAddOnMetadata("MyAddon", "selectedSound") or SOUNDKIT.UI_MAP_WAYPOINT_QUEST_COMPLETE
        UIDropDownMenu_SetSelectedValue(selector, selectedSound)
      
        -- Populate the dropdown menu with the names of all the available sound files
        for soundID, soundName in pairs(SOUNDKIT) do
          if type(soundID) == "string" and soundID:match("^SOUNDKIT_") then
            local info = UIDropDownMenu_CreateInfo()
            info.text = soundName
            info.value = soundID
            info.func = function(self)
              -- When the user selects a sound file, use the World of Warcraft API to save their selection in the addon's configuration settings
              SetAddOnMetadata("MyAddon", "selectedSound", self.value)
      
              -- Update the selected value in the dropdown menu to
      -- Define a function to play a sound when a mining node or herb is found on the minimap
function playSoundOnMinimapNode()
    -- Use the World of Warcraft API to get the user's selected sound file from the addon's configuration settings
    local selectedSound = GetAddOnMetadata("MyAddon", "selectedSound")
  
    -- Use the World of Warcraft API to get a list of all mining nodes and herbs currently on the minimap
    local nodes = GetMinimapNodes()
  
    -- Loop through the list of nodes and check if any are mining nodes or herbs
    for _, node in pairs(nodes) do
      if node.type == "mining" or node.type == "herb" then
        -- If a mining node or herb is found, use the World of Warcraft API to play the user's selected sound file
        PlaySound(selectedSound)
      end
    end
  end
  
  -- Define a function to create the menu option for selecting a sound file
  function createSoundSelector()
    -- Use the World of Warcraft API to create a new dropdown menu option in the addon's configuration screen
    local selector = CreateFrame("FRAME", "MyAddonSoundSelector", MyAddonConfig, "UIDropDownMenuTemplate")
  
    -- Set the default selected value for the dropdown menu
    local selectedSound = GetAddOnMetadata("MyAddon", "selectedSound") or SOUNDKIT.UI_MAP_WAYPOINT_QUEST_COMPLETE
    UIDropDownMenu_SetSelectedValue(selector, selectedSound)
  
    -- Populate the dropdown menu with the names of all the available sound files
    for soundID, soundName in pairs(SOUNDKIT) do
      if type(soundID) == "string" and soundID:match("^SOUNDKIT_") then
        local info = UIDropDownMenu_CreateInfo()
        info.text = soundName
        info.value = soundID
        info.func = function(self)
          -- When the user selects a sound file, use the World of Warcraft API to save their selection in the addon's configuration settings
          SetAddOnMetadata("MyAddon", "selectedSound", self.value)
  
          -- Update the selected value in the dropdown menu to match the user's selection
          UIDropDownMenu_SetSelectedValue(selector, self.value)
        end
  
        -- Add the sound file to the dropdown menu
        UIDropDownMenu_AddButton(info)
      end
    end
  end
  
  -- Use the World of Warcraft API to call the "createSoundSelector" function when the addon is loaded
  createSoundSelector()
  