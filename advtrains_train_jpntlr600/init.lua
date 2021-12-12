---------------------------------------------------------------------------------------
-- JAPAN TRAM TLR0600<Toyama Light Rail model>
-- by takaosan
---------------------------------------------------------------------------------------

local S = attrans
local deltatime = 0.0

local colours = {
	"blue",
	"green",
	"red",
	"yellow"
}

for _,colour in pairs(colours) do
	-- TLR0600 <FRONT>
	advtrains.register_wagon("Tlr600_"..colour.."_front", {
		mesh="advtrains_tlr600_front.b3d",
		textures = {"advtrains_tlr600_"..colour..".png"},
		drives_on={default=true},
		max_speed=5,
		seats = {
			{
				name=S("Driver stand"),
				attach_offset={x=0, y=-4, z=20},
				view_offset={x=0, y=-4, z=20},
				driving_ctrl_access=true,
				group="dstand",
			},
			{
				name="1",
				attach_offset={x=-4, y=-4, z=0},
				view_offset={x=-4, y=-4, z=0},
				group="pass",
			},
			{
				name="2",
				attach_offset={x=4, y=-4, z=0},
				view_offset={x=4, y=-4, z=0},
				group="pass",
			},
			{
				name="3",
				attach_offset={x=-4, y=-4, z=-8},
				view_offset={x=-4, y=-4, z=-8},
				group="pass",
			},
			{
				name="4",
				attach_offset={x=4, y=-4, z=-8},
				view_offset={x=4, y=-4, z=-8},
				group="pass",
			},
		},
		seat_groups = {
			dstand={
				name = "Driver Stand",
				access_to = {"pass"},
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
				[-1]={frames={x=0, y=40}, time=1},
				[1]={frames={x=80, y=120}, time=1},
				sound = "advtrains_tlr600_dclose",
			},
			close={
				[-1]={frames={x=40, y=80}, time=1},
				[1]={frames={x=120, y=160}, time=1},
				sound = "advtrains_tlr600_dclose",
			}
		},
		door_entry={-1},
		assign_to_seat_group = {"dstand", "pass"},
		visual_size = {x=1, y=1},
		wagon_span=2.3,
		is_locomotive=true,
		collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
		drops={"default:steelblock 4"},
		horn_sound = "advtrains_tlr600_horn",
		custom_on_velocity_change = function(self, velocity, old_velocity, dtime)

			if not velocity or not old_velocity then return end

			if velocity > 0 and (self.sound_loop_tmr or 0)<=0 then
				self.sound_loop_handle = minetest.sound_play({name="advtrains_tlr600_loop", gain=0.3}, {object = self.object})
				self.sound_loop_tmr=3
			elseif velocity>0 then
				self.sound_loop_tmr = self.sound_loop_tmr - dtime
			elseif velocity==0 then
				if self.sound_loop_handle then
					minetest.sound_stop(self.sound_loop_handle)
					self.sound_loop_handle = nil
				end
				self.sound_loop_tmr=0
			end
		end,
		custom_on_step = function(self, dtime)
			deltatime = deltatime + dtime
			if deltatime > 60 then
				local time = minetest.get_timeofday() * 24000
				if time > 16500 or time < 5500 then
					self.object:set_properties({textures = {"tlr600_"..colour.."_light_front.png"},})
					self.object:set_properties({glow = 5,})
				else
					self.object:set_properties({textures = {"advtrains_tlr600_"..colour..".png"},})
					self.object:set_properties({glow = 0,})
				end
				deltatime = 0.0
			end
		end,
	}, S("Tlr600_"..colour.."_front"), "advtrains_tlr600_"..colour.."_inv.png")

	-- TLR0600 <BACK>
	advtrains.register_wagon("Tlr600_"..colour.."_back", {
		mesh="advtrains_tlr600_back.b3d",
		textures = {"advtrains_tlr600_"..colour..".png"},
		drives_on={default=true},
		max_speed=5,
		seats = {
			{
				name="1",
				attach_offset={x=-4, y=-4, z=8},
				view_offset={x=-4, y=-4, z=8},
				group="pass",
			},
			{
				name="2",
				attach_offset={x=4, y=-4, z=8},
				view_offset={x=4, y=-4, z=8},
				group="pass",
			},
			{
				name="3",
				attach_offset={x=-4, y=-4, z=-8},
				view_offset={x=-4, y=-4, z=-8},
				group="pass",
			},
			{
				name="4",
				attach_offset={x=4, y=-4, z=-8},
				view_offset={x=4, y=-4, z=-8},
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
				[-1]={frames={x=0, y=40}, time=1},
				[1]={frames={x=80, y=120}, time=1}
			},
			close={
				[-1]={frames={x=40, y=80}, time=1},
				[1]={frames={x=120, y=160}, time=1}
			}
		},
		door_entry={-1, 1},
		visual_size = {x=1, y=1},
		wagon_span=2.1,
		collisionbox = {-1.0,-0.5,-1.0, 1.0,2.5,1.0},
		drops={"default:steelblock 4"},
		custom_on_step = function(self, dtime)
			deltatime = deltatime + dtime
			if deltatime > 60 then
				local time = minetest.get_timeofday() * 24000
				if time > 16500 or time < 5500 then
					self.object:set_properties({textures = {"tlr600_"..colour.."_light_back.png"},})
					self.object:set_properties({glow = 5,})
				else
					self.object:set_properties({textures = {"advtrains_tlr600_"..colour..".png"},})
					self.object:set_properties({glow = 0,})
				end
				deltatime = 0.0
			end
		end,
	}, S("Tlr600_"..colour.."_back"), "advtrains_tlr600_"..colour.."_inv.png")
end
