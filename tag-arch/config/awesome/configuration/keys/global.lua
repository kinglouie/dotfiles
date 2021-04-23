local awful = require('awful')
local sharedtags = require("library.sharedtags")
local beautiful = require('beautiful')

require('awful.autofocus')

local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key
local apps = require('configuration.apps')

-- Key bindings
local global_keys = awful.util.table.join(

	-- Hotkeys
	awful.key(
		{modkey}, 
		'F1', 
		hotkeys_popup.show_help, 
		{description = 'show help', group = 'awesome'}
	),
	awful.key({modkey, 'Control'}, 
		'r', 
		awesome.restart, 
		{description = 'reload awesome', group = 'awesome'}
	),
	
	awful.key({modkey, 'Control'}, 
		'q', 
		awesome.quit, 
		{description = 'quit awesome', group = 'awesome'}
	),
	awful.key(
		{altkey, 'Shift'},
		'l',
		function()
			awful.tag.incmwfact(0.05)
		end,
		{description = 'increase master width factor', group = 'layout'}
	),
	awful.key(
		{altkey, 'Shift'},
		'h',
		function()
			awful.tag.incmwfact(-0.05)
		end,
		{description = 'decrease master width factor', group = 'layout'}
	),
	awful.key(
		{modkey, 'Shift'},
		'h',
		function()
			awful.tag.incnmaster(1, nil, true)
		end,
		{description = 'increase the number of master clients', group = 'layout'}
	),
	awful.key(
		{modkey, 'Shift'},
		'l',
		function()
			awful.tag.incnmaster(-1, nil, true)
		end,
		{description = 'decrease the number of master clients', group = 'layout'}
	),
	awful.key(
		{modkey, 'Control'},
		'h',
		function()
			awful.tag.incncol(1, nil, true)
		end,
		{description = 'increase the number of columns', group = 'layout'}
	),
	awful.key(
		{modkey, 'Control'},
		'l',
		function()
			awful.tag.incncol(-1, nil, true)
		end,
		{description = 'decrease the number of columns', group = 'layout'}
	),
	awful.key(
		{modkey},
		'space',
		function()
			awful.layout.inc(1)
		end,
		{description = 'select next layout', group = 'layout'}
	),
	awful.key(
		{modkey, 'Shift'},
		'space',
		function()
			awful.layout.inc(-1)
		end,
		{description = 'select previous layout', group = 'layout'}
	),
	awful.key(
		{modkey},
		'o',
		function()
			awful.tag.incgap(1)
		end,
		{description = 'increase gap', group = 'layout'}
	),
	awful.key(
		{modkey, 'Shift'},
		'o',
		function()
			awful.tag.incgap(-1)
		end,
		{description = 'decrease gap', group = 'layout'}
	),
	awful.key(
		{modkey}, 
		'q', 
		awful.tag.viewprev, 
		{description = 'view previous tag', group = 'tag'}
	),
	awful.key(
		{modkey}, 
		's', 
		awful.tag.viewnext, 
		{description = 'view next tag', group = 'tag'}
	),
	awful.key(
		{modkey}, 
		'Escape', 
		awful.tag.history.restore, 
		{description = 'alternate between current and previous tag', group = 'tag'}
	),
	awful.key({ modkey, 'Control' }, 
		'w',
		function ()
			-- tag_view_nonempty(-1)
			local focused = awful.screen.focused()
			for i = 1, #focused.tags do
				awful.tag.viewidx(-1, focused)
				if #focused.clients > 0 then
					return
				end
			end
		end, 
		{description = 'view previous non-empty tag', group = 'tag'}
	),
	awful.key({ modkey, 'Control' }, 
		's',
		function ()
			-- tag_view_nonempty(1)
			local focused =  awful.screen.focused()
			for i = 1, #focused.tags do
				awful.tag.viewidx(1, focused)
				if #focused.clients > 0 then
					return
				end
			end
		end, 
		{description = 'view next non-empty tag', group = 'tag'}
	),
	awful.key(
		{modkey, 'Shift'}, 
		'F1',  
		function() 
			awful.screen.focus_relative(-1) 
		end,
		{ description = 'focus the previous screen', group = 'screen'}
	),
	awful.key(
		{modkey, 'Shift'}, 
		'F2', 
		function()
			awful.screen.focus_relative(1)
		end,
		{ description = 'focus the next screen', group = 'screen'}
	),
	awful.key(
		{modkey, 'Control'},
		'n',
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal('request::activate')
				c:raise()
			end
		end,
		{description = 'restore minimized', group = 'screen'}
	),
	awful.key(
		{},
		'XF86MonBrightnessUp',
		function()
			awful.spawn('light -A 10', false)
			awesome.emit_signal('widget::brightness')
			awesome.emit_signal('module::brightness_osd:show', true)
		end,
		{description = 'increase brightness by 10%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86MonBrightnessDown',
		function()
			awful.spawn('light -U 10', false)
			awesome.emit_signal('widget::brightness')
			awesome.emit_signal('module::brightness_osd:show', true)
		end,
		{description = 'decrease brightness by 10%', group = 'hotkeys'}
	),
	-- ALSA volume control
	awful.key(
		{},
		'XF86AudioRaiseVolume',
		function()
			awful.spawn('amixer -D pulse sset Master 5%+', false)
			awesome.emit_signal('widget::volume')
			awesome.emit_signal('module::volume_osd:show', true)
		end,
		{description = 'increase volume up by 5%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioLowerVolume',
		function()
			awful.spawn('amixer -D pulse sset Master 5%-', false)
			awesome.emit_signal('widget::volume')
			awesome.emit_signal('module::volume_osd:show', true)
		end,
		{description = 'decrease volume up by 5%', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioMute',
		function()
			awful.spawn('amixer -D pulse set Master 1+ toggle', false)
		end,
		{description = 'toggle mute', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioNext',
		function()
			awful.spawn('mpc next', false)
		end,
		{description = 'next music', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioPrev',
		function()
			awful.spawn('mpc prev', false)
		end,
		{description = 'previous music', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioPlay',
		function()
			awful.spawn('mpc toggle', false)
		end,
		{description = 'play/pause music', group = 'hotkeys'}

	),
	awful.key(
		{},
		'XF86AudioMicMute',
		function()
			awful.spawn('amixer set Capture toggle', false)
		end,
		{description = 'mute microphone', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86PowerDown',
		function()
			--
		end,
		{description = 'shutdown skynet', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86PowerOff',
		function()
			awesome.emit_signal('module::exit_screen:show')
		end,
		{description = 'toggle exit screen', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86Display',
		function()
			awful.spawn.single_instance('arandr', false)
		end,
		{description = 'arandr', group = 'hotkeys'}
	),
	awful.key(
		{modkey, 'Shift'},
		'q',
		function()
			awesome.emit_signal('module::exit_screen:show')
		end,
		{description = 'toggle exit screen', group = 'hotkeys'}
	),
	awful.key(
		{modkey},
		'`',
		function()
			awesome.emit_signal('module::quake_terminal:toggle')
		end,
		{description = 'dropdown application', group = 'launcher'}
	),
	awful.key(
		{ }, 
		'Print',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.full_screenshot,function() end)
		end,
		{description = 'fullscreen screenshot', group = 'Utility'}
	),
	awful.key(
		{modkey, 'Shift'}, 
		's',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.area_screenshot,function() end)
		end,
		{description = 'area/selected screenshot', group = 'Utility'}
	),
	awful.key(
		{modkey},
		'x',
		function()
			awesome.emit_signal('widget::blur:toggle')
		end,
		{description = 'toggle blur effects', group = 'Utility'}
	),
	awful.key(
		{modkey},
		']',
		function()
			awesome.emit_signal('widget::blur:increase')
		end,
		{description = 'increase blur effect by 10%', group = 'Utility'}
	),
	awful.key(
		{modkey},
		'[',
		function()
			awesome.emit_signal('widget::blur:decrease')
		end,
		{description = 'decrease blur effect by 10%', group = 'Utility'}
	),
	awful.key(
		{modkey},
		't',
		function() 
			awesome.emit_signal('widget::blue_light:toggle')
		end,
		{description = 'toggle redshift filter', group = 'Utility'}
	),
	awful.key(
		{ 'Control' }, 
		'Escape', 
		function ()
			if screen.primary.systray then
				if not screen.primary.tray_toggler then
					local systray = screen.primary.systray
					systray.visible = not systray.visible
				else
					awesome.emit_signal('widget::systray:toggle')
				end
			end
		end, 
		{description = 'toggle systray visibility', group = 'Utility'}
	),
	awful.key(
		{modkey},
		'l',
		function()
			awful.spawn(apps.default.lock, false)
		end,
		{description = 'lock the screen', group = 'Utility'}
	),
	awful.key(
		{modkey}, 
		'Return',
		function()
			awful.spawn(apps.default.terminal)
		end,
		{description = 'open default terminal', group = 'launcher'}
	),
	awful.key(
		{modkey, 'Shift'}, 
		'e',
		function()
			awful.spawn(apps.default.file_manager)
		end,
		{description = 'open default file manager', group = 'launcher'}
	),
	awful.key(
		{modkey, 'Shift'}, 
		'f',
		function()
			awful.spawn(apps.default.web_browser)
		end,
		{description = 'open default web browser', group = 'launcher'}
	),
	awful.key(
		{'Control', 'Shift'}, 
		'Escape',
		function()
			awful.spawn(apps.default.terminal .. ' ' .. 'htop')
		end,
		{description = 'open system monitor', group = 'launcher'}
	),
	awful.key(
		{modkey}, 
		'e',
		function()
			local focused = awful.screen.focused()

			if focused.control_center then
				focused.control_center:hide_dashboard()
				focused.control_center.opened = false
			end
			if focused.info_center then
				focused.info_center:hide_dashboard()
				focused.info_center.opened = false
			end
			awful.spawn(apps.default.rofi_appmenu, false)
		end,
		{description = 'open application drawer', group = 'launcher'}
	),
	awful.key(
		{}, 
		'XF86Launch1',
		function()
			local focused = awful.screen.focused()

			if focused.control_center then
				focused.control_center:hide_dashboard()
				focused.control_center.opened = false
			end
			if focused.info_center then
				focused.info_center:hide_dashboard()
				focused.info_center.opened = false
			end
			awful.spawn(apps.default.rofi_appmenu, false)
		end,
		{description = 'open application drawer', group = 'launcher'}
	),
	awful.key(
		{modkey, 'Shift'},
		'x',
		function()
			awful.spawn(apps.default.rofi_global, false)
		end,
		{description = 'open global search', group = 'launcher'}
	),
	awful.key(
		{modkey},
		'r',
		function()
			local focused = awful.screen.focused()
			if focused.info_center and focused.info_center.visible then
				focused.info_center:toggle()
			end
			focused.control_center:toggle()
		end,
		{description = 'open control center', group = 'launcher'}
	),
	awful.key(
		{modkey, 'Shift'},
		'r',
		function()
			local focused = awful.screen.focused()
			if focused.control_center and focused.control_center.visible then
				focused.control_center:toggle()
			end
			focused.info_center:toggle()
		end,
		{description = 'open info center', group = 'launcher'}
	)
)

for i = 1, 10 do
    global_keys = awful.util.table.join(global_keys,
        -- View tag only.
        awful.key(
			{ modkey },
			"#" .. i + 9,
			function ()
				local tag = tags[i]
				if tag then
					sharedtags.viewonly(tag, tag.screen)
					awful.screen.focus(tag.screen)
				end
			end,
			{description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key(
			{ modkey, "Control" },
			"#" .. i + 9,
			function ()
				local tag = tags[i]
				if tag then
					sharedtags.viewtoggle(tag, tag.screen)
				end
			end,
			{description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key(
			{ modkey, "Shift" },
			"#" .. i + 9,
			function ()
				if client.focus then
					local tag = tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key(
			{ modkey, "Control", "Shift" },
			"#" .. i + 9,
			function ()
				if client.focus then
					local tag = tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

return global_keys
