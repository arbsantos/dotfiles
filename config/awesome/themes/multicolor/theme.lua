--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper                                 = theme.confdir .. "/wall.png"
theme.font                                      = "xos4 Play 9"
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#262626"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#000000"
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#e85350"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#1c2022"
theme.border_focus                              = "#606060"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#e85350"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_pacman                             = theme.confdir .. "/icons/pacman.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_play                               = theme.confdir .. "/icons/play.png"
theme.widget_pause                              = theme.confdir .. "/icons/pause.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.vol                                       = theme.confdir .. "/icons/vol.png"
theme.vol_low                                   = theme.confdir .. "/icons/vol_low.png"
theme.vol_no                                    = theme.confdir .. "/icons/vol_no.png"
theme.vol_mute                                  = theme.confdir .. "/icons/vol_mute.png"
theme.vol_svg                                   = theme.confdir .. "/icons/vol.svg"
theme.vol_no_svg                                = theme.confdir .. "/icons/vol_no.svg"
theme.vol_mute_svg                              = theme.confdir .. "/icons/vol_mute.svg"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_unsel.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(1)
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Separators
local first     = wibox.widget.textbox(markup.font("Misc Tamsyn 3", " "))
local spr       = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("Misc Tamsyn 4", " "))
local bar_spr_double_space   = wibox.widget.textbox(markup.font("Misc Tamsyn 3", " ") .. markup.fontfg(theme.font, "#e85350", " | ") .. markup.font("Misc Tamsyn 5", " "))
local bar_spr_space   = wibox.widget.textbox(markup.font("Misc Tamsyn 3", " ") .. markup.fontfg(theme.font, "#e85350", " |") .. markup.font("Misc Tamsyn 5", " "))

local pacman_icon = wibox.widget.imagebox(theme.widget_pacman)

local mediaplayer = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
    },
    {
        id = 'current_song',
        widget = wibox.widget.textbox,
        font = 'Play 9'
    },
    layout = wibox.layout.align.horizontal,
    set_status = function(self, is_playing)
        self.icon.image = theme.confdir ..
                (is_playing and "/icons/play.png"
                            or  "/icons/pause.png")
    end,
    set_text = function(self, path)
        self.current_song.markup = markup.fontfg(theme.font, "#ffffff", path)
    end,
}

local update_widget_icon = function(widget, stdout, _, _, _)
    stdout = string.gsub(stdout, "\n", "")
    widget:set_status(stdout ~= 'Paused' and true or false)
end

local update_widget_text = function(widget, stdout, _, _, _)
    if string.find(stdout, 'No player') ~= nil then
        widget:set_text('')
        widget:set_visible(false)
    else
        widget:set_text(stdout)
        widget:set_visible(true)
    end
end
watch("/home/andre/.config/i3/i3blocks/mediaplayer/playerctl_metadata", 1, update_widget_icon, mediaplayer)
watch("/home/andre/.config/i3/i3blocks/mediaplayer/playerctl_metadata", 1, update_widget_text, mediaplayer)

mediaplayer:connect_signal("button::press", function(_, _, _, button)
    if (button == 1) then awful.spawn("playerctl play-pause", false)      -- left click
    elseif (button == 4) then awful.spawn("playerctl previous", false)  -- scroll up
    elseif (button == 5) then awful.spawn("playerctl next", false)  -- scroll down
    end
    awful.spawn.easy_async(GET_SPOTIFY_STATUS_CMD, function(stdout, stderr, exitreason, exitcode)
        update_widget_icon(mediaplayer, stdout, stderr, exitreason, exitcode)
    end)
end)

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#ffffff", "%A %d %B ") .. markup("#ffffff", " ") .. markup("#ffffff", "%H:%M:%S"), 1)
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    followtag = true,
    notification_preset = {
        font = "xos4 Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 2267057,
    notification_preset = { font = "xos4 Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#ffffff", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", descr .. " - " .. units .. " °C"))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", cpu_now.usage .. "%"))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        awful.spawn.easy_async_with_shell("perl .config/i3/i3blocks/temperature/temperature", function(out)
            widget:set_markup(markup.fontfg(theme.font, "#ffffff", out .. " °C"))
        end)
    end
})

-- ALSA volume bar
local volicon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.alsabar {
    width = dpi(59), border_width = 0, ticks = true, ticks_size = dpi(6),
    notification_preset = { font = theme.font },
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.vol_mute_svg)
        elseif volume_now.level == 0 then
            volicon:set_image(theme.vol_no_svg)
        -- elseif volume_now.level <= 50 then
        --     volicon:set_image(theme.vol_low)
        else
            volicon:set_image(theme.vol_svg)
        end
    end,
    cmd = "amixer -D pulse",
    channel = "Master",
    togglechannel = "Master",
    colors = {
        background   = theme.bg_normal,
        mute         = red,
        unmute       = theme.fg_normal
    }
}

theme.volume.bar:buttons(my_table.join (
          awful.button({}, 1, function()
            awful.spawn(string.format("%s set %s toggle-mute", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 2, function()
            os.execute(string.format("%s set %s toggle-mute", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 3, function()
            os.execute(string.format("%s set %s toggle-mute", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 4, function()
            os.execute(string.format("%s set %s 5%%+ && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 5, function()
            os.execute(string.format("%s set %s 5%%- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end)
))
local volumebg = wibox.container.background(theme.volume.bar, "#474747", gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, dpi(2), dpi(7), dpi(4), dpi(4))

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, "#ffffff", net_now.sent))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#ffffff", net_now.received))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", mem_now.used .. "MB"))
    end
})

-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all

-- Taglist label functions
awful.widget.taglist.filter.all = function (t, args)
    if t.selected or #t:clients() > 0 then
        return orig_filter(t, args)
    end
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    -- local wallpaper = theme.wallpaper
    -- if type(wallpaper) == "function" then
    --     wallpaper = wallpaper(s)
    -- end
    -- gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    -- awful.tag(awful.util.tagnames, s, awful.layout.layouts)
    for index, tag_name in pairs( awful.util.tagnames )do
        if index==1 then
            awful.tag.add(tag_name, {
                layout             = awful.layout.suit.tile,
                master_fill_policy = "expand",
                gap_single_client  = false,
                gap                = theme.useless_gap,
                screen             = s,
                selected           = true,
            })
        else
            awful.tag.add(tag_name, {
                layout             = awful.layout.suit.tile,
                master_fill_policy = "expand",
                gap_single_client  = false,
                gap                = theme.useless_gap,
                screen             = s,
                selected           = false,
            })
        end
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox,
        },
        --s.mytasklist, -- Middle widget
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mailicon,
            --theme.mail.widget,
            -- gpmdp.widget,
            mediaplayer,
            bar_spr_space,
            netdownicon,
            netdowninfo,
            spr,
            netupicon,
            netupinfo.widget,
            bar_spr_space,
            memicon,
            memory.widget,
            bar_spr_space,
            cpuicon,
            cpu.widget,
            spr,
            tempicon,
            temp.widget,
            bar_spr_double_space,
            theme.weather.widget,
            bar_spr_space,
            volicon,
            volumewidget,
            bar_spr_space,
            pacman_icon,
            awful.widget.watch('/home/andre/.config/i3/i3blocks/arch/arch_updates.sh', 10, function(widget, stdout)
                for line in stdout:gmatch("[^\r\n]+") do
                    widget:set_markup(markup.fontfg(theme.font, "#ffffff", line))
                    return
                end
            end),
            bar_spr_space,
            clockicon,
            mytextclock,
            wibox.widget.systray(),
        },
    }
end

return theme
