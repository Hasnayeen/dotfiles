alias c = clear
alias e = exit
alias erase = git checkout -f
alias clean = git clean -f
alias diff = git diff
alias linuxv = lsb_release -a
alias version = cat /etc/*-release
alias portainer = docker start portainer

# ------------------------
# App alias
# ------------------------
alias fm = xplr
alias nv = nvim
alias art = php artisan
alias gitui = gitui -t catppuccin.ron

alias nrd = npm run dev
alias nrb = npm run build
alias ni = npm install

# -----------------------
# Git push
# -----------------------
def cm [] {
    git add --all
    git commit -m
}
def wip [] {
    git add --all
    git commit -m 'wip'
}
def push [] {
    wip
    ggpush
}

alias dumbledore = cd /mnt/work/projects/php/dumbledore
def sites [] {
    cd /mnt/work/projects/php
    cd 
}
alias cat = bat

# -----------------------
# Running test
# -----------------------

alias t = art test --env=testing --filter 
alias ta = art test --env=testing
alias tap = art test --env=testing -p 
alias tsqlite = art test --env=backup --filter 
alias tsa = art test --env=backup 
alias tsap = art test --env=backup -p 
alias td = art dusk --filter 
alias cy = npx cypress open
alias pest = vendor/bin/pest
alias pf = pest --filter

# alias copy_last_command = "fc -ln -1 | sed 's/^\s*//' | tr -d '\n' | xsel -b"
alias pint = ./vendor/bin/pint 
# alias drypint = ./vendor/bin/pint --test 
# alias ls = lsd
alias l = ls -l
alias la = ls -a
alias lla = ls -la
# alias lt = ls --tree

alias dnsmasq_restart = sudo service dnsmasq restart

# -----------------------
# Localstack
# -----------------------

alias s3_start = SERVICES=s3 localstack start
alias s3_lb = aws --endpoint-url=http://localhost:4566 s3api list-buckets
alias s3_cb = aws --endpoint-url=http://localhost:4566 s3api create-bucket --bucket 
alias s3_fl = aws --endpoint-url=http://localhost:4566 s3api list-objects --output text --query "Contents[].{Key: Key}" --bucket 

# -----------------------
# Wallpaper (hyprpaper)
# -----------------------

def wp [filename, light? = false] {
    swww img $filename --transition-type any
    if ($light) {
        wal --cols16 -i $filename -l
    } else {
        wal --cols16 -i $filename
    }
}

# -----------------------
# Misc
# -----------------------

def audio [] {
    pulseaudio -k
    sudo alsa force-reload
}
alias lg = lazygit 

alias exp = rustc --explain 

# alias find_pid_listening_to_port = (netstat -nlp | grep) 

def yz [] {
    echo $":open (yazi --chooser-file /dev/stdout | echo $in)\r" | wezterm cli send-text --pane-id (wezterm cli get-pane-direction left) --no-paste
    # echo $":open (yazi --chooser-file /dev/stdout | echo $in)\r" | wezterm cli send-text --pane-id (wezterm cli list --format json | from json | select title pane_id | where ($it.title | str contains 'hx') | get pane_id | get 0) --no-paste
}
