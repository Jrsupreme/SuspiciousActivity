# SuspiciousActivity
This is a repo for a bash script that will be run every day at midnight in order to identify suspicious login activity.
## Key parts to this script
 - Define the log file to be analyzed.
 - Define the output file for suspicious activity.
 - Define the keywords that indicate suspicious activity.
 - Read through the log file line by line.
 - Check if the line contains any of the suspicious keywords.
 - Log the completion of the analysis.

## Useaful Commands I leaned while doing my own research
 * Using a "IFS= " (Internal Field Separator) with an empty space value to ensure whitespace in lines are not trimmed.
     - this command makes it so that whatever value it is set it to becomes the separator ex: IFS=,  then if you have {Marie, Milly, Maurice, gabriel} the names on this list will be separated by the ,. 
 
 * read -r line By using read -r, makes it so the backslashes are preserved, and the input data remains unchanged.
    - (This is particularly important when dealing with log files or any input where backslashes are significant)
 * Tee -a this command reads from standard input and writes to both standard output and the specified file(s).
    - So when this command is used it will take the input and show it on the terminal and also put the info into a file.
    - Is like doing cat and > or >> if we add the -a (append) flag.
    - -a This flag stands for "append". Instead of overwriting the file, it appends the new content to the end of the file.
