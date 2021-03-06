local S = attrans

advtrains.register_wagon("engine_japan", {
	mesh="advtrains_engine_japan.b3d",
	textures = {"advtrains_engine_japan.png"},
	drives_on={default=true},
	max_speed=20,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=0, z=13},
			view_offset={x=0, y=0, z=13},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-4, y=0, z=0},
			view_offset={x=-4, y=0, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=0, z=0},
			view_offset={x=4, y=0, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=0, z=-8},
			view_offset={x=-4, y=0, z=-8},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=0, z=-8},
			view_offset={x=4, y=0, z=8},
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
	door_entry={-1.7},
	visual_size = {x=1, y=1},
	wagon_span=2.5,
	is_locomotive=true,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
	horn_sound = "advtrains_japan_horn",
}, S("Japanese Train Engine"), "advtrains_engine_japan_inv.png")

advtrains.register_wagon("wagon_japan", {
	mesh="advtrains_wagon_japan.b3d",
	textures = {"advtrains_wagon_japan.png"},
	drives_on={default=true},
	max_speed=20,
	seats = {
		{
			name="1",
			attach_offset={x=-4, y=0, z=8},
			view_offset={x=-4, y=0, z=8},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=0, z=8},
			view_offset={x=4, y=0, z=8},
			group="pass",
		},
		{
			name="1a",
			attach_offset={x=-4, y=0, z=0},
			view_offset={x=-4, y=0, z=0},
			group="pass",
		},
		{
			name="2a",
			attach_offset={x=4, y=0, z=0},
			view_offset={x=4, y=0, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=0, z=-8},
			view_offset={x=-4, y=0, z=-8},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=0, z=-8},
			view_offset={x=4, y=0, z=-8},
			group="pass",
		},
	},
	seat_groups = {
		pass={
			name = "Passenger area",
			access_to = {},
			require_doors_open=true,
		},
	},
	assign_to_seat_group = {"pass"},
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
	door_entry={-1.7, 1.7},
	visual_size = {x=1, y=1},
	wagon_span=2.3,
	collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
	drops={"default:steelblock 4"},
}, S("Japanese Train Wagon"), "advtrains_wagon_japan_inv.png")

-- Crafting

minetest.register_craft({
	output = 'advtrains:engine_japan',
	recipe = {
		{'default:steelblock', 'default:steelblock', ''},
		{'xpanes:pane_flat', 'default:steelblock', 'xpanes:pane_flat'},
		{'advtrains:wheel', 'advtrains:wheel', 'advtrains:wheel'},
	},
})

minetest.register_craft({
output = 'advtrains:wagon_japan',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'xpanes:pane_flat', 'default:steelblock', 'xpanes:pane_flat'},
		{'advtrains:wheel', '', 'advtrains:wheel'},
	},
})



