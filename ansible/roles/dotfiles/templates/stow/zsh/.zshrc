# Path to your oh-my-zsh installation.
export ZSH={{ default_user.home }}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker gitfast pyenv)

# User configuration

export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
export MANPATH="$HOME/.node/share/man:$MANPATH"
export PATH="{{ default_user.home }}/.node/bin:{{ default_user.home }}/bin:{{ default_user.home }}/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PGPORT=15432

source $ZSH/oh-my-zsh.sh

# Powerline
{%- if ansible_os_family == 'MacOS' %}
  export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config
  export POWERLINE_COMMAND=/usr/local/bin/powerline
  . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
{% elif ansible_os_family == 'Archlinux' %}
  export POWERLINE_CONFIG_COMMAND=/usr/bin/powerline-config
  export POWERLINE_COMMAND=/usr/bin/powerline
  . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
{% elif ansible_os_family in ('Debian', 'Ubuntu') %}
  . /usr/local/lib/python3.5/dist-packages/powerline/bindings/zsh/powerline.zsh
{% endif -%}

{%- if ansible_os_family == 'MacOS' %}
# Nodenv
eval "$(nodenv init -)"
{% endif -%}

# All other custom config options have been moved into
# $ZSH_CUSTOM/