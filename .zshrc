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

# Homebrew
# Set DYLD_LIBRARY_PATH due to imcompatibility with Homebrew symlinks
fpath=("/usr/local/bin/" $fpath)
DYLD_LIBRARY_PATH=/System/Library/Frameworks/ImageIO.framework/Versions/A/Resources/

# Python
# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Geant4
# Runs a modified Geant4 source script
source ~/.geant4

# Root
pushd /usr/local >/dev/null; . bin/thisroot.sh; popd >/dev/null

# BDSim
export BDSIM=/usr/local
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$BDSIM/lib
export ROOT_INCLUDE_PATH=$BDSIM/include/bdsim/:$BDSIM/include/bdsim/analysis/:$ROOT_INCLUDE_PATH

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

