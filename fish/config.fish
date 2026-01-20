if status is-interactive
    # Commands for interactive sessions can go here
end

set -gx PATH $PATH \
    $HOME/Development/flutter/bin \
    $HOME/Library/Python/3.9/bin \
    $HOME/.cargo/bin \
    /usr/local/bin \
    /opt/homebrew/bin 

# pnpm
set -gx PNPM_HOME "/Users/Hombre/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -U fish_user_paths "$PNPM_HOME" $PATH
end
# pnpm end

alias dpsf="docker ps --format \"table {{.Names}}\t{{.Ports}}\t{{.ID}}\""