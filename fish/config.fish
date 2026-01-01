# Only execute commands in interactive sessions
if status is-interactive

    # Ensure Homebrew is in the PATH for everything installed via Homebrew
    if type brew &>/dev/null
        set -gx PATH $PATH (brew --prefix)/bin
        set -gx PATH $PATH (brew --prefix)/sbin
    end
end


# Variables
set -g FCONF ~/.config/fish/config.fish
# set -g NCONF ~/.config/nvim

# Aliases
alias clearsimucache="rm -R ~/Library/Developer/CoreSimulator/Caches"
alias spdl="spotifydl"
alias act_scdl="source ~/Music/myenv/bin/activate"
alias py="python3"
alias pip="pip3"
alias hide-desktop-items="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias show-desktop-items="defaults write com.apple.finder CreateDesktop true; killall Finder"
alias work="timer 50m && osascript -e 'display notification \"☕\" with title \"Work Timer is up!\" subtitle \"Take a Break 😊\" sound name \"Crystal\"'"
alias workc='function work_alias; timer $argv[1] && osascript -e "display notification \"☕\" with title \"Work Timer is up!\" subtitle \"Take a Break 😊\" sound name \"Crystal\"" && say "Phase complete"; end; work_alias'
alias workt="timer $argv[1] && osascript -e 'display notification \"☕\" with title \"Work Timer is up!\" subtitle \"Take a Break 😊\" sound name \"Crystal\"' && say \"Phase complete\""
alias rest="timer 10m && terminal-notifier -message 'Pomodoro' -title 'Break is over! Get back to work 😬' -appIcon '~/Pictures/pumpkin.png' -sound Crystal"
alias loadsoundc="source ~/Music/myenv/bin/activate"
alias dpsf="docker ps --format \"table {{.Names}}\t{{.Ports}}\t{{.ID}}\""

# Set environment variables and update PATH
set -gx PATH $PATH /usr/local/go
set -gx PATH $PATH /Users/michael/Development/flutter/bin
set -gx PATH $PATH /Users/michael/Library/Python/3.9/bin
set -gx PATH $PATH $HOME/.maestro/bin
set -gx PATH $PATH /opt/homebrew/opt/ruby/bin

# Make sure Homebrew is available in the path for everything installed via Homebrew
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

# SSH key setup (commented out until needed)
# ssh-add ~/.ssh/waterbyte-worker
# chmod 600 ~/.ssh/waterbyte-worker

# Set prompt
set -g PROMPT 'bloke@%m:%~%# '


# nodejs

#set -gx NVM_DIR (brew --prefix nvm)
#bass source (brew --prefix nvm)/nvm.sh --no-use
fnm env | source


# Ensure fnm is loaded
if not type -q fnm
    source (fnm env --use-on-cd | psub)
end

# Set Node version to 20
fnm use 20

eval (direnv hook fish)
eval (direnv hook fish)
alias dc='docker-compose'

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

set -x HUSKY 0


# Created by `pipx` on 2025-07-25 14:37:17
set PATH $PATH /Users/bloke/.local/bin

# pnpm
set -gx PNPM_HOME "/Users/bloke/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bloke/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/bloke/Downloads/google-cloud-sdk/path.fish.inc'; end
