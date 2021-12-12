local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s,a,...)a={a,...}return s:gsub("@(%d+)",function(n)return a[tonumber(n)]end)end
end

advtrains.register_wagon("granite_locomotive", {
	mesh="advtrains_granite_locomotive.b3d",
	textures = {"advtrains_granite_locomotive.png"},
	is_locomotive=true,
	drives_on={default=true},
	max_speed=15,
	seats = {
		{
			name = S("Driver Stand (left)"),
			attach_offset = {x=-4, y=4, z=15},
			view_offset = {x=-4, y=4, z=15},
			group = "dstand",
		},
		{
			name = S("Trainee Seat (right)"),
			attach_offset = {x=4, y=4, z=15},
			view_offset = {x=4, y=4, z=15},
			group = "tseat",
		},
	},
	seat_groups = {
		dstand = {
			name = "Driver Stand",
			access_to = {"tseat"},
			driving_ctrl_access = true,
		},
		tseat = {
			name = "Trainee Seat",
			access_to = {"dstand"},
			driving_ctrl_access = false,
		},
	},
	assign_to_seat_group = {"dstand", "tseat"},
	visual_size = {x=1, y=1},
	wagon_span = 2.8,
	collisionbox = {-1.75,-0.5,-1.0, 1.75,2.5,1.0},
	update_animation=function(self, velocity)
		if self.old_anim_velocity~=advtrains.abs_ceil(velocity) then
			self.object:set_animation({x=1,y=80}, advtrains.abs_ceil(velocity)*15, 0, true)
			self.old_anim_velocity=advtrains.abs_ceil(velocity)
		end
	end,
	custom_on_activate = function(self, staticdata_table, dtime_s)
		minetest.add_particlespawner({
			amount = 10,
			time = 0,
		--  ^ If time is 0 has infinite lifespan and spawns the amount on a per-second base
			minpos = {x=0, y=2.5, z=-1.2},
			maxpos = {x=0, y=2.5, z=-1.2},
			minvel = {x=-0.2, y=1.8, z=-0.2},
			maxvel = {x=0.2, y=2, z=0.2},
			minacc = {x=0, y=-0.1, z=0},
			maxacc = {x=0, y=-0.3, z=0},
			minexptime = 2,
			maxexptime = 4,
			minsize = 1,
			maxsize = 4,
		--  ^ The particle's properties are random values in between the bounds:
		--  ^ minpos/maxpos, minvel/maxvel (velocity), minacc/maxacc (acceleration),
		--  ^ minsize/maxsize, minexptime/maxexptime (expirationtime)
			collisiondetection = true,
		--  ^ collisiondetection: if true uses collision detection
			vertical = false,
		--  ^ vertical: if true faces player using y axis only
			texture = "smoke_puff.png",
		--  ^ Uses texture (string)
			attached = self.object,
		})
	end,
	drops={"advtrains:granite_locomotive"},
      horn_sound = "advtrains_granite_horn",
}, S("Granite Locomotive"), "advtrains_granite_locomotive_inv.png")


minetest.register_craft({
	output = 'advtrains:granite_locomotive',
	recipe = {
		{'default:steelblock', 'default:steelblock', 'default:steelblock'},
		{'default:glass', 'dye:red', 'dye:white'},
		{'advtrains:wheel', 'default:steelblock', 'advtrains:wheel'},
	},
})
