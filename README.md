# Getting-Cleaning-Data
###Datascience Course 3 - Getting &amp; Cleaning Data Assignment 

The script run_analysis.R reads data from Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

### Briefing of the script

1. The feature names are read first.
2. The subject ids (unique identifier of the ones performing the experiment) are read then.
3. The activity ids and activity names are read then
4. The training and testing data are then read
5. Subjects, acivities and data sets are then combined to get the full data set with column names.
6. Ids, activity name and columns having mean and std are extracted
7. It is then aggregated at subject_id, activity_id & activity_name level using mean function to get the final data set
