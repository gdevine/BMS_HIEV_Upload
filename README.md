HIEv Upload Bash Script
==============

A simple bash script to upload BMS data from the S39 glasshouse facility at the Hawkesbury Institute for the Environment into HIEv. This script can be run routinely using a cronjob for example. Once a file has been identified and uploaded into HIEv it is moved from the current directory into an 'uploaded' directory. This acts as a backup of sorts as well as removing it from the pool of files that would be uploaded on the next run.
