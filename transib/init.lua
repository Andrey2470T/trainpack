local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("engine_transib", {
	mesh="advtrains_engine_transib.b3d",
	textures = {"advtrains_engine_transib.png"},
	drives_on={default=true},
	max_speed=20,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=2, z=10},
			view_offset={x=0, y=2, z=10},
			driving_ctrl_access=true,
			group="dstand",
		}
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {},
			require_doors_open=true,
		}
	},
	assign_to_seat_group = {"dstand"},
	doors={
		open={
			[-1]={frames={x=0, y=20}, time=1},
			[1]={frames={x=40, y=60}, time=1}
		},
		close={
			[-1]={frames={x=20, y=40}, time=1},
			[1]={frames={x=60, y=80}, time=1}
		}
	},
	door_entry={-1},
	visual_size = {x=1, y=1},
	wagon_span=3.4,
	is_locomotive=true,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"advtrains:transib"},
}, S("transib "), "advtrains_engine_transib_inv.png")

advtrains.register_wagon("wagon_coal", {
	mesh="advtrains_wagon_coal.b3d",
	textures = {"advtrains_wagon_coal.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {},
	visual_size = {x=1, y=1},
	wagon_span=2.2,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"advtrains:wagon_coal"},
	has_inventory = true,
	get_inventory_formspec = function(self)
		return "size[8,11]"..
			"list[detached:advtrains_wgn_"..self.unique_id..";box;0,0;8,6;]"..
			"list[current_player;main;0,7;8,4;]"..
			"listring[]"
	end,
	inventory_list_sizes = {
		box=8*6,
	},
}, S("Coal Wagon(for transib)"), "advtrains_wagon_coal_inv.png")
