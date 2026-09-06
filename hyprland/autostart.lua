return function(_)
    hl.on("hyprland.start", function()
        hl.exec_cmd("nm-applet")
        hl.exec_cmd("noctalia")
    end)
end
