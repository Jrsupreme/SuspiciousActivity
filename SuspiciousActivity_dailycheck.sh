#!/bin/bash

# Define the log file to be analyzed
log_file="/var/log/auth_log.log"

# Define the output file for suspicious activity
output_file="/var/log/suspicious_activity.log"

# Define the keywords that indicate suspicious activity
suspicious_keywords=("Failed password" "Unauthorized access" "error: Could not load host key" "error: PAM: Authentication failure")  

# Clear the output file if it exists
sudo bash -c "echo '' > $output_file" 

# Read through the log file line by line
# Check if the line contains any of the suspicious keywords
while IFS= read -r line
do
    for keyword in "${suspicious_keywords[@]}"
    do
        if [[ "$line" == *"$keyword"* ]]
        then
            #If a keyword is found, append the line to the output file.
            echo "$line" | sudo tee -a "$output_file" > /dev/null #/dev/null/ to send the terminal output into the abyss before it is shown on screen.
        fi
    done
done < "$log_file" #to specify that the while loop reads from "$log_file".

# Let the user know results have been sent to the designated file
echo "Suspicious activity log created at $output_file"
