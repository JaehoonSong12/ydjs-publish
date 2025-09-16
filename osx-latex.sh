#!/bin/bash

# Set the script to exit immediately if any command fails.
set -e

echo "Starting the MacTeX installation script for macOS..."
echo ""



echo "Verifying the LaTeX installation..."

# # The MacTeX installer places binaries in a versioned directory and creates a
# # symlink at '/Library/TeX/texbin'. We'll explicitly add this to our PATH
# # for this verification step to ensure it can be found.
# export PATH="/Library/TeX/texbin:$PATH"

if command -v pdflatex &> /dev/null; then
    echo "Success! LaTeX appears to be installed correctly."
    echo "Here is the version information for 'pdflatex':"
    # Print the version of the pdflatex command.
    pdflatex --version
    echo ""
    echo "You are now ready to create documents with LaTeX!"
else
    # This error block runs if 'pdflatex' isn't found in the current session's PATH.
    # We will now attempt to automatically add the path to the user's shell profile.
    echo "Error: 'pdflatex' command not found after installation."
    echo "Attempting to automatically update your shell profile..."

    # Define the line that needs to be added to the profile.
    TEX_PATH_LINE='export PATH="/Library/TeX/texbin:$PATH"'
    SHELL_PROFILE=""

    # Detect the user's shell and set the corresponding profile file path.
    # The $SHELL environment variable holds the path to the user's default shell.
    if [[ "$SHELL" == *"/zsh"* ]]; then
        SHELL_PROFILE="$HOME/.zshrc"
    elif [[ "$SHELL" == *"/bash"* ]]; then
        SHELL_PROFILE="$HOME/.bash_profile"
    fi

    # Proceed only if a known shell profile was detected.
    if [ -n "$SHELL_PROFILE" ]; then
        echo "Detected shell profile: $SHELL_PROFILE"

        # If the profile file exists, check if the TeX path is already in it.
        # The 'grep -qF' command searches for a fixed string (-F) quietly (-q).
        if [ -f "$SHELL_PROFILE" ] && grep -qF "$TEX_PATH_LINE" "$SHELL_PROFILE"; then
            echo "The TeX path is already present in your profile file."
            echo "However, it is not active in the current terminal session."
        else
            echo "Adding the TeX bin path to your profile file..."
            # Append a comment and the export command to the profile file.
            # Using 'printf' ensures it starts on a new line.
            printf "\n# Add MacTeX distribution to PATH\n%s\n" "$TEX_PATH_LINE" >> "$SHELL_PROFILE"
            echo "Successfully updated $SHELL_PROFILE."
        fi

        echo ""
        echo "To apply the changes for future sessions, no action is needed."
        echo "To apply them to your CURRENT session, please run the following command:"
        echo ""
        echo "  source $SHELL_PROFILE"
        echo ""

    else
        # Fallback for unknown shells, providing manual instructions.
        echo "Could not automatically determine your shell profile."
        echo "To fix this, please add the following line to your shell's startup file:"
        echo ""
        echo "  $TEX_PATH_LINE"
        echo ""
        echo "After adding the line, please restart your terminal."
    fi
fi