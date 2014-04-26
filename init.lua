--bloc de pierre contenant du minetenium
minetest.register_node("minetenium:stone_with_minetenium", {
	description = "minetenium ore",
	tiles = {"stone_with_minetenium.png"},
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 5,
	groups = {cracky=3},
	drop = 'minetenium:minetenium_lump',
	--sounds = default.node_sound_stone_defaults(),
})

--lump de minetenium
minetest.register_craftitem("minetenium:minetenium_lump", {
	description = "Minetenium Lump",
	inventory_image = "minetenium_lump.png",
	
})

--lingot de minetenium ( nocif si dans l'inventaire )
minetest.register_craftitem("minetenium:minetenium_ingot", {
	description = "Minetenium Ingot",
	inventory_image = "minetenium_ingot.png",
})
minetest.register_craft({
	type = "cooking",
	output = "minetenium:minetenium_ingot",
	recipe = "minetenium:minetenium_lump",
})

--le lingot de minetenium est un combustible très puissant
minetest.register_craft({
	type = "fuel",
	recipe = "minetenium:minetenium_ingot",
	burntime = 600,
})

--bloc de minetenium ( nocif si dans l'inventaire et si le joueur s'en approche )
minetest.register_craft({
	output = 'minetenium:mineteniumblock',
	recipe = {
		{'minetenium:minetenium_ingot', 'minetenium:minetenium_ingot'},
		{'minetenium:minetenium_ingot', 'minetenium:minetenium_ingot'},	
	}
})
minetest.register_node("minetenium:mineteniumblock", {
	description = "Minetenium Block",
	tiles = {"mineteniumblock.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 15,
	is_ground_content = false,
	groups = {crumbly=3, falling_node=1, sand=1},
	--sounds = default.node_sound_sand_defaults(),
})
minetest.register_abm(									
    {nodenames = {"minetenium:mineteniumblock"},							
    interval = 1.0,									
    chance = 1,										
    action = function(pos, node, active_object_count, active_object_count_wider)
    	
    local objs = minetest.env:get_objects_inside_radius(pos, 5)				
        for k, obj in pairs(objs) do							
        obj:set_hp(obj:get_hp()-0.2)     					
    end
end,
     
})

--le block de minetenium est un gigacombustible !
minetest.register_craft({
	type = "fuel",
	recipe = "minetenium:mineteniumblock",
	burntime = 2400,
})


--***********************************************************************


--bloc de minetenium : craft inverse
minetest.register_craft({
	output = 'minetenium:minetenium_ingot 4',
	recipe = {
		{'minetenium:mineteniumblock'},	
	}
})


--generation du minetenium sur la map
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minetenium:stone_with_minetenium",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -15,
	height_max     = 2,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minetenium:stone_with_minetenium",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -63,
	height_max     = -16,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minetenium:stone_with_minetenium",
	wherein        = "default:stone",
	clust_scarcity = 7*7*7,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -64,
	flags          = "absheight",
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minetenium:stone_with_minetenium",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	height_min     = -31000,
	height_max     = -64,
	flags          = "absheight",
})

