function dev_start
    # Start a new tmux session (detached) named 'dev'
    tmux new-session -d -s dev -n 'services'
    
    # Run the first command in the initial pane
    tmux send-keys -t dev "api_command_here" C-m
    
    # Split for the second command
    tmux split-window -v -t dev
    tmux send-keys -t dev "msc_command_here" C-m
    
    # Split for the third command
    tmux split-window -v -t dev
    tmux send-keys -t dev "msp_command_here" C-m
    
    # Equalize the space so they aren't squashed
        tmux select-layout -t dev even-vertical
    
        # Attach to the session
        tmux attach-session -t dev
end
