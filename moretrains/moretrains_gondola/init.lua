local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end


advtrains.register_wagon("moretrains_wagon_gondola", {
	mesh="moretrains_gondola.b3d",
	textures = {"moretrains_wagon_gondola.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.784,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*3,
	},
}, S("Gondola wagon (empty)"), "moretrains_wagon_gondola_inv.png")


advtrains.register_wagon("moretrains_wagon_gondola_mese", {
	mesh="moretrains_gondola_mese.b3d",
	textures = {"moretrains_wagon_gondola.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.784,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*3,
	},
}, S("Gondola wagon with mese"), "moretrains_wagon_gondola_mese_inv.png")

advtrains.register_wagon("moretrains_wagon_gondola_cobble", {
	mesh="moretrains_gondola_mese.b3d",
	textures = {"moretrains_wagon_gondola_cobble.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.784,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*3,
	},
}, S("Gondola wagon with cobble stone"), "moretrains_wagon_gondola_cobble_inv.png")

advtrains.register_wagon("moretrains_wagon_gondola_toiletpaper", {
	mesh="moretrains_gondola_toiletpaper.b3d",
	textures = {"moretrains_wagon_gondola.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.784,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*3,
	},
}, S("Gondola wagon with toilet paper"), "moretrains_wagon_gondola_toiletpaper_inv.png")

advtrains.register_wagon("moretrains_wagon_gondola_rails", {
	mesh="moretrains_gondola_rails.b3d",
	textures = {"moretrains_wagon_gondola.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.784,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory_formspec = function(self, pname, invname)
		return "size[8,11]"..
			"list["..invname..";box;0,0;8,3;]"..
			"list[current_player;main;0,5;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*3,
	},
}, S("Gondola wagon with rails"), "moretrains_wagon_gondola_rails_inv.png")


minetest.register_craft({
	output = 'advtrains:moretrains_wagon_gondola',
	recipe = {
		{'group:wood', 'default:chest', 'group:wood'},
		{'advtrains:wheel', '', 'advtrains:wheel'},
	},
})

minetest.register_craft({
	output = "advtrains:moretrains_wagon_gondola_mese",
	type = "shapeless",
	recipe = {"advtrains:moretrains_wagon_gondola", "default:mese", "default:mese"},
})

minetest.register_craft({
	output = 'advtrains:moretrains_wagon_gondola_toiletpaper',
	recipe = {
		{'default:paper', 'default:paper', 'default:paper'},
		{'default:paper', 'advtrains:moretrains_wagon_gondola', 'default:paper'},
		{'default:paper', 'default:paper', 'default:paper'},
	},
})

minetest.register_craft({
	output = "advtrains:moretrains_wagon_gondola_cobble",
	type = "shapeless",
	recipe = {"advtrains:moretrains_wagon_gondola", "default:cobble", "default:cobble"},
})

minetest.register_craft({
	output = "advtrains:moretrains_wagon_gondola_rails",
	type = "shapeless",
	recipe = {"advtrains:moretrains_wagon_gondola", "advtrains:dtrack_placer", "advtrains:dtrack_placer"},
})