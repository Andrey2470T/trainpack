-- Copyright (C) 2021 Gabriel Pérez-Cerezo

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.


local S = minetest.get_translator("technictrain")

local function charger_step(wgn,dtime, data, train)
	local max_charge     = 200000
	local discharge_rate = 80000
	local charge_step    = 2000
	local charge_rate = 600
	if not data.charge then
		data.charge = 0
	end
	if data.burn_time and data.burn_time > 0 and data.charge < max_charge then
		data.charge = math.min( data.charge  + dtime*charge_rate, max_charge)
		data.burn_time = data.burn_time - dtime
	elseif data.charge < max_charge then
		local inv = wgn:get_inventory()
		if not inv:is_empty("fuel") then 
			local fuellist = inv:get_list("fuel")
			local fuel, afterfuel = minetest.get_craft_result(
				{method = "fuel", width = 1,
				 items = fuellist})
			if fuel and fuel.time > 0 then
				data.burn_time = fuel.time
				inv:set_stack("fuel", 1, afterfuel.items[1])
			end
		end
	end
	local size = math.floor(data.charge * 15 / max_charge +0.5)
	data.charge, _ = technic.charge_tools(wgn, data.charge, dtime*charge_step)
	wgn.object:set_properties({
			textures={"[combine:256x256:0,0=technictrain_wagon_charger.png:121,"..43+15-size.."=technictrain_charger_indicator.png\\^\\[resize\\:5x"..size..""}
	})

end


advtrains.register_wagon("technictrain_wagon_charger", {
	mesh="moretrains_wagon_box.b3d",
	textures = {"technictrain_wagon_charger.png"},
	seats = {},
	drives_on={default=true},
	max_speed=20,
	visual_size = {x=1, y=1},
	wagon_span=2.672,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock"},
	has_inventory = true,
	get_inventory = function (self) return minetest.get_inventory({type="detached", name="advtrains_wgn_"..self.id}) end,
	get_inventory_formspec = function(self, pname, invname)
		local data = advtrains.wagons[self.id]
		local prop = ""
		if data.owner==pname then
			prop = "button_exit[0,9;4,1;prop;"..S("Wagon properties").."]"
		end
		return "size[8,11]"..
		"list["..invname..";src;3,1;1,1;]"..
		"image[4,1;1,1;technic_battery_reload.png]"..
		"label[0,0;"..S("Battery / Generator car").."]"..
		"label[3,0;"..S("Charge").."]"..
		"label[5,0;"..S("Generator Fuel").."]"..
		"list[current_player;main;0,5;8,4;]"..
		"listring["..invname..";src]"..
			"listring[current_player;main]"..
			"listring["..invname..";fuel]"..
			"listring[current_player;main]"..
			"list["..invname..";fuel;5,1;1,1;]"..prop
			
	end,
	inventory_list_sizes = {
		fuel = 1,
		src = 1,
	},
	custom_on_step = charger_step,
}, S("Charger Wagon"), "technictrain_wagon_charger_inv.png")


minetest.register_craft({
	output = 'advtrains:technictrain_wagon_charger',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'technic:mv_generator', 'default:junglewood', 'technic:mv_battery_box0'},
		{'advtrains:wheel', '', 'advtrains:wheel'},
	},
})
