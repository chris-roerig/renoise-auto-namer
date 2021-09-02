--[[
  @jugwine1
]]

require "functions"
require "word_lists"

-- first entry into the tool
function main()
  renoise.tool().app_new_document_observable:add_notifier(function() main() end)
  -- removes the timer so this function isn't called repeately every 2 seconds
  renoise.tool():remove_timer(main)

  name_and_save()
end

-- wait a couple seconds for the app to be ready after init
renoise.tool():add_timer(main, 2000)
