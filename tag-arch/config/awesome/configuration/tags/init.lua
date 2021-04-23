local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local apps = require('configuration.apps')
local sharedtags = require("library.sharedtags")

tags = sharedtags({
	{
		type = 'free1',
		icon = icons.rune_1,
		gap = beautiful.useless_gap,
		layout = awful.layout.suit.tile,
	},
	{
		type = 'free2',
		icon = icons.rune_2,
		gap = beautiful.useless_gap,
		layout = awful.layout.suit.tile,
	},
	{
		type = 'free3',
		icon = icons.rune_3,
		gap = beautiful.useless_gap,
		layout = awful.layout.suit.tile,
	},
	{
		type = 'free4',
		icon = icons.rune_4,
		gap = beautiful.useless_gap,
		layout = awful.layout.suit.tile,
	},
	{
		type = 'free5',
		icon = icons.rune_5,
		gap = beautiful.useless_gap,
		layout = awful.layout.suit.tile,
	},
	{
		type = 'free6',
		icon = icons.rune_6,
		layout = awful.layout.suit.tile,
		gap = 0,
	},
	{
		type = 'mail',
		icon = icons.rune_7,
		layout = awful.layout.suit.max,
		gap = 0,
	},
	{
		type = 'franz',
		icon = icons.rune_8,
		layout = awful.layout.suit.max,
		gap = 0,
	},
	{
		type = 'joplin',
		icon = icons.rune_9,
		gap = 0,
		layout = awful.layout.suit.max,
	},
	{
		type = '10',
		icon = icons.rune_10,
		gap = 0,
		layout = awful.layout.suit.max,
	}
})



-- Set tags layout
tag.connect_signal(
	'request::default_layouts',
	function()
	    awful.layout.append_default_layouts({
			awful.layout.suit.spiral.dwindle,
			awful.layout.suit.tile,
			awful.layout.suit.floating,
			awful.layout.suit.max
	    })
	end
)

-- Create tags for each screen
screen.connect_signal(
	'request::desktop_decoration',
	function(s)
		if(screen.count() == 2) then
			gears.debug.print_error("TEST Index: " .. s.index)
			gears.debug.print_error("TEST Index: " .. tostring(s == screen.primary))
			if(s ~= screen.primary) then
				gears.debug.print_error("rorga")
				sharedtags.viewonly(tags[7], s)
				sharedtags.viewonly(tags[8], s)
				sharedtags.viewonly(tags[9], s)
				sharedtags.viewonly(tags[10], s)
			end
			

		end	
	end
)

function make_primary_screen_first(s)
    gears.debug.print_error("PRIMARY CHANGED: " .. s.index)
    for sc in screen do
        if(sc == screen.primary) then
			sharedtags.viewonly(tags[1], sc)
			sharedtags.viewonly(tags[2], sc)
			sharedtags.viewonly(tags[3], sc)
			sharedtags.viewonly(tags[4], sc)
			sharedtags.viewonly(tags[5], sc)
			sharedtags.viewonly(tags[6], sc)
		else
			sharedtags.viewonly(tags[7], sc)
			sharedtags.viewonly(tags[8], sc)
			sharedtags.viewonly(tags[9], sc)
			sharedtags.viewonly(tags[10], sc)
		end
    end


end
screen.connect_signal("primary_changed", make_primary_screen_first)


debug_screens = function()
	for i,t in ipairs(tags) do
		gears.debug.print_error(i .. gears.debug.dump_return(t.screen,"tag",3))
	end
end

local update_gap_and_shape = function(t)
	-- Get current tag layout
	local current_layout = awful.tag.getproperty(t, 'layout')
	-- If the current layout is awful.layout.suit.max
	if (current_layout == awful.layout.suit.max) then
		-- Set clients gap to 0 and shape to rectangle if maximized
		t.gap = 0
		for _, c in ipairs(t:clients()) do
			if not c.floating or not c.round_corners or c.maximized or c.fullscreen then
				c.shape = beautiful.client_shape_rectangle
			else
				c.shape = beautiful.client_shape_rounded
			end
		end
	else
		t.gap = beautiful.useless_gap
		for _, c in ipairs(t:clients()) do
			if not c.round_corners or c.maximized or c.fullscreen then
				c.shape = beautiful.client_shape_rectangle
			else
				c.shape = beautiful.client_shape_rounded
			end
		end
	end
end

-- -- Change tag's client's shape and gap on change
-- tag.connect_signal(
-- 	'property::layout',
-- 	function(t)
-- 		update_gap_and_shape(t)
-- 	end
-- )

-- -- Change tag's client's shape and gap on move to tag
-- tag.connect_signal(
-- 	'tagged',
-- 	function(t)
-- 		update_gap_and_shape(t)
-- 	end
-- )

-- -- Focus on urgent clients
-- awful.tag.attached_connect_signal(
-- 	s,
-- 	'property::selected',
-- 	function()
-- 		local urgent_clients = function (c)
-- 			return awful.rules.match(c, {urgent = true})
-- 		end
-- 		for c in awful.client.iterate(urgent_clients) do
-- 			if c.first_tag == mouse.screen.selected_tag then
-- 				c:emit_signal('request::activate')
-- 				c:raise()
-- 			end
-- 		end
-- 	end
-- )
