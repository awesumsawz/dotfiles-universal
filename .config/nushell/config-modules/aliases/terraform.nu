# --- Begin custom functions for argument-taking terraform aliases ---
# (none needed, all are static)
# --- End custom functions ---

# Simple aliases
alias tf = terraform
alias tfa = terraform apply
alias tfaa = terraform apply -auto-approve
alias tfc = terraform console
alias tfd = terraform destroy
alias 'tfd!' = terraform destroy -auto-approve
alias tff = terraform fmt
alias tffr = terraform fmt -recursive
alias tfi = terraform init
alias tfiu = terraform init -upgrade
alias tfo = terraform output
alias tfp = terraform plan
alias tfs = terraform state
alias tfsh = terraform show
alias tft = terraform test
alias tfv = terraform validate