#!/bin/bash

new_tmux_session() {
  if [[ -n "$1" ]]; then
    session_name="$1"
  else
    echo "Invalid session name provided. Usage: $0 session_name"
    return
  fi 

  echo "Creating a new TMUX session with name: $session_name"

  # Start a new TMUX session with the provided session name
  tmux new-session -d -s "$session_name"

  # Split the window into a 2x2 grid
  tmux split-window -h
  tmux split-window -v
  tmux select-pane -t 1 
  tmux split-window -v

  # Navigate to the directories in each pane
  tmux send-keys -t 1 "cd ~/Desktop/box/projects-by-org/credilinq/credilinq.admin/" Enter
  tmux send-keys -t 1 "yarn dev" Enter

  tmux send-keys -t 2 "cd ~/Desktop/box/projects-by-org/credilinq/credilinq.portal" Enter
  tmux send-keys -t 2 "yarn dev" Enter

  tmux send-keys -t 3 "cd ~/Desktop/box/projects-by-org/credilinq/credilinq.backend" Enter
  tmux send-keys -t 3 "yarn start:dev" Enter

  tmux send-keys -t 4 "cd ~/Desktop/box/projects-by-org/credilinq/credilinq.api" Enter
  tmux send-keys -t 4 "yarn start:dev" Enter

  # Get the address of the first pane
  address=$(tmux display-message -p -F "#{pane_current_path}" -t 1)

  # Create a new window in the TMUX session and navigate to the address of the first pane
  # tmux new-window -n "LazyGit" -c "$address" "cd ~/Desktop/box/projects-by-org/credilinq/credilinq.api/ && lazygit"
  tmux new-window -n "db" -c "$address" "cd ~/Desktop/box/projects-by-org/credilinq/credilinq-db/ && docker compose up"

  code ~/Desktop/box/projects-by-org/credilinq/credilinq.code-workspace

  # Attach to the newly created TMUX session
  tmux attach-session -t "$session_name"

  xdotool key Ctrl+minus
  xdotool key Ctrl+minus
}

if [[ -n "$1" ]]; then
  session_name="$1"
  new_tmux_session "$session_name"
  
  # Open new terminal window and execute tmux attach command to connect to the newly created session
  # xdotool key --clearmodifiers ctrl+alt+t
  # sleep 1
  # xdotool type "tmux attach-session -t $session_name"
  # xdotool key --clearmodifiers Return
else
  echo "Invalid Input. Usage: $0 session_name"
fi
