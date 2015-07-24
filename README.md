#Getting and Cleaning Data Course Project 

This is ReadMe file for my "run_analysis.R" script.
To get proper result follow next steps.
- 1. Download and unzip data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- 2. Install packages dplyr, tidyr, reshape2
- 3. Set working directory to "UCI HAR Dataset" folder that was unzipped from zip-file in step 1. If you use RStudio press Ctrl-Shift-H and choose the directory.
- 4. Run the script. In RStudio use "source" command on "run_analysis.R" file.
- 5. Result, a tydy data set, is in the file "average_by_subj_and_activity.txt" in the "UCI HAR Dataset" directory. The script works about 26 seconds on my laptop (Intel Core i7-3610QM processor, Windows 7 x64).

Some more comments about my script.
- It loads required libraries automatically. But the libraries have to be already installed. See step 2.
- My script "knows" that it works in "UCI HAR Dataset" folder. So step 3 is very important.


