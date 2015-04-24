1. Load the data, and name the columns in subject and activities tables for further purpose of combining this in next steps ("subjectID","activityID").
2. Combine the two data sets(training and testing) by rbind into one, named "data". (I have tried merging all sets at once, but then there would be some errors that I could not fix
in variable names etc., so I decided to combine X_sets, then Y_sets and then subjects and activities sets).
3. Load the features table, and put it into object labels, then I use this to rename the variables in the merged set ("data").
4. Find the means and sd columns by grep function, then subset data by this filter, and I put it into new data set "filterdata".
This has to be done before the merging, in order to save the subjects and activity columns needed for the next quesiton.

5. Now I combine the subject data sets by rbind.
6. Then I combine activities data sets, and label them through the activity_labels data.

7. Now I combine the three datasets - subjects, activities, and "filterdata" - set which contains columns of means and standard deviations.
8. Final step, I am using the reshape2 package to create new data set with calculated means for each subject for each activity, by melting ther merged data, and then calculating means on each activity measure by dcast.
activityID and activityLabel, and write it into Calculated_Data.txt.



