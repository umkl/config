function rudi-dev
    # This checks if the session 'dev-environment' is already running
    if tmux has-session -t dev-environment 2>/dev/null
        tmux attach-session -t rudi-dev
    else
        tmuxp load rudi-dev -y # The -y flag skips the confirmation prompt
    end
end
