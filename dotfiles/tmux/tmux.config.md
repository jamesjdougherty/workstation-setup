### TMUX Config ###

```
set -g default-terminal "xterm-256color"
#set -ga terminal-overrides ",*256col*:Tc"
set -ga terminal-overrides ",xterm-256color:Tc"

unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
set -g status-style 'bg=#333333 fg=#5eacd3'

bind r source-file ~/.tmux.conf
set -g base-index 1

set-window-option -g mode-keys vi
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# vim-like pane switching
bind -r ^ last-window
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R

# Moving window
bind-key -n C-S-Left swap-window -t -1 \; previous-window
bind-key -n C-S-Right swap-window -t +1 \; next-window

# Resizing pane
bind -r C-k resize-pane -U 5
bind -r C-j resize-pane -D 5
bind -r C-h resize-pane -L 5
bind -r C-l resize-pane -R 5

#### basic settings

set-option -g status-justify "left"
#set-option utf8-default on
#set-option -g mouse-select-pane
set-window-option -g mode-keys vi
#set-window-option -g utf8 on
# look'n feel
set-option -g status-fg cyan
set-option -g status-bg black
set -g pane-active-border-style fg=colour166,bg=default
set -g window-style fg=colour10,bg=default
set -g window-active-style fg=colour12,bg=default
set-option -g history-limit 64096

set -sg escape-time 10

#### COLOUR

# default statusbar colors
set-option -g status-style bg=colour235,fg=colour136,default

# default window title colors
set-window-option -g window-status-style fg=colour244,bg=colour234,dim

# active window title colors
set-window-option -g window-status-current-style fg=colour166,bg=default,bright

# pane border
set-option -g pane-border-style fg=colour235 #base02
set-option -g pane-active-border-style fg=colour136,bg=colour235

# message text
set-option -g message-style bg=colour235,fg=colour166

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

# allow the title bar to adapt to whatever host you connect to
set -g set-titles on
set -g set-titles-string "#T"

```