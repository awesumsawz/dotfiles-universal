# --- Begin custom functions for argument-taking php artisan aliases ---
# (none needed, all are static)
# --- End custom functions ---

# Simple aliases
alias art = php artisan
alias artisan = php artisan
alias bob = php artisan bob::build
alias migrate = php artisan migrate
alias pacac = php artisan cache:clear
alias pacoc = php artisan config:clear
alias pads = php artisan db:seed
alias pam = php artisan migrate
alias pamc = php artisan make:controller
alias pamcl = php artisan make:class
alias pame = php artisan make:event
alias pamen = php artisan make:enum
alias pamf = php artisan migrate:fresh
alias pamfa = php artisan make:factory
alias pamfs = php artisan migrate:fresh --seed
alias pami = php artisan make:interface
alias pamj = php artisan make:job
alias paml = php artisan make:listener
alias pamm = php artisan make:model
alias pamn = php artisan make:notification
alias pamp = php artisan make:policy
alias pampp = php artisan make:provider
alias pamr = php artisan migrate:rollback
alias pams = php artisan make:seeder
alias pamt = php artisan make:test
alias pamtr = php artisan make:trait
alias paopc = php artisan optimize:clear
alias paqf = php artisan queue:failed
alias paqft = php artisan queue:failed-table
alias paql = php artisan queue:listen
alias paqr = php artisan queue:retry
alias paqt = php artisan queue:table
alias paqw = php artisan queue:work
alias paroc = php artisan route:clear
alias pas = php artisan serve
alias pats = php artisan test
alias pavic = php artisan view:clear
alias tinker = php artisan tinker

# Laravel Sail aliases
alias sail = ./vendor/bin/sail
alias pest = ./vendor/bin/pest