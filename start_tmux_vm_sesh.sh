#!/usr/bin/env bash

# http://ryan.himmelwright.net/post/scripting-tmux-workspaces/
echo "starting tmux session"

sesh="master"

tmux new-session -d -s $sesh

tmux rename-window -t 0 'main'
tmux send-keys -t "main" "sudo su" C-m

tmux new-window -t $sesh:1 -n "dmesg"
tmux send-keys -t "dmesg" "dmesg -w" C-m

tmux new-window -t $sesh:2 -n "compile_kernel "
tmux send-keys -t "compile_kernel" "cd kernel_src/master_thesis_linux && make"

tmux new-window -t $sesh:3 -n "compile_module"
tmux send-keys -t "compile_module" "cd kernel_src" C-m

tmux new-window -t $sesh:4 -n "insert_plan"
tmux send-keys -t "insert_plan" "cd /home/vagrant/kernel_src/pbs_plan_copy/" C-m "insert_plan.sh"

tmux new-window -t $sesh:5 -n "dev_dir"
tmux send-keys -t "dev_dir" " sudo su" C-m "cd /dev" C-m

tmux new-window -t $sesh:6 -n "log-dir"
tmux send-keys -t "log-dir" "sudo su" C-m "cd /var/log" C-m "view kern.log"


tmux attach-session -t $sesh:0
