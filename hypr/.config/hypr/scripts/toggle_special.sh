
#!/bin/bash

# Get current workspace
current=$(hyprctl activeworkspace | awk '{print $2}')

if [ "$current" == "special" ]; then
    # Go back to last workspace
    hyprctl dispatch workspace number $LAST
else
    # Save last workspace
    LAST=$current
    hyprctl dispatch workspace special
fi
