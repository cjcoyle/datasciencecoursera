READ ME
=======

This repository contains a single script, run_analysis.R, that processes the raw data into a long-form tidy data set. The raw data for this project is contained in six separate files: test/X-test.txt, test/y_test.txt, test/subject_test.txt, train/X_train.txt, train/y_train.txt and train/subject_train.txt. Note that all of these file paths are relative to the working directory in which the run_analysis.R script is contained. The script combines all of these files into one data frame, which contains 563 variables and 10,299 observations. Two additional files, features.txt and activity_label.txt, were also used to add appropriate variable names to the data set and to create labels for the "activity" variable, respectively. Note that additional editing was also performed on both the variable names and the label values in order to make them consistent and descriptive. Next, all variables that did not measure either the mean or the standard deviation of a given feature (with the exceptions of the "subject" and "activity" variables) were removed from the data set. This reduced the number of variables from 563 to 68. Finally, the data set was reshpaed to produce a long-form tidy data set that contains 4 variables and 11,880 observations. 

This repository also contains a code book, CodeBook.md, that conveys information about the experimental design, details concerning the four variables in the tidy data set, and a link to the original source of the data.






