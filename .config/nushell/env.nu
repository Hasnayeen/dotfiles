# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | format date '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = { "〉" }
$env.PROMPT_INDICATOR_VI_INSERT = { ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = { "〉" }
$env.PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = ($env.PATH | append '/mnt/work/projects/rust/eww/target/release/')
$env.PATH = ($env.PATH | append '/home/hasnayeen/.surrealdb')
$env.PATH = ($env.PATH | append '/home/hasnayeen/.local/bin')
$env.PATH = ($env.PATH | append '/home/hasnayeen/.cargo/bin')
$env.PATH = ($env.PATH | append '/home/hasnayeen/.config/composer/vendor/bin')

#---------------------------------|
# FNM config                      |
#---------------------------------|

# Parse FNM env from other supported shell. It result should looks like this:
# │ FNM_VERSION_FILE_STRATEGY │ local                          │
# │ FNM_DIR                   │ /home/user/.fnm                |
# Then load these value key pair to Nushell env
load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })

# Add dynamic FNM path
$env.PATH = ($env.PATH | append [
  $"($env.FNM_MULTISHELL_PATH)/bin"
])
# zoxide init nushell --hook prompt | save -f ~/.zoxide.nu

export-env { $env.STARSHIP_CONFIG = ( $env.HOME | path join ".config" "starship" "starship.toml" ) }

