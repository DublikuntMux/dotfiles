source ~/.config/fish/conf.d/_tide_init.fish

function fish_greeting
    neofetch
end

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

set -p EMSCRIPTEN_ROOT /usr/lib/emscripten
set -p BUN_INSTALL "$HOME/.bun"
set -p GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set -p PATH $PATH ~/.local/bin
set -p PATH $PATH ~/.local/lib
set -p PATH $PATH ~/.local/bin/vlang
set -p PATH $PATH /usr/lib/emscripten
set -p PATH $BUN_INSTALL/bin $PATH

set -p GDK_BACKEND wayland
set -p TDESKTOP_DISABLE_GTK_INTEGRATION 1
set -p CLUTTER_BACKEND wayland
set -p BEMENU_BACKEND wayland
set -p QT_STYLE_OVERRIDE kvantum
set -p QT_WAYLAND_FORCE_DPI physical
set -p QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -p ELM_DISPLAY wl
set -p ECORE_EVAS_ENGINE wayland_egl
set -p ELM_ENGINE wayland_egl
set -p ELM_ACCEL opengl
set -p SDL_VIDEODRIVER wayland
set -p _JAVA_AWT_WM_NONREPARENTING 1
set -p NO_AT_BRIDGE 1
set -p WINIT_UNIX_BACKEND wayland

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

function history
    builtin history --show-time='%F %T '
end


alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias l.="exa -a | grep -E '^\.'"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias wget='wget -c '
alias gcl="git clone --recursive "

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='grep -F --color=auto'
alias egrep='grep -E --color=auto'
alias hw='hwinfo --short'

alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias jctl="journalctl -p 3 -xb"
