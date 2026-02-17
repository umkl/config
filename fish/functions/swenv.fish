function swenv --argument-names env_name
    set -l target_file ".env.$env_name"
    
    if test -f "$target_file"
        # Overwrite .envrc with a pointer to the existing file
        # We use source_env because it's built into direnv
                echo "source_env $target_file" > .envrc
                
                # Authorize the change
                direnv allow
                echo "Environment switched! .envrc now tracks: $target_file"
        else
                echo "Error: $target_file does not exist. No changes made."
        end
end
