--- Autostart commands ---

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("dunst")
	--hl.exec_cmd("hyprpm enable dynamic-cursors")
end)
