# SuspiciousActivity
This is a repo for a bash script that will be run every day at midnight in order to identify suspicious login activity.
## Key parts to this script
 - Define the log file to be analyzed.
 - Define the output file for suspicious activity.
 - Define the keywords that indicate suspicious activity.
 - Read through the log file line by line.
 - Check if the line contains any of the suspicious keywords.
 - Log the completion of the analysis.

## Useaful Commands I leaned while doing my own research for this script
 * Using a "IFS= ": (Internal Field Separator) with an empty space value to ensure whitespace in lines are not trimmed.
     - this command makes it so that whatever value it is set it to becomes the separator ex: IFS=,  then if you have {Marie, Milly, Maurice, gabriel} the names on this list will be separated by the ,. 
 
 * read -r line: By using read -r, makes it so the backslashes are preserved, and the input data remains unchanged.
    - (This is particularly important when dealing with log files or any input where backslashes are significant).
 * Tee -a: this command reads from standard input and writes to both standard output and the specified file(s).
    - So when this command is used it will take the input and show it on the terminal and also put the info into a file.
    - Is like doing cat and > or >> if we add the -a (append) flag.
    - -a This flag stands for "append". Instead of overwriting the file, it appends the new content to the end of the file.
 * /dev/null: while not specifically a command this is a special file in Unix-like operating systems that discards all data written to it.
    - aka the black hole.
    - aka the abyss.
    - This is where you send anyhting you don't want in this case I wanted to use the tee command but did not want the output that displays on the terminal to be displayed so using > /dev/null makes the output that was supposed to go to the terminal to get sent into the abyss.
   ## Issues/ trouble shooting
    *When I first ran the script did not run and gave me this error
   ![Screenshot (68)](https://github.com/user-attachments/assets/e44745d2-eff0-44a6-943b-125e4d5f0db9)
   - After carefully looking trough the script I found what may be the cause.
      ```
       if [ "$line" == *"$keyword"* ]]
     #This command is missing a squarebracket between the if and line
      ```
  * That issue is now fixed and my script works

 # conclusion
 - The script initializes by defining the necessary file paths and keywords.
 - It then clears the previous output log to ensure a fresh start.
 - It reads the auth_log.log file line by line, checking each line for suspicious keywords.
 - If a line contains a keyword, it appends the line to suspicious_activity.log.
 - The script ensures that each line is processed efficiently, making it suitable for automation via a daily cron job.

  
