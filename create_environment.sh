#!/usr/bin/bash
#In order to cancel/or exit the script when an error is entered, let's use the set command. 

set -e 

#Here I create a variable in which the name of the user is going to be stored by prompting the user to enter his/her name.
#Then this variable will be used to name the folder where tools for the app to work will be located! 

read -p "Hello, enter your name please " NAME

mkdir submission_reminder_$NAME

#Now , I am creating the different component(folders) of the app, and coping each main files into their correspondant folders. 

mkdir submission_reminder_$NAME/app
mkdir submission_reminder_$NAME/modules
mkdir submission_reminder_$NAME/assets
mkdir submission_reminder_$NAME/config

cp reminder.sh submission_reminder_$NAME/app/
cp functions.sh submission_reminder_$NAME/modules/
cp submissions.txt submission_reminder_$NAME/assets
cp config.env submission_reminder_$NAME/config

#Here I am appending 10+ more students records to submissions.txt so that we can test the application better! 
echo "Menes, Git, submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Aseye, Shell Basics, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "David, Shell Navigation, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Annick, Git, submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Teejay, Shell Basics, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Grace, Emacs, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Chisom, vi, submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Annet, vi, submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Bekey, Git, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Alvin, Shell Navigation, submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Theodora, Shell Basics, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Franck, Shell Navigation, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
echo "Ayobamidele, Git, not submitted" >> submission_reminder_$NAME/assets/submissions.txt
#now we are implementing the startup.script. This script just starts up the reminder app when executed
cat <<EOF > submission_reminder_$NAME/startup.sh
#!/bin/bash
#We are using "source" for config.env and functions.sh becouse it reads and executes the content of a file in the current shell session.
source ./config/config.env
source ./modules/functions.sh
#And here we use "bash" since we want it to run in a new subshell.
bash ./app/reminder.sh
EOF

#To make all the files executable, we are using this command:
find submission_reminder_$NAME -type f -name "*.sh" -exec chmod +x {} \;

