# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "git could not be found, please install git first."
    exit 1
fi

# Define the target directory
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Create the target directory if it doesn't exist
mkdir -p "$ZSH_CUSTOM/plugins"

# Clone the zsh-autosuggestions repository
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions already exists, skipping clone."
fi

# Clone the zsh-syntax-highlighting repository
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting already exists, skipping clone."
fi