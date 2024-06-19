#!/bin/env sh

HOME_DIR=~

# Function to sync files to the home directory, excluding certain files/directories
function tripleASetup(){
    stow */ \
    --ignore="shots" \
    --ignore="packages"
}

# Function to handle i3 configuration specific to a laptop
function handle_laptop_default_config(){
    
    # Define the paths to the i3 config files
    I3_CONFIG="$HOME/.config/i3/config"
    LAPTOP_CONFIG="$HOME/.config/i3/config.lp"
    
    # This is to unbind the workspaces from the specific outputs | Default uses three monitors
    WORKSPACE_PATTERN='workspace \$ws[0-9] output'
    sed -i "/$WORKSPACE_PATTERN/d" "$I3_CONFIG"
    
    # Append the laptop-specific configuration to the i3 config file : This is to append the laptop-specific configuration
    echo -e "\n\n# Laptop-specific configuration\n" >> "$I3_CONFIG"
    cat "$LAPTOP_CONFIG" >> "$I3_CONFIG"
    
    # Reload the i3 configuration
    i3-msg reload > /dev/null
}

# Main script logic
if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
    tripleASetup
    if [ "$2" == "--laptop" ]; then
        handle_laptop_default_config
    fi
    elif [ "$1" == "--laptop" ]; then
    read -p "This will overwrite your current setup. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        tripleASetup
        handle_laptop_default_config
    fi
else
    read -p "This will overwrite your current setup. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        tripleASetup
    fi
fi

# Unset the functions to clean up the environment
unset -f tripleASetup
unset -f handle_laptop_default_config
