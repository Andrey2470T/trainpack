local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("engine_railbus", {
	mesh="advtrains_railbus.b3d",
	textures = {"advtrains_railbus.png"},
	drives_on={default=true},
	max_speed=20,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=4, z=19},
			view_offset={x=0, y=4, z=19},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-4, y=4, z=0},
			view_offset={x=-4, y=4, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=4, z=0},
			view_offset={x=4, y=4, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=4, z=-8},
			view_offset={x=-4, y=4, z=-8},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=4, z=-8},
			view_offset={x=4, y=4, z=-8},
			group="pass",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {"pass"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
		pass={
			name = "Passenger area",
			access_to = {"dstand"},
			require_doors_open=true,
		},
	},
	assign_to_seat_group = {"dstand", "pass"},
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
	wagon_span=2.5,
	is_locomotive=true,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"advtrains:engine_railbus"},
}, S("railbus"), "advtrains_railbus_inv.png")

