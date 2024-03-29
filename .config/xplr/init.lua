version = "0.21.7"
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

require"icons".setup()

-- # Configuration ------------------------------------------------------------

-- ### General Configuration --------------------------------------------------
--
-- Set it to `true` if you want to enable a safety feature that will save you
-- from yourself when you type recklessly.
--
-- Type: boolean
xplr.config.general.enable_recover_mode = true

-- Set it to `true` if you want the cursor to stay in the same position when
-- the focus is on the first path and you navigate to the previous path
-- (by pressing `up`/`k`), or when the focus is on the last path and you
-- navigate to the next path (by pressing `down`/`j`).
-- The default behavior is to rotate from the last/first path.
--
-- Type: boolean
xplr.config.general.enforce_bounded_index_navigation = true

-- ### Layouts ----------------------------------------------------------------
--
-- The default layout
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 75 },
        { Percentage = 25 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 3 },
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "SortAndFilter",
            "Table",
            "InputAndLogs",
          },
        },
      },
      {
        Vertical = {
          config = {
            constraints = {
              { Percentage = 30 },
              { Percentage = 70 },
            },
          },
          splits = {
            "Selection",
            "HelpMenu",
          },
        },
      },
    },
  },
}

-- The layout without help menu
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.no_help = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 70 },
        { Percentage = 30 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 3 },
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "SortAndFilter",
            "Table",
            "InputAndLogs",
          },
        },
      },
      "Selection",
    },
  },
}

-- The layout without selection panel
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.no_selection = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 70 },
        { Percentage = 30 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 3 },
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "SortAndFilter",
            "Table",
            "InputAndLogs",
          },
        },
      },
      "HelpMenu",
    },
  },
}

-- The layout without help menu and selection panel
--
-- Type: [Layout](https://xplr.dev/en/layout)
xplr.config.layouts.builtin.no_help_no_selection = {
  Vertical = {
    config = {
      constraints = {
        { Length = 3 },
        { Min = 1 },
        { Length = 3 },
      },
    },
    splits = {
      "SortAndFilter",
      "Table",
      "InputAndLogs",
    },
  },
}

-- This is where you can define custom layouts
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Layout](https://xplr.dev/en/layout)
--
-- Example:
--
-- ```lua
-- xplr.config.layouts.custom.example = "Nothing" -- Show a blank screen
-- xplr.config.general.initial_layout = "example" -- Load the example layout
-- ```
xplr.config.layouts.custom = {}

-- ### Modes ------------------------------------------------------------------
--
-- xplr is a modal file explorer. That means the users switch between different
-- modes, each containing a different set of key bindings to avoid clashes.
-- Users can switch between these modes at run-time.
--
-- The modes can be configured using the `xplr.config.modes` Lua API.
--
-- `xplr.config.modes.builtin` contain some built-in modes which can be
-- overridden, but you can't add or remove modes in it.
--
-- This is where you define custom modes.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Mode](https://xplr.dev/en/mode)
--
-- Example:
--
-- ```lua
-- xplr.config.modes.custom.example = {
--   name = "example",
--   key_bindings = {
--     on_key = {
--       enter = {
--         help = "default mode",
--         messages = {
--           "PopMode",
--           { SwitchModeBuiltin = "default" },
--         },
--       },
--     },
--   },
-- }
--
-- xplr.config.general.initial_mode = "example"
-- ```
xplr.config.modes.custom = {}

-- ## Function ----------------------------------------------------------------
--
-- While `xplr.config` defines all the static parts of the configuration,
-- `xplr.fn` defines all the dynamic parts using functions.
--
-- See: [Lua Function Calls](https://xplr.dev/en/lua-function-calls)
--
-- As always, `xplr.fn.builtin` is where the built-in functions are defined
-- that can be overwritten.

-- Tries to auto complete the path in the input buffer
xplr.fn.builtin.try_complete_path = function(m)
  if not m.input_buffer then
    return
  end

  local function matches_all(str, paths)
    for _, path in ipairs(paths) do
      if string.sub(path, 1, #str) ~= str then
        return false
      end
    end
    return true
  end

  local path = m.input_buffer
  local explorer_config = {
    filters = {
      { filter = "RelativePathDoesStartWith", input = xplr.util.basename(path) },
    },
  }
  local parent = xplr.util.dirname(path)
  if not parent or parent == "" then
    parent = "./"
  elseif parent ~= "/" then
    parent = parent .. "/"
  end

  local nodes = xplr.util.explore(parent, explorer_config)
  local found = {}
  for _, node in ipairs(nodes) do
    table.insert(found, parent .. node.relative_path)
  end
  local count = #found

  if count == 0 then
    return
  elseif count == 1 then
    return {
      { SetInputBuffer = found[1] },
    }
  else
    local first = found[1]
    while #first > #path and matches_all(path, found) do
      path = string.sub(first, 1, #path + 1)
    end

    if matches_all(path, found) then
      return {
        { SetInputBuffer = path },
      }
    end

    return {
      { SetInputBuffer = string.sub(path, 1, #path - 1) },
    }
  end
end

xplr.fn.builtin.fmt_general_selection_item = function(n)
  local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
  local sh_config = { with_prefix_dots = true, without_suffix_dots = true }
  local shortened = xplr.util.shorten(n.absolute_path, sh_config)
  if n.is_dir then
    shortened = shortened .. "/"
  end
  local ls_style = xplr.util.lscolor(n.absolute_path)
  local meta_style = xplr.util.node_type(n).style
  local style = xplr.util.style_mix({ ls_style, meta_style })
  return xplr.util.paint(shortened:gsub("\n", nl), style)
end

-- Renders the first column in the table
xplr.fn.builtin.fmt_general_table_row_cols_0 = function(m)
  local r = ""
  if m.is_before_focus then
    r = r .. " -"
  else
    r = r .. "  "
  end

  r = r .. m.relative_index .. "│" .. m.index

  return r
end

-- Renders the second column in the table
xplr.fn.builtin.fmt_general_table_row_cols_1 = function(m)
  local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
  local r = m.tree .. m.prefix
  local style = xplr.util.lscolor(m.absolute_path)
  style = xplr.util.style_mix({ style, m.style })

  if m.meta.icon == nil then
    r = r .. ""
  else
    r = r .. m.meta.icon .. " "
  end

  local rel = m.relative_path
  if m.is_dir then
    rel = rel .. "/"
  end
  r = r .. xplr.util.paint(xplr.util.shell_escape(rel), style)

  r = r .. m.suffix .. " "

  if m.is_symlink then
    r = r .. "-> "

    if m.is_broken then
      r = r .. "×"
    else
      local symlink_path =
          xplr.util.shorten(m.symlink.absolute_path, { base = m.parent })
      if m.symlink.is_dir then
        symlink_path = symlink_path .. "/"
      end
      r = r .. symlink_path:gsub("\n", nl)
    end
  end

  return r
end

-- Renders the third column in the table
xplr.fn.builtin.fmt_general_table_row_cols_2 = function(m)
  local r = xplr.util.paint("r", { fg = "Green" })
  local w = xplr.util.paint("w", { fg = "Yellow" })
  local x = xplr.util.paint("x", { fg = "Red" })
  local s = xplr.util.paint("s", { fg = "Red" })
  local S = xplr.util.paint("S", { fg = "Red" })
  local t = xplr.util.paint("t", { fg = "Red" })
  local T = xplr.util.paint("T", { fg = "Red" })

  return xplr.util
      .permissions_rwx(m.permissions)
      :gsub("r", r)
      :gsub("w", w)
      :gsub("x", x)
      :gsub("s", s)
      :gsub("S", S)
      :gsub("t", t)
      :gsub("T", T)
end

-- Renders the fourth column in the table
xplr.fn.builtin.fmt_general_table_row_cols_3 = function(m)
  if not m.is_dir then
    return m.human_size
  else
    return ""
  end
end

-- Renders the fifth column in the table
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
  return tostring(os.date("%a %b %d %H:%M:%S %Y", m.last_modified / 1000000000))
end

-- This is where the custom functions can be added.
--
-- There is currently no restriction on what kind of functions can be defined
-- in `xplr.fn.custom`.
--
-- You can also use nested tables such as
-- `xplr.fn.custom.my_plugin.my_function` to define custom functions.
xplr.fn.custom = {}

-- ## Hooks -------------------------------------------------------------------
--
-- This section of the configuration cannot be overwritten by another config
-- file or plugin, since this is an optional lua return statement specific to
-- each config file. It can be used to define things that should be explicit
-- for reasons like performance concerns, such as hooks.
--
-- Plugins should expose the hooks, and require users to subscribe to them
-- explicitly.
--
-- Example:
--
-- ```lua
-- return {
--   -- Add messages to send when the xplr loads.
--   -- This is similar to the `--on-load` command-line option.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_load = {
--     { LogSuccess = "Configuration successfully loaded!" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_load" },
--   },
--
--   -- Add messages to send when the directory changes.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_directory_change = {
--     { LogSuccess = "Changed directory" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_directory_change" },
--   },
--
--   -- Add messages to send when the focus changes.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_focus_change = {
--     { LogSuccess = "Changed focus" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_focus_change" },
--   }
--
--   -- Add messages to send when the mode is switched.
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_mode_switch = {
--     { LogSuccess = "Switched mode" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_mode_switch" },
--   }
--
--   -- Add messages to send when the layout is switched
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_layout_switch = {
--     { LogSuccess = "Switched layout" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_layout_switch" },
--   }
--
--   -- Add messages to send when the selection changes
--   --
--   -- Type: list of [Message](https://xplr.dev/en/message#message)s
--   on_selection_change = {
--     { LogSuccess = "Selection changed" },
--     { CallLuaSilently = "custom.some_plugin_with_hooks.on_selection_change" },
--   }
-- }
-- ```

return {
  on_load = {},
  on_directory_change = {},
  on_focus_change = {},
  on_mode_switch = {},
  on_layout_switch = {},
}

