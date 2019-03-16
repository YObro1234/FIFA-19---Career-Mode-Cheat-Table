--- This script will make everyone in your career retiring. So in theory, when you get into the next season everyone will be a regen. Make a backup save before you apply this just to be safe. Join this discord for help: https://discord.gg/QFyHUxe
--- It may take a few mins. Cheat Engine will stop responding and it's normal behaviour. Wait until you get 'Done' message.


--- HOW TO USE:
--- https://i.imgur.com/xZMqzTc.gifv
--- 1. Open Cheat table as usuall and enter your career.
--- 2. In Cheat Engine click on "Memory View" button.
--- 3. Press "CTRL + L" to open lua engine
--- 4. Then press "CTRL + O" and open this script
--- 5. Click on 'Execute' button to execute script and wait for 'done' message box. It may take a few minutes, and the cheat engine will stop responding.

--- AUTHOR: FIFER

require 'lua/GUI/forms/playerseditorform/consts';

local comp_desc = get_components_description_player_edit()

-- players table
local sizeOf = 100 -- Size of one record in players database table (0x64)

-- iterate over all players in 'players' database table
local i = 0
local current_playerid = 0
while true do
    local playerid_record = ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['PLAYERID'])
    local current_playerid = bAnd(bShr(readInteger(string.format('[%s]+%X', 'firstPlayerDataPtr', playerid_record.getOffset(0)+(i*sizeOf))), playerid_record.Binary.Startbit), (bShl(1, playerid_record.Binary.Size) - 1))
    if current_playerid == 0 then
        break
    end

    writeQword('playerDataPtr', readPointer('firstPlayerDataPtr') + i*sizeOf)
    ADDR_LIST.getMemoryRecordByID(comp_desc['IsRetiringCB']['id']).Value = 1

    i = i + 1
end

showMessage("Done. All players should now be retiring.")