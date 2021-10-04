local components = require "core.lualine.components"

-- Remove treesitter from the config
lvim.builtin.lualine.sections.lualine_x = {
  components.diagnostics,
  components.lsp,
  components.filetype,
}

-- Replace progressbar with location
lvim.builtin.lualine.sections.lualine_z = {
  components.location,
}

lvim.builtin.lualine.sections.lualine_b = {
        components.branch,
        {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
}

lvim.builtin.lualine.inactive_sections.lualine_a = {
        {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
}

-- Remove bold from lsp info and set foreground color to dimmer one
lvim.builtin.lualine.on_config_done = function(lualine)
  local config = lualine.get_config()
  config.sections.lualine_x[2].color.gui = "none"
  config.sections.lualine_x[2].color.fg = "#E5E9F0"
  lualine.setup(config)
end
