
------------MOD CODE -------------------------
local blind_list = {
	--mini-boss blinds
    "crowd",
    "fence",
	--"burn", 
    "gein",
	"shackled",
    "pride",
	
	--boss blinds
	--"regular",
	--"beheaded", --potluck

	--showdown blinds
	--"tumble",
}

if not MysticMod then
	MysticMod = {}
end

loc_colour('red')
G.ARGS.LOC_COLOURS['pink'] = HEX('e621c7')
G.ARGS.LOC_COLOURS['mythic'] = HEX('e38109')--{HEX('fda200'), HEX('8a71e1'), HEX('00b8d4'), HEX('937c1e')}

pogoB_config = SMODS.current_mod.config

-- Lovely Patch Target, toggles being able to change gameset config. Here for mod support
pogoB_config.gameset_toggle = true

local mod_path = SMODS.current_mod.path
SMODS.Atlas({key = 'pogo_chips', path = 'pogoblinds.png', px = 34, py = 34, frames = 21, atlas_table = 'ANIMATION_ATLAS'})

-- basically taken from Mystblinds, which was basically taken from 5CEBalatro lol
for k, v in ipairs(blind_list) do
	if NFS == nil then
		sendErrorMessage("[HalfAHeart] FUCK: " .. v)
	end
    local blind = NFS.load(mod_path .. "blinds/" .. v .. ".lua")()
    -- don't fuck up the mod
    if not blind then
        sendErrorMessage("[HalfAHeart] Cannot find blind with shorthand: " .. v)
    else
        blind.key = v
        blind.discovered = false 
        local blind_obj = SMODS.Blind(blind)
        for k_, v_ in pairs(blind) do
            if type(v_) == 'function' then
                blind_obj[k_] = blind[k_]
            end
        end
    end
end

function get_new_small()
    G.GAME.perscribed_small = G.GAME.perscribed_small or {
    }
	if G.GAME.starting_params.alwaysShowdown then
		G.GAME.round_resets.blind_choices.Boss = "bl_pogoB_tumble"
	end
    if G.GAME.perscribed_small and G.GAME.perscribed_small[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_small[G.GAME.round_resets.ante] 
        G.GAME.perscribed_small[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_SMALL then return G.FORCE_SMALL end

    local eligible_bosses = {bl_small = true}
    for k, v in pairs(G.P_BLINDS) do
        if not v.small then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.small.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    if G.GAME.modifiers.ortalab_only then
        for k, v in pairs(eligible_bosses) do
            if v and not G.P_BLINDS[k].mod or G.P_BLINDS[k].mod.id ~= 'ortalab' then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    
    return boss
end

function get_new_big()
    G.GAME.perscribed_big = G.GAME.perscribed_big or {
    }
    if G.GAME.perscribed_big and G.GAME.perscribed_big[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_big[G.GAME.round_resets.ante] 
        G.GAME.perscribed_big[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_BIG then return G.FORCE_BIG end

	local eligible_bosses = {}
	if G.GAME.starting_params and G.GAME.starting_params.allow_biggerBlinds == true then
		for k, v in pairs(G.P_BLINDS) do
			if not v.big then
				-- don't add
			elseif v.in_pool and type(v.in_pool) == 'function' then
				local res, options = v:in_pool()
				eligible_bosses[k] = res and true or nil
			elseif v.big.min <= math.max(1, G.GAME.round_resets.ante) then
				eligible_bosses[k] = true
			end
		end
	else
		eligible_bosses = { bl_big = true }
	end

    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    if G.GAME.modifiers.ortalab_only then
        for k, v in pairs(eligible_bosses) do
            if v and not G.P_BLINDS[k].mod or G.P_BLINDS[k].mod.id ~= 'ortalab' then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    
    return boss
end

object_registry = {}
object_buffer = {}

local files = NFS.getDirectoryItems(mod_path .. "lib")
for _, file in ipairs(files) do
	print("[HalfAHeart] Loading library file " .. file)
	local f, err = SMODS.load_file("lib/" .. file)
	if err then
		error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
	end
	f()
end

local function process_items(f, mod)
	local ret = f()
	if ret and not ret.disabled then
		if ret.init then
			ret:init()
		end
		if ret.items then
			for _, item in ipairs(ret.items) do
				if mod then
					-- make the mod use its own prefixes
					item.prefix_config = {
						key = false,
						atlas = false,
					}
					item.mod_path = mod.path
					if item.key then
						if item.object_type and SMODS[item.object_type].class_prefix then
							item.key = SMODS[item.object_type].class_prefix .. "_" .. mod.prefix .. "_" .. item.key
						elseif string.find(item.key, mod.prefix .. "_") ~= 1 then
							item.key = mod.prefix .. "_" .. item.key
						end
					end
					if item.atlas and string.find(item.atlas, mod.prefix .. "_") ~= 1 then
						item.atlas = mod.prefix .. "_" .. item.atlas
					end
					-- this will also display the mod's own badge
					if not item.dependencies then
						item.dependencies = {}
					end
					item.dependencies[#item.dependencies + 1] = mod.id
				end
				if item.init then
					item:init()
				end
				--[[if not item.gameset_config then
					-- by default, disable on modest
					item.gameset_config = {
						modest = {disabled = true},
					}
				end--]]
				if not object_registry[item.object_type] then
					object_registry[item.object_type] = {}
				end
				if not item.take_ownership then
					if not item.order then
						item.order = 0
					end
					if ret.order then
						item.order = item.order + ret.order
					end
					if mod then
						item.order = item.order + 1e9
					end
					item.cry_order = item.order
					if not object_buffer[item.object_type] then
						object_buffer[item.object_type] = {}
					end
					object_buffer[item.object_type][#object_buffer[item.object_type] + 1] = item
				else
					item.key = SMODS[item.object_type].class_prefix .. "_" .. item.key
					SMODS[item.object_type].obj_table[item.key].mod = SMODS.Mods.pogo_chips
					for k, v in pairs(item) do
						if k ~= "key" then
							SMODS[item.object_type].obj_table[item.key][k] = v
							SMODS.Sprite:new('j_'..v,mod.path,v..'.png',71,95,'asset_atli'):register()
						end
					end
				end
				object_registry[item.object_type][item.key] = item
				--SMODS.Sprite:new('j_'..item,mod.path,item..'.png',71,95,'asset_atli'):register()
			end
		end
	end
end

local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[HalfAHeart] Loading file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
	end
	process_items(f)
end

-- Register all items
for set, objs in pairs(object_buffer) do
	table.sort(objs, function(a, b)
		return a.order < b.order
	end)
	for i = 1, #objs do
		if objs[i].post_process and type(objs[i].post_process) == "function" then
			objs[i]:post_process()
		end
		--post_process(objs[i])
		SMODS[set](objs[i])
	end
end
local inj = SMODS.injectItems
function SMODS.injectItems(...)
	inj(...)
	update_obj_registry()
	for _, t in ipairs({
		G.P_CENTERS,
		G.P_BLINDS,
		G.P_TAGS,
		G.P_SEALS,
	}) do
		for k, v in pairs(t) do
			if v and G.PROFILES[G.SETTINGS.profile].all_unlocked then
				v.alerted = true
				v.discovered = true
				v.unlocked = true
			end
		end
	end
end
function update_obj_registry(m, force_enable)
	if not m then
		m = SMODS.GameObject
		if m.subclasses then
			for k, v in pairs(m.subclasses) do
				update_obj_registry(v, force_enable)
			end
		end
	end
	if m.obj_table then
		for k, v in pairs(m.obj_table) do
			if v.mod and (v.mod.id == "pogo_chips") then
				local en = force_enable or MysticMod.enabled(k)
				if en == true then
					if v.cry_disabled then
						v:enable()
					end
				else
					if not v.cry_disabled then
						v:_disable(en)
					end
				end
			end
		end
	end
end


local hah_ConfigTab = function()
	pogoB_nodes = {
		{
			n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = localize("hah_set_enable_features"),
							colours = { G.C.WHITE },
							shadow = true,
							scale = 0.4,
						}),
					},
				},
			},
		},
	}
	left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }
	pogoB_nodes[#pogoB_nodes + 1] = config
	--Allow the player to disable the reworks of vanilla features (only jokers as of writing)
	pogoB_nodes[#pogoB_nodes + 1] = create_toggle({
		label = localize("pogoB_vanilla_rework"),
		active_colour = HEX("1c5c23"),
		ref_table = pogoB_config,
		ref_value = "vanilla_rework",
	})
	--pogoB_nodes[#pogoB_nodes + 1] = create_toggle({
	--	label = localize("pogoB_allow_blackJack"),
	--	active_colour = HEX("1c5c23"),
	--	ref_table = pogoB_config,
	--	ref_value = "allow_blackJack",
	--})
	--pogoB_nodes[#pogoB_nodes + 1] = create_toggle({
	--	label = localize("pogoB_allow_naturalAggressive"),
	--	active_colour = HEX("1c5c23"),
	--	ref_table = pogoB_config,
	--	ref_value = "allow_naturalAggressive",
	--})
	--pogoB_nodes[#pogoB_nodes + 1] = UIBox_button({
	--	colour = G.C.pogoB_ALTGREENGRADIENT,
	--	button = "reset_gameset_config",
	--	label = { localize("b_reset_gameset_" .. (G.PROFILES[G.SETTINGS.profile].pogoB_gameset or "mainline")) },
	--	minw = 5,
	--})
	return {
		n = G.UIT.ROOT,
		config = {
			emboss = 0.05,
			minh = 6,
			r = 0.1,
			minw = 10,
			align = "cm",
			padding = 0.2,
			colour = G.C.BLACK,
		},
		nodes = pogoB_nodes,
	}
end

SMODS.current_mod.config_tab = hah_ConfigTab

----------------------------------------------
------------MOD CODE END----------------------