local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("engine_electronic", {
	mesh="advtrains_engine_electronic.b3d",
	textures = {"advtrains_engine_electronic.png"},
	drives_on={default=true},
	max_speed=15,
	seats = {
        {
			name=S("Driver Stand (front)"),
            attach_offset={x=o, y=6, z=8},
			view_offset={x=0, y=-3, z=0},
			driving_ctrl_access=true,
			group = "dstand",
		},
		{
			name=S("Driver Stand (back)"),
			  attach_offset={x=o, y=-6, z=8},
			view_offset={x=0, y=-3, z=0},
			driving_ctrl_access=true,
			group = "dstand",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {},
		},
	},
    assign_to_seat_group = {"dstand"},
	wagon_span=2.1,
    visual_size = {x=1, y=1},
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	is_locomotive=true,
	drops={"advtrains:engine_electronic"},
	
}, S("electronic engine"), "advtrains__inv.png")


advtrains.register_wagon("wagon_compartment", {
	mesh="advtrains_wagon_compartment.b3d",
	textures = {"advtrains_compartment.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {
		{
			name="1",
			attach_offset={x=2, y=6, z=8},
			view_offset={x=0, y=-4, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=-1, y=6, z=8},
			view_offset={x=0, y=-4, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
	},
	seat_groups = {
		pass={
			name = "Passenger area",
			access_to = {},
		},
	},
	assign_to_seat_group = {"pass"},
	visual_size = {x=1, y=1},
	wagon_span=2.5,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
}, S("Passenger compartment Wagon"), "advtrains_compartment_inv.png") 


advtrains.register_wagon("wagon_sleep", {
	mesh="advtrains_wagon_sleep.b3d",
	textures = {"advtrains_sleep.png"},
	drives_on={default=true},
	max_speed=10,
	seats = {
		{
			name="1",
			attach_offset={x=2, y=6, z=8},
			view_offset={x=0, y=-2, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=-1, y=6, z=8},
			view_offset={x=0, y=-4, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=8, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
	},
	seat_groups = {
		pass={
			name = "Passenger area",
			access_to = {},
		},
	},
	assign_to_seat_group = {"pass"},
	visual_size = {x=1, y=1},
	wagon_span=2.5,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
}, S("Passenger sleeping Wagon"), "advtrains_sleep_inv.png") 

