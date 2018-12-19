--###################################################################
--##                                                               ## 
--##   Donal Land (NES) Utility Script for BizHawk                 ## 
--##   http://tasvideos.org/Bizhawk.html                           ## 
--##                                                               ## 
--##   Author: Bruno Valadão Cunha (BrunoValads)                   ##
--##                                                               ## 
--##   Git repository: https://github.com/brunovalads/donald-land  ##
--##                                                               ## 
--###################################################################

--###########################################################################################
-- CONFIG

local OPTIONS = {
  --- SHOW/HIDE OPTIONS ---
  
  -- Player info
  display_player_info = true,
  display_player_main_info = true,
  display_player_hitbox = true,
  display_static_camera_region = false,
  display_debug_player_extra = true,
  
  -- Level info
  display_level_info = true,
  display_level_main_info = true,
  display_tile_info = false,
  display_screen_info = false,
  display_sprite_data = false,
  
  -- Sprite info
  display_sprite_info = true,
  display_sprite_table = true,
  display_sprite_hitbox = true,
  display_sprite_special_info = true,
  display_sprite_despawn_lines = true,
  display_sprite_table_all = false,
  
  -- General info
  display_general_info = true,
  display_game_info = true,
  display_movie_info = true,
  display_controller_data = false,
  display_mouse_info = false,
  
  --- GAPS ---
  left_gap = 130, -- SHOULD NOT BE ZERO
  top_gap = 30, -- SHOULD NOT BE ZERO
  right_gap = 180,
  bottom_gap = 30,
}

--###########################################################################################
-- UTILITIES

-- Basic functions renaming
local fmt = string.format
local floor = math.floor
local ceil = math.ceil
local sqrt = math.sqrt
local sin = math.sin
local cos = math.cos
local pi = math.pi

-- Variables used in general
local Joypad = {}
local Options_form = {}
local Previous = {}
local NTSC_FRAMERATE = 60.0988138974405
local PAL_FRAMERATE = 50.0069789081886

-- General emulation info
local Movie_active, Readonly, Framecount, Lagcount, Rerecords, Is_lagged
local Lastframe_emulated, Nextframe
local function bizhawk_status()
  Movie_active = movie.isloaded()
  Readonly = movie.getreadonly()
  Framecount = movie.length()
  Lagcount = emu.lagcount()
  Rerecords = movie.getrerecordcount()
  Is_lagged = emu.islagged()
  Lastframe_emulated = emu.framecount()
  Nextframe = Lastframe_emulated + 1
  Game_region = emu.getdisplaytype()
end

-- Get screen dimensions of the game and emulator
local Scale_x, Scale_y
local Screen_width, Screen_height
local Buffer_width, Buffer_height, Buffer_middle_x, Buffer_middle_y
local Border_right_start, Border_bottom_start
local BizHawk_font_width, BizHawk_font_height
local function bizhawk_screen_info()
  if client.borderwidth() == 0 then -- to avoid division by zero bug when borders are not yet ready when loading the script
    Scale_x = 2
    Scale_y = 2
  else
    Scale_x = math.min(client.borderwidth()/OPTIONS.left_gap, client.borderheight()/OPTIONS.top_gap) -- Pixel scale
    Scale_y = Scale_x -- assumming square pixels only
  end
  
  Screen_width = client.screenwidth()/Scale_x  -- Emu screen width CONVERTED to game pixels
  Screen_height = client.screenheight()/Scale_y  -- Emu screen height CONVERTED to game pixels
  
  Buffer_width = client.bufferwidth()  -- Game area width, in game pixels
  Buffer_height = client.bufferheight()  -- Game area height, in game pixels
  Buffer_middle_x = OPTIONS.left_gap + Buffer_width/2  -- Game area middle x relative to emu window, in game pixels
  Buffer_middle_y = OPTIONS.top_gap + Buffer_height/2  -- Game area middle y relative to emu window, in game pixels
  
  Border_right_start = OPTIONS.left_gap + Buffer_width
  Border_bottom_start = OPTIONS.top_gap + Buffer_height
  
  BizHawk_font_width = 10/Scale_x -- to make compatible to the scale
  BizHawk_font_height = 18/Scale_y
end

-- Memory read/write functions
local u8 =  mainmemory.read_u8
local s8 =  mainmemory.read_s8
local w8 =  mainmemory.write_u8
local u16 = mainmemory.read_u16_le
local s16 = mainmemory.read_s16_le
local w16 = mainmemory.write_u16_le
local u24 = mainmemory.read_u24_le
local s24 = mainmemory.read_s24_le
local w24 = mainmemory.write_u24_le

-- Function to proper returns the text (x, y) position its length, with a few useful parameters
local function text_position(x, y, text, font_width, font_height, always_on_client, always_on_game, ref_x, ref_y)
  -- Reads external variables
  local buffer_left     = OPTIONS.left_gap
  local buffer_right    = Border_right_start
  local buffer_top      = OPTIONS.top_gap
  local buffer_bottom   = Border_bottom_start
  local screen_left     = 0
  local screen_right    = Screen_width
  local screen_top      = 0
  local screen_bottom   = Screen_height
  
  -- Text processing
  local text_length = text and string.len(text)*font_width or font_width  -- considering another objects, like bitmaps
  
  -- Actual position, relative to game area origin
  x = (not ref_x and x) or (ref_x == 0 and x) or x - floor(text_length*ref_x)
  y = (not ref_y and y) or (ref_y == 0 and y) or y - floor(font_height*ref_y)
  
  -- Adjustment needed if text is supposed to be on screen area
  local x_end = x + text_length
  local y_end = y + font_height
  
  if always_on_game then
    if x < buffer_left then x = buffer_left end
    if y < buffer_top then y = buffer_top end
    
    if x_end > buffer_right  then x = buffer_right  - text_length end
    if y_end > buffer_bottom then y = buffer_bottom - font_height end
    
  elseif always_on_client then
    if x < screen_left + 1 then x = screen_left + 1 end -- +1 to avoid printing touching the screen border
    if y < screen_top + 1 then y = screen_top + 1 end
    
    if x_end > screen_right - 1  then x = screen_right  - text_length - 1 end -- -1 to avoid printing touching the screen border
    if y_end > screen_bottom - 1 then y = screen_bottom - font_height - 1 end
  end
  
  return x, y, text_length
end

  
-- Text drawing function
local function draw_text(x, y, text, text_color, bg_color, always_on_client, always_on_game, ref_x, ref_y)
  
  local x_pos, y_pos, length = text_position(x, y, text, BizHawk_font_width, BizHawk_font_height, always_on_client, always_on_game, ref_x, ref_y)

  gui.text(Scale_x*x_pos, Scale_y*y_pos, text, text_color, bg_color)
  
  return x_pos + length, y_pos + BizHawk_font_height, length
end

-- Drawing over text, based on binary values
local function draw_over_text(x, y, value, base, color_base, color_value, color_bg, always_on_client, always_on_game, ref_x, ref_y)
  
  value = decode_bits(value, base)
  local x_end, y_end, length = draw_text(x, y, base, color_base, color_bg, always_on_client, always_on_game, ref_x, ref_y)

  gui.text(x_end - length, y_end, value, color_value, 0)

  return x_end, y_end, length
end

-- Drawing functions
local draw = {
  -- Renames
  box = gui.drawBox,
  ellipse = gui.drawEllipse,
  image = gui.drawImage,
  image_region = gui.drawImageRegion,
  line = gui.drawLine,
  cross = gui.drawAxis,
  pixel = gui.drawPixel,
  polygon = gui.drawPolygon,
  rectangle = gui.drawRectangle,
  text = draw_text,
  over_text = draw_over_text,
  
  
  
}

-- Converts the in-game (x, y) to NES-screen coordinates
local function screen_coordinates(x, y, camera_x, camera_y)
  local x_screen = x - camera_x + OPTIONS.left_gap
  local y_screen = y - camera_y + OPTIONS.top_gap

  return x_screen, y_screen
end

-- Converts BizHawk/emu-screen coordinates to in-game (x, y)
local function game_coordinates(x_emu, y_emu, camera_x, camera_y)
  local x_game = x_emu + camera_x
  local y_game = y_emu + camera_y

  return x_game, y_game
end

-- Convert unsigned byte to signed in hex string
local function signed8hex(num, signal)
  local maxval = 128
  if signal == nil then signal = true end
  
  if num < maxval then -- positive
    return fmt("%s%02X", signal and "+" or "", num)
  else -- negative
    return fmt("%s%02X", signal and "-" or "", 2*maxval - num)
  end  
end

-- Transform the binary representation of base into a string
-- For instance, if each bit of a number represents a char of base, then this function verifies what chars are on
function decode_bits(data, base)
  local i = 1
  local size = base:len()
  local result = ""

  for ch in base:gmatch(".") do
    if bit.check(data, size - i) then
      result = result .. ch
    else
      result = result .. " "
    end
    i = i + 1
  end

  return result
end

-- Returns frames-time conversion
local function frame_time(frame)
  local total_seconds = frame/(Game_region == "NTSC" and NTSC_FRAMERATE or PAL_FRAMERATE)
  local hours = floor(total_seconds/3600)
  local tmp = total_seconds - 3600*hours
  local minutes = floor(tmp/60)
  tmp = tmp - 60*minutes
  local seconds = floor(tmp)

  local miliseconds = 1000* (total_seconds%1)
  if hours == 0 then hours = "" else hours = string.format("%d:", hours) end
  local str = string.format("%s%.2d:%.2d.%03.0f", hours, minutes, seconds, miliseconds)
  return str
end

--###########################################################################################
-- GAME SPECIFICS

-- Check the game name in ROM
local Game_name = ""
for i = 0, 10 do
  Game_name = Game_name .. string.char(memory.read_u8(0x01FFE0 + i, "PRG ROM"))
end
if Game_name ~= "DONALD LAND" then print("Are you sure this is Donald Land (NES)?") end

-- RAM map
local RAM = {
  -- General
  game_mode = 0x00EC,
  frame_counter = 0x007C,
  effective_frame = 0x007D,
  lag_indicator = 0x007F,
  rng = 0x008B,
  camera_x = 0x00CC, -- 2 bytes
  paused_flag = 0x00DF,
  timer = 0x00EA, -- 2 bytes
  score = 0x0101, -- 3 bytes
  loading_seam_pos = 0x0042,
  level_index = 0x0051,
  sublevel_index = 0x0052,
  level_size = 0x004C,
  tiles_nametable0 = 0x240, -- 0xD0 (13*16) bytes
  tiles_nametable1 = 0x330, -- 0xD0 (13*16) bytes
  static_camera_left_limit = 0x00AE,
  static_camera_right_limit = 0x00AF,
  boss_hit_counter = 0x00E2, -- for "large" bosses (#3, #4, #9), for "sprite" bosses it's in the $050F sprite table
  
  -- Player
  player_x = 0x0617, -- 2 bytes, big endian
  player_x_sub = 0x0092,
  player_x_in_screen = 0x0091,
  player_y = 0x0095, -- 1 byte, there's no vertical level
  player_y_sub = 0x0094,
  player_x_speed = 0x0098,
  player_x_speed_sub = 0x0099,
  player_x_res_speed = 0x009A,
  player_x_res_speed_sub = 0x009B,
  player_x_obj_speed = 0x00A9,
  player_x_obj_speed_sub = 0x00AA,
  player_y_speed = 0x009C,
  player_y_speed_sub = 0x009D,
  direction = 0x0088,
  is_crouching = 0x008C,
  blocked_status = 0x00A8,
  jump_state = 0x00AB,
  jump_ascension_counter = 0x00AC,
  doube_apple_flag = 0x062B,
  health = 0x062C,
  lives = 0x062D,
  hamburgers = 0x061E,
  invincibility_timer = 0x00BC,
  effective_tile = 0x0615,
  
  -- Sprites
  sprite_status = 0x04F3,
  sprite_type = 0x04FB,
  sprite_UNKNOWN_0501 = 0x0501,
  sprite_UNKNOWN_0509 = 0x0509,
  sprite_UNKNOWN_050F = 0x050F,
  sprite_UNKNOWN_0515 = 0x0515,
  sprite_UNKNOWN_051B = 0x051B,
  sprite_UNKNOWN_0521 = 0x0521,
  sprite_UNKNOWN_0527 = 0x0527,
  sprite_UNKNOWN_052F = 0x052F,
  sprite_UNKNOWN_0535 = 0x0535,
  sprite_UNKNOWN_053D = 0x053D,
  sprite_x_screen = 0x0543,
  sprite_x_pos = 0x054B,
  sprite_x_subpos = 0x0553,
  sprite_y_screen = 0x055B,
  sprite_y_pos = 0x0563,
  sprite_y_subpos = 0x056B,
  sprite_UNKNOWN_0573 = 0x0573,
  sprite_UNKNOWN_057B = 0x057B,
  sprite_x_speed = 0x0583,
  sprite_x_subspeed = 0x058B,
  sprite_y_speed = 0x0593,
  sprite_y_subspeed = 0x059B,
  sprite_UNKNOWN_05B3 = 0x05B3,
  sprite_UNKNOWN_05B9 = 0x05B9,
  
  -- Timers
  pause_buffer = 0x0022,
  timer_framecounter = 0x061A,
  pause_unpause_timer = 0x061A,
  
  -- Input
  controller_curr = 0x00C7,
  controller_prev = 0x00C8,
  
}

-- Game general constants
local DONALD = {
  -- Game Modes
  game_mode_level = 0x05,

  -- Sprites
  sprite_max = 8,

  -- Blocks
}

-- Level constants and info
DONALD.level = {
  [0x00] = {name = "Intro"            , size = 0x01, tile_map = 0x0     , tile_format = 0x0     , screen_data = 0x009C08, tile_properties = 0x0     },
  [0x01] = {name = "Home Town World"  , size = 0x0B, tile_map = 0x00C00F, tile_format = 0x00C68F, screen_data = 0x00C003, tile_properties = 0x00C867},
  [0x02] = {name = "Lake Side World"  , size = 0x17, tile_map = 0x00001B, tile_format = 0x000D1B, screen_data = 0x000003, tile_properties = 0x000F83},
  [0x03] = {name = "Forest World"     , size = 0x17, tile_map = 0x0010D2, tile_format = 0x001DD2, screen_data = 0x0010BA, tile_properties = 0x001FBE},
  [0x04] = {name = "Sky World"        , size = 0x0F, tile_map = 0x004013, tile_format = 0x004D13, screen_data = 0x004003, tile_properties = 0x004FD3},
  [0x05] = {name = "Oasis World"      , size = 0x0F, tile_map = 0x008013, tile_format = 0x008D13, screen_data = 0x008003, tile_properties = 0x008F93},
  [0x06] = {name = "Cave World"       , size = 0x13, tile_map = 0x0020CB, tile_format = 0x002DCB, screen_data = 0x0020B7, tile_properties = 0x002F67},
  [0x07] = {name = "Pond World"       , size = 0x17, tile_map = 0x00514E, tile_format = 0x005E4E, screen_data = 0x005136, tile_properties = 0x00600E},
  [0x08] = {name = "Harbor World"     , size = 0x0B, tile_map = 0x00C962, tile_format = 0x00CFE2, screen_data = 0x00C956, tile_properties = 0x00D1FE},
  [0x09] = {name = "Ocean World"      , size = 0x20, tile_map = 0x006112, tile_format = 0x007152, screen_data = 0x0060F1, tile_properties = 0x007462},
  [0x0A] = {name = "Ghost Town World" , size = 0x0F, tile_map = 0x0090E6, tile_format = 0x009DE6, screen_data = 0x0090D6, tile_properties = 0x00A0A6},
  [0x0B] = {name = "Dark Forest World", size = 0x0B, tile_map = 0x00D31B, tile_format = 0x00D99B, screen_data = 0x00D30F, tile_properties = 0x00DB37},
  [0x0C] = {name = "Castle World"     , size = 0x20, tile_map = 0x00A22A, tile_format = 0x00BB5A, screen_data = 0x00A209, tile_properties = 0x00BE62},
  [0x0D] = {name = "Shop #1"          , size = 0   , tile_map = 0x0     , tile_format = 0x0     , screen_data = 0x00A1BF, tile_properties = 0x0     },
  [0x0E] = {name = "Credits"          , size = 0x01, tile_map = 0x0075F1, tile_format = 0x0079B1, screen_data = 0x0075ED, tile_properties = 0x007C0D},
  [0x0F] = {name = "Credits"          , size = 1   , tile_map = 0x0     , tile_format = 0x0     , screen_data = 0x00B5ED, tile_properties = 0x0     },
  [0x10] = {name = "Credits"          , size = 1   , tile_map = 0x0     , tile_format = 0x0     , screen_data = 0x00B5ED, tile_properties = 0x0     },
  [0x11] = {name = "Credits (alt?)"   , size = 1   , tile_map = 0x0     , tile_format = 0x0     , screen_data = 0x00B5ED, tile_properties = 0x0     },
  [0x12] = {name = "Shop #2"          , size = 0   , tile_map = 0x0     , tile_format = 0x0     , screen_data = 0x00A1C8, tile_properties = 0x0     },
}

-- Level names with indexes, to be used in the level select cheat
DONALD.level_names = {
  "$01 - Home Town World",
  "$02 - Lake Side World",
  "$03 - Forest World",
  "$04 - Sky World",
  "$05 - Oasis World",
  "$06 - Cave World",
  "$07 - Pond World",
  "$08 - Harbor World",
  "$09 - Ocean World",
  "$0A - Ghost Town World",
  "$0B - Dark Forest World",
  "$0C - Castle World",
}

--[[
DONALD.level = {
  [0x01] = {name = "Home Town World",   rooms = {0, 1},                boss_room = 1, size = 0x0B, tile_map = 0x00C00F, tile_format = 0x00C68F},  -- sizes seem to be located at $01F85B
  [0x02] = {name = "Lake Side World",   rooms = {0, 1},                boss_room = 1, size = 0x17, tile_map = 0x00001B, tile_format = 0x000D1B},
  [0x03] = {name = "Forest World",      rooms = {0, 1, 2},             boss_room = 1, size = 0x17, tile_map = 0x0010D2, tile_format = 0x001DD2}, -- last screen is the cutscene
  [0x04] = {name = "Sky World",         rooms = {0, 1, 2},             boss_room = 1, size = 0x0F, tile_map = 0x004013, tile_format = 0x004D13},
  [0x05] = {name = "Oasis World",       rooms = {0, 1},                boss_room = 1, size = 0x0F, tile_map = 0x008013, tile_format = 0x008D13},
  [0x06] = {name = "Cave World",        rooms = {0, 1, 2, 3, 4},       boss_room = 3, size = {0x0C, 0x12, 0x13, 0x13}, tile_map = 0x0020CB, tile_format = 0x002DCB}, -- !!!! size sums between rooms
  [0x07] = {name = "Pond World",        rooms = {0, 1},                boss_room = 1, size = 0x17, tile_map = 0x00514E, tile_format = 0x005E4E}, -- size = 0x16 inside boss room
  [0x08] = {name = "Harbor World",      rooms = {0, 1},                boss_room = 1, size = 0x0B, tile_map = 0x00C962, tile_format = 0x00CFE2},
  [0x09] = {name = "Ocean World",       rooms = {0, 1, 2, 3, 4, 5, 6}, boss_room = 5, size = {0x06, 0x0B - 0x07, 0x10 - 0x0C, 0x18 - 0x14, 0x20 - 0x19}, tile_map = 0x006112, tile_format = 0x007152},
  [0x0A] = {name = "Ghost Town World",  rooms = {0, 1, 2},             boss_room = 1, size = 0x0F, tile_map = 0x0090E6, tile_format = 0x009DE6},
  [0x0B] = {name = "Dark Forest World", rooms = {0, 1},                boss_room = 1, size = 0x0B, tile_map = 0x00D31B, tile_format = 0x00D99B},
  --[0x0C] = {name = "Castle World",      
  -- rooms = {0x00, 0x01     , 0x02=0x0F, 0x03=0x05=0x07=0x0D=0x12=0x13, 0x04     , 0x06     , 0x09     , 0x0A     , 0x0B     , 0x0C     , 0x0E     , 0x11     , 0x14     , 0x15          }, boss_room = {0x14, 0x15}, 
  -- size  = {0x00, 0x03-0x01, 0x06-0x04, 0x0E-0x07                    , 0x10-0x0F, 0x11-0x11, 0x19-0x16, 0x1A-0x1A, 0x1C-0x1B, 0x15-0x13, 0x1F-0x1D, 0x         ,0x1F-0x1F, 0x20 - 0x20   }, -- room 0x10 is the left secret part of room 0x02; room 0x14 is the last screen of room 0x0E
  -- tile_map = 0x00A22A, tile_format = 0x00BB5A}
  [0x0D] = {name = "Shop #1"},
  [0x0E] = {name = "Credits",           rooms = {0x15},                               size = 0x01, tile_map = 0x0075F1, tile_format = 0x0079B1}, -- size value is actually 0x20
  [0x12] = {name = "Shop #2"},
}]]

-- Read game general info
local Frame_counter, Effective_frame, Game_mode
local Level_index, Room_index, Sprite_data_pointer, Level_flag
local Is_paused, Lock_animation_flag, Player_powerup, Player_animation_trigger
local Camera_x
local function scan_donald()
  Frame_counter = u8(RAM.frame_counter)
  Effective_frame = u8(RAM.effective_frame)
  Game_mode = u8(RAM.game_mode)
  Is_paused = u8(RAM.paused_flag) == 1
  Level_index = u8(RAM.level_index)
  Sublevel_index = u8(RAM.sublevel_index)
  Camera_x = s16(RAM.camera_x)
end


--###########################################################################################
-- INFO DISPLAY

-- Tilemap info
local function tilemap_info()
  
  --[[ Grid 16x16
  for i = 0, 16 do
    for j = 0, 14 do
      local x_base = 16*math.floor(Camera_x/16)
      
      draw.rectangle(x_base - Camera_x + i*16 + OPTIONS.left_gap, j*16 + OPTIONS.top_gap, 15, 15, 0xA0FFFFFF)
    end
  end]]
  
  -- Loading seam line
  local seam_x_pos = s16(RAM.loading_seam_pos)
  local seam_x_pos_screen = screen_coordinates(seam_x_pos, 0, Camera_x, 0)
  draw.line(seam_x_pos_screen, 0, seam_x_pos_screen, Screen_height, "red")
  
  
  -- Tiles in nametable
  local tile_id, tile_property, colour, x_pos, y_pos, x_screen, y_screen
  -- Nametable n
  local curr_nametable = (floor(Camera_x/0x100))%2
  for i = 0, 0xD - 1 do
    for j = 0, 0x10 - 1 do
      tile_id = u8(RAM["tiles_nametable"..curr_nametable] + i*16 + j)
      tile_property = memory.readbyte(DONALD.level[Level_index].tile_properties + 2*tile_id, "PRG ROM")%0x10
      if tile_property == 0 then colour = 0x80FFFFFF else colour = 0xA00040FF end
      
      x_pos = 256*floor(Camera_x/0x100) + j*16
      y_pos = i*16 + 32
      x_screen, y_screen = screen_coordinates(x_pos, y_pos, Camera_x, 0)
      
      if x_screen < OPTIONS.left_gap - 16 then
        x_screen = x_screen + 512
      end
      if x_screen < Screen_width then
        draw.rectangle(x_screen, y_screen, 15, 15, colour)
        draw.text(x_screen + 1, y_screen - 3, fmt("%02X", tile_id), colour)
      end
    end
  end
  -- Nametable n+1
  curr_nametable = (floor(Camera_x/0x100) + 1)%2
  for i = 0, 0xD - 1 do
    for j = 0, 0x10 - 1 do
      tile_id = u8(RAM["tiles_nametable"..curr_nametable] + i*16 + j)
      tile_property = memory.readbyte(DONALD.level[Level_index].tile_properties + 2*tile_id, "PRG ROM")%0x10
      if tile_property == 0 then colour = 0x80FFFFFF else colour = 0xA00040FF end
      
      x_pos = 256*(floor(Camera_x/0x100) + 1) + j*16
      y_pos = i*16 + 32
      x_screen, y_screen = screen_coordinates(x_pos, y_pos, Camera_x, 0)
      
      if x_screen < Screen_width then
        draw.rectangle(x_screen, y_screen, 15, 15, colour)
        draw.text(x_screen + 1, y_screen - 3, fmt("%02X", tile_id), colour)
      end
    end
  end
  
end

-- Level info
local function level_info()
  if not OPTIONS.display_level_info then return end
  
  -- Level main info
  local level_size = u8(RAM.level_size)
  local player_x_screen = math.floor(Camera_x + u8(RAM.player_x_in_screen))/0x100
  if OPTIONS.display_level_main_info then
    draw.text(Buffer_middle_x, Screen_height, fmt("Level: %02X  Room: %02X  Screen: %02X/%02X", Level_index, Sublevel_index, player_x_screen, level_size), "white", 0, true, false, 0.5)
  end
  
  -- Screen draw
  if OPTIONS.display_screen_info then
    
    local screen_x, screen_y
    local x_origin, y_origin = screen_coordinates(0, 0, Camera_x, 0)
    local colour = 0x80FF5400 --0x800000FF
    
    for screen_id = 0, level_size do
      screen_x = x_origin + 256*screen_id
      screen_y = y_origin
      
      if screen_x < Screen_width and screen_x > -256 then -- to avoid drawing the whole level
        draw.rectangle(screen_x, screen_y, 255, 255, colour, 0)
        draw.rectangle(screen_x + 1, screen_y + 1, 2*BizHawk_font_width, BizHawk_font_height, colour, colour)
        draw.text(screen_x + 1, screen_y - 2, fmt("%02X", screen_id))
      end
    end
  end
  
  -- Tilemap display
  if OPTIONS.display_tile_info then
    tilemap_info()
  end
  
end

-- Player info
local function player()
  if not OPTIONS.display_player_info then return end
  
  --- Reads RAM
  local x = Camera_x + u8(RAM.player_x_in_screen)
  local y = u8(RAM.player_y)
  local x_sub = u8(RAM.player_x_sub)
  local y_sub = u8(RAM.player_y_sub)
  local x_speed = s8(RAM.player_x_speed)
  local x_speed_u = u8(RAM.player_x_speed) -- used to print a proper hex value
  local x_subspeed = u8(RAM.player_x_speed_sub)
  local x_res_speed = s8(RAM.player_x_res_speed)
  local x_res_subspeed = u8(RAM.player_x_res_speed_sub)
  local y_speed = s8(RAM.player_y_speed)
  local y_speed_u = u8(RAM.player_y_speed) -- used to print a proper hex value
  local y_subspeed = u8(RAM.player_y_speed_sub)
  local direction = u8(RAM.direction)
  local is_crouching = u8(RAM.is_crouching)
  local blocked_status = u8(RAM.blocked_status)
  local jump_state = u8(RAM.jump_state)
  local jump_ascension_counter = u8(RAM.jump_ascension_counter)
  local doube_apple_flag = u8(RAM.doube_apple_flag)
  local health = u8(RAM.health)
  local lives = u8(RAM.lives)
  local hamburgers = u8(RAM.hamburgers)
  local effective_tile = u8(RAM.effective_tile)
  
  --- Tranformations
  local x_screen, y_screen = screen_coordinates(x, y, Camera_x, 0)
  
  -- Display info
  if OPTIONS.display_player_main_info then
    
    local i = 0
    local table_x = 2
    local table_y = OPTIONS.top_gap*Scale_y
    local delta_x = BizHawk_font_width
    local delta_y = BizHawk_font_height
    local colour
    
    -- Position
    draw.text(table_x, table_y + i*delta_y, fmt("Pos (%04X.%02x, %02X.%02x) %s", x, x_sub, y, y_sub, direction == 1 and "->" or "<-"))
    draw.cross(x_screen, y_screen, 3, "cyan")
    i = i + 1
    
    -- Handle "real" speed with sprite boost
    if x_res_speed > 2 or x_res_speed < -2 then x_speed = x_res_speed end -- TODO: INCLUDE x_res_subspeed TOO (actually use player_x_obj_speed and player_x_obj_speed_sub) !!!!!!!!!!!!!!!!!!!!!!
    
    -- Correction for negative speeds
    local x_spd_str, y_spd_str
    if x_speed < 0 then -- corretions for negative horizontal speed
      x_speed = x_speed + 1
      x_subspeed = 0x100 - x_subspeed
      if x_subspeed == 0x100 then x_subspeed = 0 ; x_speed = x_speed - 1 end
      if x_speed == 0 then x_spd_str = fmt("-%d.%02x", x_speed, x_subspeed) -- force negative signal due previous math
      else x_spd_str = fmt("%d.%02x", x_speed, x_subspeed) end
    else
      x_spd_str = fmt("%+d.%02x", x_speed, x_subspeed)
    end
    if y_speed < 0 then -- corretions for negative vertical speed
      y_speed = y_speed + 1
      y_subspeed = 0x100 - y_subspeed
      if y_subspeed == 0x100 then y_subspeed = 0 ; y_speed = y_speed - 1 end
      if y_speed == 0 then y_spd_str = fmt("-%d.%02x", y_speed, y_subspeed) -- force negative signal due previous math
      else y_spd_str = fmt("%d.%02x", y_speed, y_subspeed) end
    else
      y_spd_str = fmt("%+d.%02x", y_speed, y_subspeed)
    end
    
    -- Speed
    if math.abs(x_speed) > 2 then colour = "green" -- speed with sprite boost
    elseif math.abs(x_speed) == 2 then colour = "yellow" -- max running speed
    else colour = "white" end
    draw.text(table_x, table_y + i*delta_y, fmt("Speed (     , %s)", y_spd_str))
    draw.text(table_x, table_y + i*delta_y, fmt("       %s", x_spd_str), colour)
    i = i + 1
    
    -- Jump
    local jump_str = "--" ; colour = "white"
    if jump_state == 1 then jump_str = "up" ; colour = "green"
    elseif jump_state == 2 then jump_str = "down" ; colour = "red" end
    table_x = draw.text(table_x, table_y + i*delta_y, "Jump: ")
    table_x = draw.text(table_x, table_y + i*delta_y, fmt("%s", jump_str), colour)
    if jump_state == 1 then draw.text(table_x, table_y + i*delta_y, fmt(" %d", jump_ascension_counter), jump_ascension_counter >= 30 and "green" or "white") end
    table_x = 2
    i = i + 1
    
    -- Double apple flag
    table_x = draw.text(table_x, table_y + i*delta_y, "Apples: ")
    draw.text(table_x, table_y + i*delta_y, fmt("%s", floor(doube_apple_flag/3) + 1), doube_apple_flag == 5 and "green" or "red") -- floor(doube_apple_flag/3) + 1 to transform 0 and 5 into 1 and 2
    table_x = 2
    i = i + 1
    
    -- Blocked status
    table_x = draw.text(table_x, table_y + i*delta_y, "Blocked: ")
    gui.pixelText(table_x + 2, table_y + i*delta_y + 4, "B")
    draw.rectangle(table_x, table_y + (i+0.5)*delta_y, 8, 8, 0x40000000, 0x40ff0000)
    if bit.check(blocked_status, 0) then  -- Feet on blocks
      draw.line(table_x + 1, table_y + (i+0.5)*delta_y + 8 - 1, table_x + 8 - 1, table_y + (i+0.5)*delta_y + 8 - 1, "red")
    end
    if bit.check(blocked_status, 1) then  -- Laterals on blocks
      draw.line(table_x + 1, table_y + (i+0.5)*delta_y + 1, table_x + 1, table_y + (i+0.5)*delta_y + 8 - 1, "red")
      draw.line(table_x + 8 - 1, table_y + (i+0.5)*delta_y + 1, table_x + 8 - 1, table_y + (i+0.5)*delta_y + 8 - 1, "red")
    end
    table_x = table_x + 10
    gui.pixelText(table_x + 2, table_y + i*delta_y + 4, "S")
    draw.rectangle(table_x, table_y + (i+0.5)*delta_y, 8, 8, 0x40000000, 0x40ff0000)
    if bit.check(blocked_status, 5) then  -- Feet on sprites
      draw.line(table_x + 1, table_y + (i+0.5)*delta_y + 8 - 1, table_x + 8 - 1, table_y + (i+0.5)*delta_y + 8 - 1, "red")
    end
    if bit.check(blocked_status, 6) then  -- Laterals on sprites
      draw.line(table_x + 1, table_y + (i+0.5)*delta_y + 1, table_x + 1, table_y + (i+0.5)*delta_y + 8 - 1, "red")
      draw.line(table_x + 8 - 1, table_y + (i+0.5)*delta_y + 1, table_x + 8 - 1, table_y + (i+0.5)*delta_y + 8 - 1, "red")
    end
    table_x = 2
    i = i + 1
  
    -- Effective tile
    draw.text(table_x, table_y + i*delta_y, fmt("Effective tile: %02X", effective_tile))
    local x_tile, y_tile = u16(0x0036), u16(0x0038) -- TODO: make hardcoded from position, since it's used for updating the nametables too
    local x_tile_screen, y_tile_screen = screen_coordinates(x_tile, y_tile, Camera_x, 0)
    draw.cross(x_tile_screen, y_tile_screen, 3, "magenta")
    table_x = 2
    i = i + 1
    
  end
  
  -- Hitbox
  -- TODO
  
  -- Camera region
  if OPTIONS.display_static_camera_region then
    
    local left_cam, right_cam = u8(RAM.static_camera_left_limit), u8(RAM.static_camera_right_limit)
    draw.box(left_cam + OPTIONS.left_gap, OPTIONS.top_gap + 32, right_cam + OPTIONS.left_gap, OPTIONS.top_gap + 232, 0x80002040, 0x80002040)
    draw.text(left_cam + OPTIONS.left_gap, Border_bottom_start, fmt("%04X", left_cam + Camera_x), "white", 0x400020, false, false, 1, 0)
    draw.text(right_cam + OPTIONS.left_gap, Border_bottom_start, fmt("%04X", right_cam + Camera_x), "white", 0x400020)
    
  
  
  
  
  end
  
  --[[ Tile check points
  local upper_y = y_screen - 16
  draw.cross(x_screen, upper_y, 3, "orange")
  local lower_y = y_screen + 16
  draw.cross(x_screen, lower_y, 3, "orange")
  local action_tile_y = lower_y
  if jump_state == 1 then action_tile_y = upper_y
  elseif jump_state == 2 then action_tile_y = lower_y + 4 end
  draw.cross(x_screen, action_tile_y, 3, "red")]]
  
  -- Block interaction
  --draw.line(
  
end

-- Special sprite AI info
local function special_sprite_AI(slot, sprite_type, x_screen, y_screen, info_color)
  if not OPTIONS.display_sprite_special_info then return end
  
  if sprite_type == 0x00 then -- Lizard
    local subtype = u8(RAM.sprite_UNKNOWN_0501 + slot)
    -- Actiavtion line
    if subtype == 0 then -- is the green one
      local AI_mode = u8(RAM.sprite_UNKNOWN_051B + slot)
      if AI_mode == 0 then
        local activation_x = x_screen - 0x4F
        draw.line(activation_x, OPTIONS.top_gap + 32, activation_x, Border_bottom_start + 8, info_color)
        draw.text(activation_x, Border_bottom_start - BizHawk_font_height/2, fmt("#%d\nactivation", slot), info_color)
      end
    end
    -- HP (Boss)
    if subtype == 1 then -- is the Boss #2
      local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
      draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 16 + 3, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
      draw.text(x_screen, y_screen + 16, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
    end
  end
  
  if sprite_type == 0x05 then -- Woodpecker
    -- Pecking timer
    local pecking_timer = 0x100 - Effective_frame
    draw.text(x_screen, y_screen + 16, fmt("%d", pecking_timer), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x06 then -- Lake Side Weirdo
    -- Actiavtion line
    local AI_mode = u8(RAM.sprite_UNKNOWN_050F + slot)
    if AI_mode == 0 then
      local activation_x = x_screen - 0x2F
      draw.line(activation_x, OPTIONS.top_gap + 32, activation_x, Border_bottom_start + 8, info_color)
      draw.text(activation_x, Border_bottom_start - BizHawk_font_height/2, fmt("#%d\nactivation", slot), info_color)
    end
  end
  
  if sprite_type == 0x10 then -- Boss #6 (Evil Grimace)
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 16 + 3, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 16, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x13 then -- Bandit or Nomad
    -- Throw timer
    local throw_timer = 0x80 - Effective_frame%0x80
    draw.text(x_screen, y_screen + 16, fmt("%d", throw_timer), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x18 then -- Fuzzy Spring
    -- Actiavtion line
    local AI_mode = u8(RAM.sprite_UNKNOWN_051B + slot)
    if AI_mode == 0 then
      local activation_x = x_screen - 0x30
      draw.line(activation_x, OPTIONS.top_gap + 32, activation_x, Border_bottom_start + 8, info_color)
      draw.text(activation_x, Border_bottom_start - BizHawk_font_height/2, fmt("#%d\nactivation", slot), info_color)
    end
  end
  
  if sprite_type == 0x19 then -- Purple Pumpkin
    -- Actiavtion line
    local AI_mode = u8(RAM.sprite_UNKNOWN_051B + slot)
    if AI_mode == 0 then
      local activation_x = x_screen - 0x3F
      draw.line(activation_x, OPTIONS.top_gap + 32, activation_x, Border_bottom_start + 8, info_color)
      draw.text(activation_x, Border_bottom_start - BizHawk_font_height/2, fmt("#%d\nactivation", slot), info_color)
    end
    -- Timer
    AI_mode = u8(RAM.sprite_UNKNOWN_050F + slot)
    if AI_mode == 1 then
      local explosion_timer = u8(RAM.sprite_UNKNOWN_0515 + slot)
      draw.text(x_screen, y_screen + 16, fmt("%d", 0x40 - explosion_timer), info_color, 0, true, false, 0.5, 0.5)
    end
  end
  
  if sprite_type == 0x37 then -- Boss #4 (Red Dragon's Eye)
    -- Make sure it's Boss #4 and not #7
    if Level_index == 4 then
      -- HP
      local HP = 5 - u8(RAM.boss_hit_counter)
      draw.rectangle(OPTIONS.left_gap + 200 - 5*BizHawk_font_width/2 - 1, OPTIONS.top_gap + 50 + 3, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
      draw.text(OPTIONS.left_gap + 200, OPTIONS.top_gap + 50, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
    end
  end
  
  if sprite_type == 0x39 then -- Boss #5 (Skeleton Dragon's skull) ; Sub-boss Magic Hand
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 11, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 8, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x3B then -- Boss #7 (Carnivorous Plant's mouth)
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 11, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 8, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x3C then -- Boss #8 (Evil Captain Crook)
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 11, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 8, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x3D then -- Boss #9 (Octopus (actually it's the Captain Crook sprite, but))
    -- HP
    local HP = 5 - u8(RAM.boss_hit_counter)
    draw.rectangle(OPTIONS.left_gap + 162 - 5*BizHawk_font_width/2 - 1, OPTIONS.top_gap + 150 + 3, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(OPTIONS.left_gap + 162, OPTIONS.top_gap + 150, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x3F then -- Boss #B (Cheese Monster)
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 11, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 8, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x44 then -- Evil Hamburglar (sub-boss)
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 11, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 8, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x46 then -- Boss #C (Gumon)
    -- HP
    local HP = 5 - floor(u8(RAM.sprite_UNKNOWN_050F + slot)/0x10)
    draw.rectangle(x_screen - 5*BizHawk_font_width/2 - 1, y_screen + 11, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
    draw.text(x_screen, y_screen + 8, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
  end
  
  if sprite_type == 0x49 then -- Boss #3 (Wooden Machine)
    -- Check if the sprite is the Boss
    local subtype = u8(RAM.sprite_UNKNOWN_0501 + slot)
    if subtype == 0xFF then -- is Boss
      -- HP
      local HP = 5 - u8(RAM.boss_hit_counter)
      draw.rectangle(x_screen + 95 - 5*BizHawk_font_width/2 - 1, y_screen - 13, 5*BizHawk_font_width + 2, BizHawk_font_height, 0x80000000, 0x80000000)
      draw.text(x_screen + 95, y_screen - 16, fmt("HP: %d", HP), info_color, 0, true, false, 0.5, 0.5)
      -- Fire breath timer
      local fire_timer = u8(RAM.sprite_UNKNOWN_0521 + slot)
      draw.text(x_screen + 55, y_screen + 16, fmt("Fire: %d", fire_timer), info_color, 0, true, false, 0.5, 0.5)
    end
  end
  
  
end

-- Sprite info
local function sprites()
  if not OPTIONS.display_sprite_info then return end
  
  -- Despawning lines
  if OPTIONS.display_sprite_despawn_lines then
    -- Left despawn line
    local x_left =  -0x41
    draw.line(OPTIONS.left_gap + x_left, OPTIONS.top_gap + 32, OPTIONS.left_gap + x_left, Border_bottom_start + 8, 0x80FF0000)
    draw.text(OPTIONS.left_gap + x_left + 1, Border_bottom_start, fmt("Despawn:\n%04X", Camera_x + x_left), 0x80FF0000)
    -- Right despawn line
    local x_right =  0x181
    draw.line(OPTIONS.left_gap + x_right, OPTIONS.top_gap + 32, OPTIONS.left_gap + x_right, Border_bottom_start + 8, 0x80FF0000)
    draw.text(OPTIONS.left_gap + x_right + 1, Border_bottom_start, fmt("Despawn:\n%04X", Camera_x + x_right), 0x80FF0000)
  end
  
  -- Sprite table
  local table_pos = OPTIONS.top_gap + 32
  
  local sprite_colours = {0xffFF0000, 0xffFFBF00, 0xff7FFF00, 0xff00FF3F, 0xff00FFFF, 0xff003FFF, 0xff7F00FF, 0xffFF00BF} -- hues 0, 45, ... , 270, 315
  local sprite_str, info_color

  -- Sprite table labels
  if OPTIONS.display_sprite_table then
    draw.text(Screen_width, table_pos - BizHawk_font_height, "Sprites:", "white", 0, true)
    draw.text(Screen_width, table_pos + 7*BizHawk_font_height, "Apples:", "white", 0, true)
  end
  
  -- Sprite slots loop
  for slot = 0, 8 - 1 do
    
    -- Read RAM values
    local sprite_status = u8(RAM.sprite_status + slot)
    local sprite_type = u8(RAM.sprite_type + slot)
    local sprite_UNKNOWN_0501 = u8(RAM.sprite_UNKNOWN_0501 + slot)
    local sprite_UNKNOWN_0509 = u8(RAM.sprite_UNKNOWN_0509 + slot)
    local sprite_UNKNOWN_050F = u8(RAM.sprite_UNKNOWN_050F + slot)
    local sprite_UNKNOWN_0515 = u8(RAM.sprite_UNKNOWN_0515 + slot)
    local sprite_UNKNOWN_051B = u8(RAM.sprite_UNKNOWN_051B + slot)
    local sprite_UNKNOWN_0521 = u8(RAM.sprite_UNKNOWN_0521 + slot)
    local sprite_UNKNOWN_0527 = u8(RAM.sprite_UNKNOWN_0527 + slot)
    local sprite_UNKNOWN_052F = u8(RAM.sprite_UNKNOWN_052F + slot)
    local sprite_UNKNOWN_0535 = u8(RAM.sprite_UNKNOWN_0535 + slot)
    local sprite_UNKNOWN_0535 = u8(RAM.sprite_UNKNOWN_0535 + slot)
    local sprite_x_screen = u8(RAM.sprite_x_screen + slot)
    local sprite_x_pos = u8(RAM.sprite_x_pos + slot)
    local sprite_x_subpos = u8(RAM.sprite_x_subpos + slot)
    local sprite_y_screen = u8(RAM.sprite_y_screen + slot)
    local sprite_y_pos = u8(RAM.sprite_y_pos + slot)
    local sprite_y_subpos = u8(RAM.sprite_y_subpos + slot)
    local sprite_UNKNOWN_0573 = u8(RAM.sprite_UNKNOWN_0573 + slot)
    local sprite_UNKNOWN_057B = u8(RAM.sprite_UNKNOWN_057B + slot)
    local sprite_x_speed = s8(RAM.sprite_x_speed + slot)
    local sprite_x_subspeed = u8(RAM.sprite_x_subspeed + slot)
    local sprite_y_speed = s8(RAM.sprite_y_speed + slot)
    local sprite_y_subspeed = u8(RAM.sprite_y_subspeed + slot)
    local sprite_UNKNOWN_05B3 = u8(RAM.sprite_UNKNOWN_05B3 + slot)
    local sprite_UNKNOWN_05B9 = u8(RAM.sprite_UNKNOWN_05B9 + slot)
    
    
    -- Correction for negative speeds
    local x_spd_str, y_spd_str
    if sprite_x_speed < 0 then -- corretions for negative horizontal speed
      sprite_x_speed = sprite_x_speed + 1
      sprite_x_subspeed = 0x100 - sprite_x_subspeed
      if sprite_x_subspeed == 0x100 then sprite_x_subspeed = 0 ; sprite_x_speed = sprite_x_speed - 1 end
      if sprite_x_speed == 0 then x_spd_str = fmt("-%d.%02x", sprite_x_speed, sprite_x_subspeed) -- force negative signal due previous math
      else x_spd_str = fmt("%d.%02x", sprite_x_speed, sprite_x_subspeed) end
    else
      x_spd_str = fmt("%+d.%02x", sprite_x_speed, sprite_x_subspeed)
    end
    if sprite_y_speed < 0 then -- corretions for negative vertical speed
      sprite_y_speed = sprite_y_speed + 1
      sprite_y_subspeed = 0x100 - sprite_y_subspeed
      if sprite_y_subspeed == 0x100 then sprite_y_subspeed = 0 ; sprite_y_speed = sprite_y_speed - 1 end
      if sprite_y_speed == 0 then y_spd_str = fmt("-%d.%02x", sprite_y_speed, sprite_y_subspeed) -- force negative signal due previous math
      else y_spd_str = fmt("%d.%02x", sprite_y_speed, sprite_y_subspeed) end
    else
      y_spd_str = fmt("%+d.%02x", sprite_y_speed, sprite_y_subspeed)
    end
    
    -- Get draw colour based on the slot
    if sprite_status == 0 then -- despawned
      info_color = 0x40FFFFFF
    elseif sprite_status == 2 then -- spawned
      info_color = sprite_colours[slot%(#sprite_colours) + 1]
    else -- sprite_status == 3 basically, which is spawned but offscreen
      info_color = sprite_colours[slot%(#sprite_colours) + 1] - 0x3F000000
    end
    
    -- Draw the sprite table
    if OPTIONS.display_sprite_table then
      if slot <= 5 then -- regular sprites
        --sprite_str = fmt("#%d %02X %02X%02X.%02x(%s) %02X%02X.%02x(%s)",
                      --    slot, sprite_type, sprite_x_screen, sprite_x_pos, sprite_x_subpos, x_spd_str, sprite_y_screen, sprite_y_pos, sprite_y_subpos, y_spd_str)
        --;
        draw.text(Screen_width, table_pos + slot*BizHawk_font_height, sprite_str, info_color, 0, true)
      else -- apples
        sprite_str = fmt("#%d %02X%02X.%02x(%s) %02X%02X.%02x(%s)",
                          slot, sprite_x_screen, sprite_x_pos, sprite_x_subpos, x_spd_str, sprite_y_screen, sprite_y_pos, sprite_y_subpos, y_spd_str)
        ;
        draw.text(Screen_width, table_pos + (slot+2)*BizHawk_font_height, sprite_str, info_color, 0, true)
      end
    end
    
    -- Display slot near the sprite
    local x_screen, y_screen = screen_coordinates(0x100*sprite_x_screen + sprite_x_pos, 0x100*sprite_y_screen + sprite_y_pos, Camera_x, 0)
    draw.text(x_screen, y_screen - 16, fmt("#%d", slot), info_color, 0, true, false, 0.5, 0.5)
    draw.cross(x_screen, y_screen, 3, info_color)
    
    -- Special sprite analysis
    if sprite_status ~= 0 then -- spawned
      special_sprite_AI(slot, sprite_type, x_screen, y_screen, info_color)
    end
    
    -- Hitbox 
    if OPTIONS.display_sprite_hitbox then -- TODO
      local sprite_half_width = sprite_UNKNOWN_0573
      local sprite_half_height = sprite_UNKNOWN_057B
      
      if sprite_status ~= 0 then -- to only print when active
        draw.box(x_screen - sprite_half_width, y_screen - sprite_half_height, x_screen + sprite_half_width, y_screen + sprite_half_height, info_color, info_color - 0x80000000)
      end
    end
    
  end
  
  
  
  -- Full sprite table, for debugging
  if OPTIONS.display_sprite_table_all then
    table_pos = Border_bottom_start + 3*BizHawk_font_height
    
    local sprite_tables = { -- "?" means unknown use
      [01] = {0x04F3, 8, " "}, [02] = {0x04FB, 6, " "}, [03] = {0x0501, 8, "?"}, [04] = {0x0509, 6, "?"}, [05] = {0x050F, 6, "?"}, [06] = {0x0515, 6, "?"},
      [07] = {0x051B, 6, "?"}, [08] = {0x0521, 6, "?"}, [09] = {0x0527, 8, "?"}, [10] = {0x052F, 6, "?"}, [11] = {0x0535, 8, "?"}, [12] = {0x053D, 6, "?"},
      [13] = {0x0543, 8, " "}, [14] = {0x054B, 8, " "}, [15] = {0x0553, 8, " "}, [16] = {0x055B, 8, " "}, [17] = {0x0563, 8, " "}, [18] = {0x056B, 8, " "},
      [19] = {0x0573, 8, "?"}, [20] = {0x057B, 8, "?"}, [21] = {0x0583, 8, " "}, [22] = {0x058B, 8, " "}, [23] = {0x0593, 8, " "}, [24] = {0x059B, 8, " "},
      [25] = {0x05B3, 6, "?"}, [26] = {0x05B9, 6, "?"},
    }
    
    local address_str, knownness_str
    
    for slot = 0, 8 - 1 do
      
      sprite_str = fmt("#%d", slot)
      address_str = "  "
      knownness_str = "  "
      
      for spr_table = 1, #sprite_tables do
        if slot < 6 then
          sprite_str = sprite_str .. fmt("  %02X", u8(sprite_tables[spr_table][1] + slot))
        else
          if sprite_tables[spr_table][2] == 8 then
            sprite_str = sprite_str .. fmt("  %02X", u8(sprite_tables[spr_table][1] + slot))
          else
            sprite_str = sprite_str .. "    "
          end
        end
        address_str = address_str .. fmt(" %03X", sprite_tables[spr_table][1])
        knownness_str = knownness_str .. fmt("   %s", sprite_tables[spr_table][3])
      end
      
      -- Address and knownness labels
      if slot == 0 then
        draw.text(Screen_width, table_pos - BizHawk_font_height, address_str, "white", 0, true)
        draw.text(Screen_width, table_pos - 2*BizHawk_font_height, knownness_str, "white", 0, true)
      end
      
      info_color = sprite_colours[slot%(#sprite_colours) + 1]
      
      draw.text(Screen_width, table_pos + slot*BizHawk_font_height, sprite_str, info_color, 0, true)
    
    end
    
  end
  
end



-- Main function to run inside a level
local function level_mode()
  --if Game_mode ~= DONALD.game_mode_level then return end -- TODO: reactivate maybe?
  
  level_info()
  
  sprites()

  player()
  
  --draw_sprite_spawn_despawn()

end

-- Game info
local function show_game_info()
  if not OPTIONS.display_game_info then return end

  -- Main info
  local RNG = u8(RAM.rng)
  local main_info = string.format("Frame(%02X, %02X) RNG(%02X) Mode(%02X)", Frame_counter, Effective_frame, RNG, Game_mode)
 
  draw.text(Screen_width, 0, main_info, "white", 0, true, false)

  -- Camera position
  if Game_mode == DONALD.game_mode_level then
    
    draw.text(OPTIONS.left_gap, OPTIONS.top_gap - Scale_y*BizHawk_font_height + 8, fmt("Camera (%04X)", Camera_x))
    
  end
  
  -- Timer frame counter
  local timer_framecounter = u8(RAM.timer_framecounter)
  draw.text(OPTIONS.left_gap + 220, OPTIONS.top_gap, fmt("%d", 0x3C - timer_framecounter))
end

-- Movie info
local function show_movie_info()
  if not OPTIONS.display_movie_info then return end

  -- Font
  local y_text = 8
  local x_text = OPTIONS.left_gap
  local width = BizHawk_font_width

  local rec_color = (Readonly or not Movie_active) and "white" or "red"

  -- Read-only or read-write?
  local movie_type = (not Movie_active and "No movie ") or (Readonly and "Movie " or "REC")
  draw.text(x_text, y_text, movie_type, rec_color)
  x_text = x_text + width*(string.len(movie_type) + 1)

  -- Frame count
  local movie_info
  if Readonly and Movie_active then
    movie_info = fmt("%d/%d", Lastframe_emulated, Framecount)
  else
    movie_info = fmt("%d", Lastframe_emulated)
  end
  draw.text(x_text, y_text, movie_info)  -- Shows the latest frame emulated, not the frame being run now
  x_text = x_text + width*string.len(movie_info)

  if Movie_active then
    -- Rerecord count
    local rr_info = fmt(" %d ", Rerecords)
    draw.text(x_text, y_text, rr_info, 0x80FFFFFF)
    x_text = x_text + width*string.len(rr_info)

    -- Lag count
    draw.text(x_text, y_text, Lagcount, "red")
    x_text = x_text + width*string.len(Lagcount)
  end

  -- Time
  local time_str = frame_time(Lastframe_emulated)   -- Shows the latest frame emulated, not the frame being run now
  draw.text(x_text, y_text, fmt(" (%s)", time_str))
end

-- Shows the controller input according to the RAM
local function show_controller_data()
  if not OPTIONS.display_controller_data then return end

  -- Font
  local height = BizHawk_font_height
  local x_pos, y_pos = 2, 8

  -- "Binary format absS UDLR, where:
  -- a = A, b = B, s = Select, S = Start,
  -- U = Up, D = Down, L = Left, R = Right"
  
  draw.text(x_pos - 1, y_pos, "(Controller RAM data)")
  draw.over_text(x_pos, y_pos + height, u8(RAM.controller_curr), "ABsSUDLR", 0x80FFFFFF)
end

-- Mouse info
local function show_mouse_info()
  if not OPTIONS.display_mouse_info then return end
	
	-- Font
	local line_colour = 0x80A9A9A9
  
  -- Get mouse info
  local mouse_input = input.getmouse() -- table keys are X, Y, Left, Middle, Right, XButton1, XButton2, Wheel
  
  -- Interpret mouse info
	local x, y = mouse_input.X + OPTIONS.left_gap, mouse_input.Y + OPTIONS.top_gap
	local x_game, y_game = game_coordinates(mouse_input.X, mouse_input.Y, Camera_x, 0)
	if x_game < 0 then x_game = 0x10000 + x_game end
	if y_game < 0 then y_game = 0x10000 + y_game end
  
	--if mouse_in_window then
		-- Lines
    draw.line(0, y, Screen_width, y, line_colour) -- horizontal
    draw.line(x, 0, x, Screen_height, line_colour) -- vertical
    draw.cross(x, y, 3, "red")
    -- Coordinates
    draw.text(x, y - 2*9, fmt("emu (%d, %d)", x, y), "white", 0, true, false, 0.5)
		draw.text(x, y + 9, fmt("game ($%04X, $%04X)", x_game, y_game), "white", 0, true, false, 0.5)
	--end
end

-- Show the general info about the game or movie
local function show_general_info()
  if not OPTIONS.display_general_info then return end
  
  -- Game info
  show_game_info()
  
  -- Movie info
  show_movie_info()
  
  -- Controller info
  show_controller_data()
  
  -- Mouse info
  show_mouse_info()
  
end

--###########################################################################################
-- CHEATS

-- Declare the group of functions and variables used for the cheats
local Cheat = {}

-- Forbid cheats on script start
Cheat.allow_cheats = false
Cheat.is_cheating = false
Cheat.under_invincibility = false
Cheat.under_2_apples = false
Cheat.under_free_move = false

-- This signals that some cheat is activated, or was some short time ago
function Cheat.is_cheat_active()
  if Cheat.is_cheating then
    local cheat_str = " CHEAT "
    if Cheat.under_free_move then cheat_str = cheat_str .. "- Free movement " end
    if Cheat.under_invincibility then cheat_str = cheat_str .. "- Invincibility " end
    if Cheat.under_2_apples then cheat_str = cheat_str .. "- Always 2 apples " end
    
    draw.text(Buffer_middle_x, OPTIONS.top_gap + 24, cheat_str, "red", "blue", false, false, 0.5)
    Previous.is_cheating = true
  else
    if Previous.is_cheating then
      gui.addmessage("Script applied cheat")
      Previous.is_cheating = false
    end
  end
end

-- Tool to modify address <address> value from <current> to <current + modification>
-- [size] is the optional size in bytes of the address
function Cheat.change_address(address, value_form, size, is_hex, criterion, error_message, success_message)
  if not Cheat.allow_cheats then
    print("Cheats not allowed.")
    return
  end

  size = size or 1
  local max_value = 256^size - 1
  local value = Options_form[value_form] and forms.gettext(Options_form[value_form]) or value_form
  local default_criterion = function(value)
    if type(value) == "string" then
      local number = string.match(value, is_hex and "%x+" or "%d+")
      if not number then return false end

      value = tonumber(number, is_hex and 16 or 10) -- take first number of the string
    else
      value = tonumber(value, is_hex and 16 or 10)
    end

    if not value or value%1 ~= 0 or value < 0 or value > max_value then
      return false
    else
      return value
    end
  end

  local new = default_criterion(value)
  if criterion and new then
    new = criterion(new) and new or false
  end
  if not new then
    print(error_message or "Enter a valid value.")
    return
  end

  local memoryf = (size == 1 and w8) or (size == 2 and w16) or (size == 3 and w24) or error"size is too big"
  memoryf(address, new)
  print(fmt("Cheat: %s set to %d.", success_message, new) or fmt("Cheat: set RAM 0x%X to %d.", address, new))
  Cheat.is_cheating = true
end

-- This function makes Donald's position free
-- While active, press directionals to fly free and A or B to boost him up
function Cheat.free_movement()
  
  -- Make sure to check/uncheck the cheat option in the Menu
  if not Options_form.is_form_closed then
    --forms.setproperty(Options_form.free_movement, "Checked", Cheat.under_free_move)
  end
  
  --[[
  if not Cheat.under_free_move then
    if Previous.under_free_move then w8(WRAM.frozen, 0) end
    return
  end]]

  -- For levels
  
  -- Get position and "speed"
  local x_pos = Camera_x + u8(RAM.player_x_in_screen)
  local y_pos = u8(RAM.player_y)
  --local pixels = (Joypad["A"] and 7) or (Joypad["B"] and 4) or 1  -- how many pixels per frame -- TODO
  local pixels = 1  -- how many pixels per frame

  -- Interpret the movement
  if Joypad["Left"] then x_pos = x_pos - pixels end
  if Joypad["Right"] then x_pos = x_pos + pixels end
  if Joypad["Up"] then y_pos = y_pos - pixels end
  if Joypad["Down"] then y_pos = y_pos + pixels end

  -- Store the values
  w8(RAM.player_x_in_screen, bit.band(x_pos, 0x00FF))
  --w8(RAM.camera_x, floor(x_pos/0x100))
  w8(RAM.player_y, y_pos)
  
  w8(RAM.player_x_speed, 0)
  w8(RAM.player_x_speed_sub, 0)
  w8(RAM.player_y_speed, 0)
  w8(RAM.player_y_speed_sub, 0)
  
  Cheat.is_cheating = true
  Previous.under_free_move = true
end

-- Function that handles all passive cheats (in other words, cheats that must act every frame instead of just one trigger)
function Cheat.passive_cheats()
  if not Cheat.allow_cheats then return end

  Cheat.is_cheating = false
  
  -- Invincibility
  if Cheat.under_invincibility then
    w8(RAM.health, 5)
    Cheat.is_cheating = true
  end

  -- Always 2 apples
  if Cheat.under_2_apples then
    w8(RAM.doube_apple_flag, 5)
    Cheat.is_cheating = true
  end
  
  -- Free movement
  if Cheat.under_free_move then
    Cheat.free_movement()
  end
  
end


--###########################################################################################
-- OPTIONS MENU

-- Declare the group of functions and variables used in the options menu
local Options_form = {}

-- Options menu forms
function Options_form.create_window()

  -- Create form
  local form_width, form_height = 350, 512
  Options_form.form = forms.newform(form_width, form_height, "Donald Land Script Options")
  
  local xform, yform, delta_x, delta_y = 120, 4, 120, 20
  
  --- SHOW/HIDE ---
  
  forms.label(Options_form.form, "Show/hide options", xform, yform, 96, 20)
  xform = 4
  forms.label(Options_form.form, "------------------------------------------------------------------------------------------------------------", xform - 2, yform, form_width, 20)
  
  yform = yform + 1.5*delta_y
  local y_section = yform
  local y_bigger = yform

  -- Player info
  Options_form.player_info = forms.checkbox(Options_form.form, "Player", xform + 20, yform)
  forms.setproperty(Options_form.player_info, "Checked", OPTIONS.display_player_info)
  forms.setproperty(Options_form.player_info, "Width", 55)
  forms.setproperty(Options_form.player_info, "TextAlign", "TopRight")
  forms.setproperty(Options_form.player_info, "CheckAlign", "TopRight")

  yform = yform + delta_y
  Options_form.player_main_info = forms.checkbox(Options_form.form, "Main info", xform, yform)
  forms.setproperty(Options_form.player_main_info, "Checked", OPTIONS.display_player_main_info)
  forms.setproperty(Options_form.player_main_info, "Enabled", OPTIONS.display_player_info)
  
  yform = yform + delta_y
  Options_form.player_hitbox = forms.checkbox(Options_form.form, "Hitbox", xform, yform)
  forms.setproperty(Options_form.player_hitbox, "Checked", OPTIONS.display_player_hitbox)
  forms.setproperty(Options_form.player_hitbox, "Enabled", OPTIONS.display_player_info)

  yform = yform + delta_y
  Options_form.static_camera_region = forms.checkbox(Options_form.form, "Camera region", xform, yform)
  forms.setproperty(Options_form.static_camera_region, "Checked", OPTIONS.display_static_camera_region)
  forms.setproperty(Options_form.static_camera_region, "Enabled", OPTIONS.display_player_info)
  
  yform = yform  + delta_y
  Options_form.debug_player_extra = forms.checkbox(Options_form.form, "Extra info", xform, yform)
  forms.setproperty(Options_form.debug_player_extra, "Checked", OPTIONS.display_debug_player_extra)
  forms.setproperty(Options_form.debug_player_extra, "Enabled", OPTIONS.display_player_info)
  
  forms.addclick(Options_form.player_info, function() -- to enable/disable child options on click
    OPTIONS.display_player_info = forms.ischecked(Options_form.player_info) or false
    
    forms.setproperty(Options_form.player_main_info, "Enabled", OPTIONS.display_player_info)
    forms.setproperty(Options_form.player_hitbox, "Enabled", OPTIONS.display_player_info)
    forms.setproperty(Options_form.static_camera_region, "Enabled", OPTIONS.display_player_info)
    forms.setproperty(Options_form.debug_player_extra, "Enabled", OPTIONS.display_player_info)
  end)
  
  if yform > y_bigger then y_bigger = yform end
  
  -- Level info
  yform = yform + 2*delta_y
  Options_form.level_info = forms.checkbox(Options_form.form, "Level", xform + 20, yform)
  forms.setproperty(Options_form.level_info, "Checked", OPTIONS.display_level_info)
  forms.setproperty(Options_form.level_info, "Width", 55)
  forms.setproperty(Options_form.level_info, "TextAlign", "TopRight")
  forms.setproperty(Options_form.level_info, "CheckAlign", "TopRight")

  yform = yform + delta_y
  Options_form.level_main_info = forms.checkbox(Options_form.form, "Main info", xform, yform)
  forms.setproperty(Options_form.level_main_info, "Checked", OPTIONS.display_level_main_info)
  forms.setproperty(Options_form.level_main_info, "Enabled", OPTIONS.display_level_info)

  yform = yform + delta_y
  Options_form.tile_info = forms.checkbox(Options_form.form, "Tiles", xform, yform)
  forms.setproperty(Options_form.tile_info, "Checked", OPTIONS.display_tile_info)
  forms.setproperty(Options_form.tile_info, "Enabled", OPTIONS.display_level_info)

  yform = yform + delta_y
  Options_form.screen_info = forms.checkbox(Options_form.form, "Screen info", xform, yform)
  forms.setproperty(Options_form.screen_info, "Checked", OPTIONS.display_screen_info)
  forms.setproperty(Options_form.screen_info, "Enabled", OPTIONS.display_level_info)

  yform = yform + delta_y
  Options_form.sprite_data = forms.checkbox(Options_form.form, "Sprite data", xform, yform)
  forms.setproperty(Options_form.sprite_data, "Checked", OPTIONS.display_sprite_data)
  forms.setproperty(Options_form.sprite_data, "Enabled", OPTIONS.display_level_info)
  
  -- to enable/disable child options on click
  forms.addclick(Options_form.level_info, function()
    OPTIONS.display_level_info = forms.ischecked(Options_form.level_info) or false
    
    forms.setproperty(Options_form.level_main_info, "Enabled", OPTIONS.display_level_info)
    forms.setproperty(Options_form.tile_info, "Enabled", OPTIONS.display_level_info)
    forms.setproperty(Options_form.screen_info, "Enabled", OPTIONS.display_level_info)
    forms.setproperty(Options_form.sprite_data, "Enabled", OPTIONS.display_level_info)
  end)
  
  if yform > y_bigger then y_bigger = yform end
  
  -- Sprite info
  xform, yform = xform + delta_x, y_section
  Options_form.sprite_info = forms.checkbox(Options_form.form, "Sprites", xform + 20, yform)
  forms.setproperty(Options_form.sprite_info, "Checked", OPTIONS.display_sprite_info)
  forms.setproperty(Options_form.sprite_info, "Width", 60)
  forms.setproperty(Options_form.sprite_info, "TextAlign", "TopRight")
  forms.setproperty(Options_form.sprite_info, "CheckAlign", "TopRight")

  yform = yform + delta_y
  Options_form.sprite_table = forms.checkbox(Options_form.form, "Main table", xform, yform)
  forms.setproperty(Options_form.sprite_table, "Checked", OPTIONS.display_sprite_table)
  forms.setproperty(Options_form.sprite_table, "Enabled", OPTIONS.display_sprite_info)

  yform = yform + delta_y
  Options_form.sprite_hitbox = forms.checkbox(Options_form.form, "Hitbox", xform, yform)
  forms.setproperty(Options_form.sprite_hitbox, "Checked", OPTIONS.display_sprite_hitbox)
  forms.setproperty(Options_form.sprite_hitbox, "Enabled", OPTIONS.display_sprite_info)

  yform = yform + delta_y
  Options_form.sprite_special_info = forms.checkbox(Options_form.form, "Special info", xform, yform)
  forms.setproperty(Options_form.sprite_special_info, "Checked", OPTIONS.display_sprite_special_info)
  forms.setproperty(Options_form.sprite_special_info, "Enabled", OPTIONS.display_sprite_info)

  yform = yform + delta_y
  Options_form.sprite_despawn_lines = forms.checkbox(Options_form.form, "Despawn lines", xform, yform)
  forms.setproperty(Options_form.sprite_despawn_lines, "Checked", OPTIONS.display_sprite_despawn_lines)
  forms.setproperty(Options_form.sprite_despawn_lines, "Enabled", OPTIONS.display_sprite_info)

  yform = yform + delta_y
  Options_form.sprite_table_all = forms.checkbox(Options_form.form, "All tables", xform, yform)
  forms.setproperty(Options_form.sprite_table_all, "Checked", OPTIONS.display_sprite_table_all)
  forms.setproperty(Options_form.sprite_table_all, "Enabled", OPTIONS.display_sprite_info)
  -- to resize the emu screen to fit all the tables
  forms.addclick(Options_form.sprite_table_all, function()
    OPTIONS.display_sprite_table_all = forms.ischecked(Options_form.sprite_table_all) or false
    if OPTIONS.display_sprite_table_all then
      if OPTIONS.bottom_gap < 110 then -- 110 fits well
        client.SetGameExtraPadding(OPTIONS.left_gap, OPTIONS.top_gap, OPTIONS.right_gap, 110)
      end
    else
      if Screen_height - Border_bottom_start ~= OPTIONS.bottom_gap then
        client.SetGameExtraPadding(OPTIONS.left_gap, OPTIONS.top_gap, OPTIONS.right_gap, OPTIONS.bottom_gap)
      end
    end
  end)
  
  -- to enable/disable child options on click
  forms.addclick(Options_form.sprite_info, function()
    OPTIONS.display_sprite_info = forms.ischecked(Options_form.sprite_info) or false
    
    forms.setproperty(Options_form.sprite_table, "Enabled", OPTIONS.display_sprite_info)
    forms.setproperty(Options_form.sprite_hitbox, "Enabled", OPTIONS.display_sprite_info)
    forms.setproperty(Options_form.sprite_special_info, "Enabled", OPTIONS.display_sprite_info)
    forms.setproperty(Options_form.sprite_despawn_lines, "Enabled", OPTIONS.display_sprite_info)
    forms.setproperty(Options_form.sprite_table_all, "Enabled", OPTIONS.display_sprite_table_all)
  end)
  
  if yform > y_bigger then y_bigger = yform end
  
  -- General info
  yform = yform + 2*delta_y
  Options_form.general_info = forms.checkbox(Options_form.form, "General", xform + 10, yform)
  forms.setproperty(Options_form.general_info, "Checked", OPTIONS.display_general_info)
  forms.setproperty(Options_form.general_info, "Width", 70)
  forms.setproperty(Options_form.general_info, "TextAlign", "TopRight")
  forms.setproperty(Options_form.general_info, "CheckAlign", "TopRight")

  yform = yform + delta_y
  Options_form.game_info = forms.checkbox(Options_form.form, "Game info", xform, yform)
  forms.setproperty(Options_form.game_info, "Checked", OPTIONS.display_game_info)
  forms.setproperty(Options_form.game_info, "Enabled", OPTIONS.display_general_info)

  yform = yform + delta_y
  Options_form.movie_info = forms.checkbox(Options_form.form, "Movie info", xform, yform)
  forms.setproperty(Options_form.movie_info, "Checked", OPTIONS.display_movie_info)
  forms.setproperty(Options_form.movie_info, "Enabled", OPTIONS.display_general_info)

  yform = yform + delta_y
  Options_form.controller_data = forms.checkbox(Options_form.form, "Controller data", xform, yform)
  forms.setproperty(Options_form.controller_data, "Checked", OPTIONS.display_controller_data)
  forms.setproperty(Options_form.controller_data, "Enabled", OPTIONS.display_general_info)

  yform = yform + delta_y
  Options_form.mouse_info = forms.checkbox(Options_form.form, "Mouse info", xform, yform)
  forms.setproperty(Options_form.mouse_info, "Checked", OPTIONS.display_mouse_info)
  forms.setproperty(Options_form.mouse_info, "Enabled", OPTIONS.display_general_info)
  
  -- to enable/disable child options on click
  forms.addclick(Options_form.general_info, function()
    OPTIONS.display_general_info = forms.ischecked(Options_form.general_info) or false
    
    forms.setproperty(Options_form.game_info, "Enabled", OPTIONS.display_general_info)
    forms.setproperty(Options_form.movie_info, "Enabled", OPTIONS.display_general_info)
    forms.setproperty(Options_form.controller_data, "Enabled", OPTIONS.display_general_info)
    forms.setproperty(Options_form.mouse_info, "Enabled", OPTIONS.display_general_info)
  end)
  
  if yform > y_bigger then y_bigger = yform end
  
  --- CHEATS ---
  
  y_section = y_bigger + 2*delta_y
  xform, yform = 4, y_section
  Options_form.allow_cheats = forms.checkbox(Options_form.form, "Cheats", xform + 130, yform)
  forms.setproperty(Options_form.allow_cheats, "Checked", Cheat.allow_cheats)
  forms.setproperty(Options_form.allow_cheats, "TextAlign", "TopRight")
  forms.setproperty(Options_form.allow_cheats, "CheckAlign", "TopRight")
  forms.setproperty(Options_form.allow_cheats, "AutoSize", true)
  forms.label(Options_form.form, "----------------------------------------------------------      --------------------------------------------", xform - 2, yform, form_width, 20)
  
  -- Invincibility cheat
  yform = yform + 1.5*delta_y
  Options_form.cheat_invincibility = forms.checkbox(Options_form.form, "Invincibility", xform, yform)
  forms.setproperty(Options_form.cheat_invincibility, "Checked", Cheat.under_invincibility)
  forms.setproperty(Options_form.cheat_invincibility, "Enabled", Cheat.allow_cheats)
  
  -- 2 apples cheat
  yform = yform + delta_y
  Options_form.cheat_apples = forms.checkbox(Options_form.form, "Always 2 apples", xform, yform)
  forms.setproperty(Options_form.cheat_apples, "Checked", Cheat.under_2_apples)
  forms.setproperty(Options_form.cheat_apples, "Enabled", Cheat.allow_cheats)
  
  -- Lives cheat
  yform = yform + 1.2*delta_y
  --                                                    Cheat.change_address(address, value_form, size, is_hex, criterion, error_message, success_message)
  Options_form.cheat_lives = forms.button(Options_form.form, "Lives", function() Cheat.change_address(RAM.lives, tonumber(forms.gettext(Options_form.lives_number)), 1, false,
    nil, "Enter an integer between 0 and 255.", "lives")
  end, xform, yform, 43, 24)
  forms.setproperty(Options_form.cheat_lives, "Enabled", Cheat.allow_cheats)
  
  xform = xform + 45
  Options_form.lives_number = forms.textbox(Options_form.form, "", 24, 16, "UNSIGNED", xform, yform + 2, false, false)
  forms.setproperty(Options_form.lives_number, "Enabled", Cheat.allow_cheats)
  
  -- Level select cheat
  xform = 4
  yform = yform + 1.5*delta_y
  Options_form.cheat_level_select = forms.button(Options_form.form, "Level", function() w8(RAM.level_index, forms.getproperty(Options_form.level_number, "SelectedIndex") + 1) --Cheat.change_address(RAM.level_index, tonumber(forms.getproperty(Options_form.level_number, "SelectedIndex") + 1), 1, true,
    --nil, "WRONG LEVEL INDEX, try again!", "level")
  end, xform, yform, 60, 24)
  forms.setproperty(Options_form.cheat_level_select, "Enabled", Cheat.allow_cheats)

  xform = xform + 62
  Options_form.level_number = forms.dropdown(Options_form.form, DONALD.level_names, xform, yform + 1, 150, 10)
  forms.setproperty(Options_form.level_number, "Enabled", Cheat.allow_cheats)
  
  -- Free movement cheat
  xform = 4
  yform = yform + 1.2*delta_y
  Options_form.free_movement = forms.checkbox(Options_form.form, "Free movement", xform, yform)
  forms.setproperty(Options_form.free_movement, "Checked", Cheat.under_free_move)
  forms.setproperty(Options_form.free_movement, "Enabled", Cheat.allow_cheats)
  
  -- to enable/disable child options on click
  forms.addclick(Options_form.allow_cheats, function()
    Cheat.allow_cheats = forms.ischecked(Options_form.allow_cheats) or false
    
    forms.setproperty(Options_form.cheat_invincibility, "Enabled", Cheat.allow_cheats)
    
    forms.setproperty(Options_form.cheat_apples, "Enabled", Cheat.allow_cheats)
    
    forms.setproperty(Options_form.cheat_lives, "Enabled", Cheat.allow_cheats)
    forms.setproperty(Options_form.lives_number, "Enabled", Cheat.allow_cheats)
    
    forms.setproperty(Options_form.cheat_level_select, "Enabled", Cheat.allow_cheats)
    forms.setproperty(Options_form.level_number, "Enabled", Cheat.allow_cheats)
    
    forms.setproperty(Options_form.free_movement, "Enabled", Cheat.allow_cheats)
  end)
  
end

-- Update the options based on the state of the controls in the options menu
function Options_form.evaluate_form()
  --- SHOW/HIDE ---
  -- Player info
  OPTIONS.display_player_info = forms.ischecked(Options_form.player_info) or false
  OPTIONS.display_player_main_info = forms.ischecked(Options_form.player_main_info) or false
  OPTIONS.display_player_hitbox = forms.ischecked(Options_form.player_hitbox) or false
  OPTIONS.display_static_camera_region = forms.ischecked(Options_form.static_camera_region) or false
  OPTIONS.display_debug_player_extra = forms.ischecked(Options_form.debug_player_extra) or false
  -- Level info
  OPTIONS.display_level_info = forms.ischecked(Options_form.level_info) or false
  OPTIONS.display_level_main_info = forms.ischecked(Options_form.level_main_info) or false
  OPTIONS.display_tile_info = forms.ischecked(Options_form.tile_info) or false
  OPTIONS.display_screen_info = forms.ischecked(Options_form.screen_info) or false
  OPTIONS.display_sprite_data = forms.ischecked(Options_form.sprite_data) or false
  -- Sprite info
  OPTIONS.display_sprite_info = forms.ischecked(Options_form.sprite_info) or false
  OPTIONS.display_sprite_table = forms.ischecked(Options_form.sprite_table) or false
  OPTIONS.display_sprite_hitbox = forms.ischecked(Options_form.sprite_hitbox) or false
  OPTIONS.display_sprite_special_info = forms.ischecked(Options_form.sprite_special_info) or false
  OPTIONS.display_sprite_despawn_lines = forms.ischecked(Options_form.sprite_despawn_lines) or false
  OPTIONS.display_sprite_table_all = forms.ischecked(Options_form.sprite_table_all) or false
  -- General info
  OPTIONS.display_general_info = forms.ischecked(Options_form.general_info) or false
  OPTIONS.display_game_info = forms.ischecked(Options_form.game_info) or false
  OPTIONS.display_movie_info = forms.ischecked(Options_form.movie_info) or false
  OPTIONS.display_controller_data = forms.ischecked(Options_form.controller_data) or false
  OPTIONS.display_mouse_info = forms.ischecked(Options_form.mouse_info) or false
  
  --- CHEATS ---
  Cheat.allow_cheats = forms.ischecked(Options_form.allow_cheats) or false
  Cheat.under_invincibility = forms.ischecked(Options_form.cheat_invincibility) or false
  Cheat.under_2_apples = forms.ischecked(Options_form.cheat_apples) or false
  Cheat.under_free_move = forms.ischecked(Options_form.free_movement) or false
end


--###########################################################################################
-- MAIN

-- Create lateral gaps
client.SetGameExtraPadding(OPTIONS.left_gap, OPTIONS.top_gap, OPTIONS.right_gap, OPTIONS.bottom_gap)

-- Create the option menu forms
forms.destroyall() -- to prevent more than one forms (usually happens when script has an error)
Options_form.create_window()
Options_form.is_form_closed = false

-- Actions to do when script is closed
event.onexit(function()
  
  forms.destroy(Options_form.form)
  
  gui.clearImageCache()
  
	client.SetGameExtraPadding(0, 0, 0, 0)
  
  print("Finishing Donald Land script.")
end)

print("\nDonald Land script loaded successfully.\n")

-- Main loop
while true do
 
  Options_form.is_form_closed = forms.gettext(Options_form.form) == ""
  if not Options_form.is_form_closed then Options_form.evaluate_form() end 
 
  -- Initial values, don't make drawings here
  bizhawk_status()
  bizhawk_screen_info()
  scan_donald()
  
  -- Drawings  
  if Is_lagged then
    gui.drawText(Buffer_middle_x - 20, 24, "LAG ", "red", "blue")
    gui.clearImageCache() -- unload unused images, "inside lag" to no run every frame
  end
  level_mode()
  show_general_info()
  
  -- Cheats
  if Cheat.allow_cheats then
    Cheat.is_cheat_active()
    -- Warning
    local cheat_str = "Cheats allowed!" .. (Movie_active and " Disable it while recording movies" or "")
    draw.rectangle(Buffer_middle_x - string.len(cheat_str)*BizHawk_font_width/2, Border_bottom_start - 2, string.len(cheat_str)*BizHawk_font_width, BizHawk_font_height, 0x800000FF, 0x800000FF)
    draw.text(Buffer_middle_x, Border_bottom_start, cheat_str, "red", 0, false, false, 0.5, 1.0)
    -- Passive cheats
    Cheat.passive_cheats()
  end
  --Cheat.is_cheating = false
  
  -- Get player input
  Joypad = joypad.get(1)
  
  
  
  -- Checks if options form exits and create a button in case it doesn't
  --[[
  if Options_form.is_form_closed then
    if User_input.mouse_inwindow then
      draw_rectangle(Buffer_middle_x - 18, OPTIONS.top_gap + 7, 34, 14, "black", COLOUR.weak2)
      draw_line(Buffer_middle_x - 18, OPTIONS.top_gap + 7, Buffer_middle_x - 18, OPTIONS.top_gap + 21, COLOUR.weak)
      draw_line(Buffer_middle_x - 17, OPTIONS.top_gap + 7, Buffer_middle_x + 16, OPTIONS.top_gap + 7, COLOUR.weak)
      
      gui.drawText(Buffer_middle_x, OPTIONS.top_gap + 6, "Menu", COLOUR.text, 0, 14, "Consolas", "regular", "center")
    end
  end]]
  
  
  -- DEBUG  
  --print(fmt("Options_form.level_number: gettext = %s, SelectedIndex = %d, SelectedItem = %s",
  --forms.gettext(Options_form.level_number), forms.getproperty(Options_form.level_number, "SelectedIndex"), forms.getproperty(Options_form.level_number, "SelectedItem")))
  
  
  --[[
  local y_pos = OPTIONS.top_gap + 30
  gui.drawText(0, y_pos, fmt("Left_gap:%d ", OPTIONS.left_gap), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Right_gap:%d ", OPTIONS.right_gap), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Top_gap:%d ", OPTIONS.top_gap), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Bottom_gap:%d ", OPTIONS.bottom_gap), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Screen_width:%d ", Screen_width), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Screen_height:%d ", Screen_height), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Buffer_width:%d ", Buffer_width), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Buffer_height:%d ", Buffer_height), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Buffer_middle_x:%d ", Buffer_middle_x), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Buffer_middle_y:%d ", Buffer_middle_y), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Border_right_start:%d ", Border_right_start), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Border_bottom_start:%d ", Border_bottom_start), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Scale_x:%d ", Scale_x), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("Scale_y:%d ", Scale_y), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("client.borderwidth:%d ", client.borderwidth()), "white", 0, 9); y_pos = y_pos + 11
  gui.drawText(0, y_pos, fmt("client.borderheight:%d ", client.borderheight()), "white", 0, 9); y_pos = y_pos + 11
  ]]
  
  --gui.drawText(Buffer_middle_x, Buffer_middle_y, "TEST MIDDLE", "red", 0, 12)
  
  
  -- (End of drawings)

  -- Lag-flag is accounted correctly only inside this loop
  --Is_lagged = emu.lagged() REMOVE?
  
  emu.frameadvance()
end
