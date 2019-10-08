#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Options
setopt AUTO_CD
setopt ZLE
setopt NO_HUP

# Alias
alias cern='cd /Users/chernals/OneDrive\ -\ Université\ Libre\ de\ Bruxelles/cernbox'
alias iba='cd /Users/chernals/OneDrive\ -\ Université\ Libre\ de\ Bruxelles/ibabox'
alias ulb='cd /Users/chernals/OneDrive\ -\ Université\ Libre\ de\ Bruxelles/ulbbox'
alias mebox='cd /Users/chernals/OneDrive\ -\ Université\ Libre\ de\ Bruxelles/me'
alias reps='cd ~/reps'
alias jn='ca base && jupyter notebook'
alias gitsh="perl -nE 'BEGIN {print \"git > \"} system \"git $_\"; print \"git > \"'"

# GPG
export GPG_TTY=`tty`

# Homebrew
# Set DYLD_LIBRARY_PATH due to imcompatibility with Homebrew symlinks
fpath=("/usr/local/bin/" $fpath)
DYLD_LIBRARY_PATH=/System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/

# Bison
export PATH=/usr/local/opt/bison/bin:$PATH

# Python
# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Geant4
pushd /usr/local/bin >/dev/null; . ./geant4.sh; popd >/dev/null

# Root
pushd /usr/local >/dev/null; . bin/thisroot.sh; popd >/dev/null

# BDSim
pushd /usr/local >/dev/null; . bin/bdsim.sh; popd >/dev/null

# Conda
fpath+=/Users/chernals/reps/conda-zsh-completion
zstyle ':completion::complet:*' use-cache 1
source /Users/chernals/miniconda3/etc/profile.d/conda.sh
function ca () {
	[[ -z "$1" ]] && conda deactivate || conda activate $1
}

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Environment variables
export GIT_EDITOR=vi
export EDTITOR=vi
export VISUAL=vi

# Functions
function channel {
	cd /Users/chernals/Université\ Libre\ de\ Bruxelles/Metronu\ -\ AP\ -\ Documents/;
	cd $1;
}
