#!/bin/bash
#We are using "source" for config.env and functions.sh becouse it reads and executes the content of a file in the current shell session.
source ./config/config.env
source ./modules/functions.sh
#And here we use "bash" since we want it to run in a new subshell.
bash ./app/reminder.sh
