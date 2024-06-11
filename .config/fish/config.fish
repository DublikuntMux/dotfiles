function fish_greeting
    fastfetch
end

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -g -x EMSCRIPTEN_ROOT /usr/lib/emscripten
set -g -x BUN_INSTALL "$HOME/.bun"
set -g -x DENO_INSTALL "$HOME/.deno"
set -g -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set -g -x PATH $PATH ~/.local/bin
set -g -x PATH $PATH ~/.local/lib
set -g -x PATH $PATH ~/.local/bin/v
set -g -x PATH $PATH ~/.yarn/bin
set -g -x PATH $PATH ~/.cargo/bin
set -g -x PATH $PATH ~/.local/bin/DiscordChatExporter
set -g -x PATH $PATH /mnt/sda1/Develop/flutter/bin
set -g -x PATH $PATH /usr/lib/emscripten
set -g -x PATH $PATH /home/dublikunt/.dotnet/tools
set -g -x PATH $PATH /home/dublikunt/.dotnet

set -g -x PATH $DENO_INSTALL/bin $PATH
set -g -x PATH $BUN_INSTALL/bin $PATH

set -g -x ANDROID_SDK_ROOT ~/Develop/Android/
set -g -x ANDROID_NDK_ROOT ~/Develop/Android/ndk/26.1.10909125

set -g -x GDK_BACKEND wayland
set -g -x TDESKTOP_DISABLE_GTK_INTEGRATION 1
set -g -x CLUTTER_BACKEND wayland
set -g -x BEMENU_BACKEND wayland
set -g -x QT_QPA_PLATFORM wayland-egl
set -g -x QT_QPA_PLATFORMTHEME qt5ct
set -g -x ELM_DISPLAY wl
set -g -x ECORE_EVAS_ENGINE wayland_egl
set -g -x ELM_ENGINE wayland_egl
set -g -x ELM_ACCEL opengl
set -g -x _JAVA_AWT_WM_NONREPARENTING 1
set -g -x NO_AT_BRIDGE 1
set -g -x WINIT_UNIX_BACKEND wayland

alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias l.=" -a | grep -E '^\.'"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias wget='wget -c '

alias gc="git clone "
alias gcf="git clone --depth 1 "
alias gcr="git clone --recursive "
alias gcrf="git clone --recursive --depth 1 "

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='grep -F --color=auto'
alias egrep='grep -E --color=auto'
alias hw='hwinfo --short'

alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias update="sudo pacman -Suy"
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias jctl="journalctl -p 3 -xb"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/dublikunt/.ghcup/bin $PATH # ghcup-env

###-begin-pnpm-completion-###
function _pnpm_completion
  set cmd (commandline -o)
  set cursor (commandline -C)
  set words (count $cmd)

  set completions (eval env DEBUG=\"" \"" COMP_CWORD=\""$words\"" COMP_LINE=\""$cmd \"" COMP_POINT=\""$cursor\"" SHELL=fish pnpm completion-server -- $cmd)

  if [ "$completions" = "__tabtab_complete_files__" ]
    set -l matches (commandline -ct)*
    if [ -n "$matches" ]
      __fish_complete_path (commandline -ct)
    end
  else
    for completion in $completions
      echo -e $completion
    end
  end
end

complete -f -d 'pnpm' -c pnpm -a "(_pnpm_completion)"
###-end-pnpm-completion-###
