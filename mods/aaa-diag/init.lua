-- S = minetest.get_translator("aaa")

minetest.register_on_mods_loaded(function()
	S = function()
		minetest.log('error','Global S() called')
		return 'S() needed'
	end
end)


--[[
minetest.register_on_mods_loaded(function()
	for k,v in pairs(minetest.registered_abms) do
		local act = v.action
		v.action = function(pos, node, active_object_count, active_object_count_wider)
			minetest.log('warning','started abm > '..tostring(v.label))
			act(pos, node, active_object_count, active_object_count_wider)
			minetest.log('warning','exiting abm > '..tostring(v.label))
		end
	end
	for k,v in pairs(minetest.registered_lbms) do
		local act = v.action
		v.action = function(pos, node, dtime_s)
			minetest.log('warning','started lbm <'..tostring(v.name)..'> '..tostring(v.label))
			act(pos, node, dtime_s)
			minetest.log('warning','exiting lbm <'..tostring(v.name)..'> '..tostring(v.label))
		end
	end
	for k,v in pairs(minetest.registered_globalsteps) do
		local step = v
		minetest.registered_globalsteps[k] = function(dtime)
			minetest.log('warning','started gstep > '..tostring(k))
			step(dtime)
			minetest.log('warning','exiting gstep > '..tostring(k))
		end
	end
end)
--]]


--[[
minetest.log('warning',' ')
minetest.log('warning',' ')

for k,v in pairs(minetest.registered_globalsteps) do
	minetest.log('warning',tostring(k)..' > '..tostring(v))
end

minetest.log('warning',' ')
minetest.log('warning',' ')
--]]


--[[
minetest.register_lbm({
    label = "testing lbm closure",
    -- Descriptive label for profiling purposes (optional).
    -- Definitions with identical labels will be listed as one.

    name = "aaa:air_test",
    -- Identifier of the LBM, should follow the modname:<whatever> convention

    nodenames = {"air"},
    -- List of node names to trigger the LBM on.
    -- Names of non-registered nodes and groups (as group:groupname)
    -- will work as well.

    run_at_every_load = true,
    -- Whether to run the LBM's action every time a block gets activated,
    -- and not only the first time the block gets activated after the LBM
    -- was introduced.

    action = function(pos, node, dtime_s)
		local a = 'no op'
	end,
    -- Function triggered for each qualifying node.
    -- `dtime_s` is the in-game time (in seconds) elapsed since the block
    -- was last active
})
--]]