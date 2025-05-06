# --- Begin custom functions for argument-taking npm aliases ---
def npmD [args] { npm i -D $args }
def npmS [args] { npm i -S $args }
def npmg [args] { npm i -g $args }
def npmE [] { let npm_bin = (npm bin | str trim); $env.PATH = $"{npm_bin}:{$env.PATH}" }
# --- End custom functions ---

# Simple aliases
alias npmF = npm i -f
alias npmI = npm init
alias npmL = npm list
alias npmL0 = npm ls --depth=0
alias npmO = npm outdated
alias npmP = npm publish
alias npmR = npm run
alias npmSe = npm search
alias npmU = npm update
alias npmV = npm -v
alias npmi = npm info
alias npmrb = npm run build
alias npmrd = npm run dev
alias npmst = npm start
alias npmt = npm test