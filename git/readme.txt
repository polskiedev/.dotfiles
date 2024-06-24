### Exclude like gitignore ###
.git/info/exclude

### gitignore global ###
touch ~/.gitignore_global
git config --global core.excludesFile ~/.gitignore_global
nano ~/.gitignore_global

# Checking
git config --global --get core.excludesFile