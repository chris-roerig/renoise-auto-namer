--------------------------------------------------------------------
-- helper functions
--------------------------------------------------------------------

--[[
function platform_is_unixlike()
  -- true is unix, false (result is nil) then it's windows
  os.execute('nothere 2>/dev/null') / 256 == 127
end

function join_path(a, b...)
  local sep = platform_is_unixlike() ? "/" : "\\"

  return a..sep..b
end
--]]

-- capitalize a word
function upcase(word)
  return string.gsub(" "..word, "%W%l", string.upper):sub(2)
end

--------------------------------------------------------------------
-- processing
--------------------------------------------------------------------

function name_and_save()
  -- get random adjectives and nouns
  local t = {
    adj  = upcase(adjs[math.random(#adjs)]),
    noun = upcase(nouns[math.random(#nouns)])
  }
  
  -- assemble the song name
  local name = string.gsub("$adj $noun", "%$(%w+)", t)
  local date = os.date("%m-%d-%Y-")
  local fullname = date..name
  local dir = renoise.app():prompt_for_path("Save song dir...")
  
  renoise.song().name = fullname
  --TODO: save the path in preferences
  renoise.app():save_song_as(path.join(dir, fullname))

  renoise.app():show_message("Song has been named "..fullname)
end

