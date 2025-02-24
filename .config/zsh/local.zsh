# local configurations
export OPENAI_API_KEY=$(op item get 'rgxhrxsbuaqgr4gur4vfnbamx4' --fields 'credential' --reveal)
source <(kubectl completion zsh)
