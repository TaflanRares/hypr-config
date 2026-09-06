return function(_)
    hl.config({
        input = {
            kb_layout = "us",
            kb_variant = "",
            kb_model = "",
            kb_options = "",
            kb_rules = "",

            numlock_by_default = true,
            repeat_rate = 25,
            repeat_delay = 300,
            follow_mouse = 1,
            sensitivity = 0,

            touchpad = {
                natural_scroll = true,
                scroll_factor = 0.8,
            },
        },
    })

    hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
    })

    hl.device({
        name = "cx-2.4g-receiver-mouse",
        sensitivity = -0.01,
    })
end
