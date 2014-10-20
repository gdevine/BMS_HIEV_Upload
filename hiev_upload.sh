#!/bin/bash
#
# Script that auto uploads BMS data from the S30 glasshouse into HIEv nightly. Once data has been uploaded
# it is moved to the uploaded folder.
#
# Gerard Devine, October 2014
#   


# Set the description to be attached to each dataset upload
description="This dataset contains environment monitoring data from the S39 glasshouse facility based at the Hawkesbury Insitute for the Environment at the University of Western Sydney. Each dataset is a zip file of daily CSV data covering the variables CO2 Sensor, Zone Humidity and Zone Temperature across AC rooms 1 to 8 as well as trend_oarh, trend_oatemperature and wind direction-trend for outside air. The date is included in the actual filename."


#First initialise log file with current date
printf " -------------\n" >> log.txt
printf "Date = $(date) \n" >> log.txt
printf " -------------\n" >> log.txt

# Loop through all files in the current directory
for entry in *
do
  # Only target files beginning BMS_S39_ and have .zip filetype
  if [[ $entry =~ BMS_S39_* && $entry == *.zip ]] ; then
    
    # Perform the Upload
    printf "\n$entry uploading" >> log.txt
    curl -i -F "file=@$entry" -F "from_date = 2014-01-01" -F "experiment_id=43" -F "description=$description" -F "type=RAW" https://hiev.uws.edu.au/data_files/api_create?auth_token=<YOUR_API_KEY>
    printf "\n$entry uploaded!" >> log.txt
    
    # Move the file to the uploaded folder so that it is not reuploaded in the future
    mv $entry uploaded
    printf "\n$entry file moved to uploaded folder\n" >> log.txt
  fi
done
