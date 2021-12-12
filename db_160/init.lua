local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("engine_DB_160", {
	mesh="advtrains_DB_160.b3d",
	textures = {"advtrains_DB_160.png"},
	drives_on={default=true},
	max_speed=20,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=1, z=-3},
			view_offset={x=0, y=1, z=-3},
			group="dstand",
		}
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {},
			require_doors_open=true,
			driving_ctrl_access=true,
		}
	},
	assign_to_seat_group = {"dstand"},
	doors={
		open={
			[-1]={frames={x=0, y= 20}, time=1},
			[1]={frames={x=40, y=60}, time=1}
		},
		close={
			[-1]={frames={x=20, y=40}, time=1},
			[1]={frames={x=60, y=80}, time=1}
		}
	},
	door_entry={-1},
	visual_size = {x=1, y=1},
	wagon_span=3.0,
	is_locomotive=true,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"advtrains:engine_DB_160"},
}, S("DB 160 "), "advtrains_DB_160_inv.png")
