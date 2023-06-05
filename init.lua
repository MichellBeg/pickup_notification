function OnPlayerSpawned( player_entity )
    local function on_item_pickup( entity_item, entity_who_picked )
        local item_comp = EntityGetFirstComponent( entity_item, "ItemComponent" )
        local item_name = ComponentGetValue( item_comp, "item_name" )
        
        if string.match(item_name, "wand") or string.match(item_name, "flask") then
            local x, y = EntityGetTransform( entity_who_picked )
            GamePrintImportant( "アイテムを拾いました: " .. item_name, "" )
            -- ここで他の表示方法やエフェクトを追加できます
        end
    end

    local lua_comp = EntityAddComponent( player_entity, "LuaComponent", { 
        script_source_file="data/scripts/perks/pickup_notification.lua",
        execute_on_added="1",
        execute_every_n_frame="-1",
        remove_after_executed="0"
    } )
    ComponentAddTag( lua_comp, "enabled_in_mods" )
    ComponentSetValue( lua_comp, "on_item_pickup", "on_item_pickup" )
end
