#!/usr/bin/env bash

# http://ryan.himmelwright.net/post/scripting-tmux-workspaces/
echo "starting tmux session"

sesh="moaster"

tmux new-session -d -s $sesh

tmux rename-window -t 0 'main'

tmux new-window -t $sesh:1 -n "dmesg"
tmux send-keys -t "dmesg" "dmesg -w" C-m

tmux new-window -t $sesh:2 -n "compile_kernel "
tmux send-keys -t "compile_kernel" "cd kernel_src_local/master_thesis_linux && make"

tmux new-window -t $sesh:3 -n "compile_module "
tmux send-keys -t "compile_module" "cd kernel_src_local" C-m

tmux new-window -t $sesh:4 -n "insert_plan"
tmux send-keys -t "dev_dir" " sudo su && cd /dev" C-m "/home/vagrant/kernel_src_local/pbs_plan_input/write_plan/plan_write.py /home/vagrant/kernel_src_local/pbs_plan_input/write_plan/plan.log"


tmux attach-session -t $sesh:0
