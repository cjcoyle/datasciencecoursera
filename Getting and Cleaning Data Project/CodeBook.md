Code Book
=========

Study Design
------------

The data for this project was collected from the [Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html) of the University of California, Irvine. This data was generated by an experiment conducted by researchers from the Nonlinear Complex Systems Laboratory at the University of Genoa. The experiment studied 30 adults as they performed six typical daily activities, including walking, standing and climbing stairs. The 30 participants all wore smartphones containing both an accelerometer and a gyroscope that recorded basic raw data during the experiment. A variety of transformations were performed to create additional signals from this raw data, and various summary statistics, such as the mean and standard deviation, were calculated for each of the features.

Additional details and the raw data from this experiment can be obtained from the following web page: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Variables
---------

In the long-form tidy data set that is generated from the run_analyis.R script, an observation is defined to be a specific feature (e.g. the mean body acceleration signal in the time domain in the X direction) for a specific activity (e.g. sitting) measured for one subject in the experiment. Each subject performed 6 activities in the experiment, and each activitiy has 66 different features associated with it. In all cases, the value associated with each observation in the tidy data set is the average of all values recorded for that observation during the experiment.

The long-form tidy data set contains four variables. These four variables are listed below:

1. subject

	- An integer variable that ranges from 1 to 30.
	- This identifies the subject of the experiment. Each subject in the experiment has a unique numerical identifier.

2. feature
	- A factor variable
	- This identifies the feature that is being measured for a given observation in the experiment. There are 66 features per subject in this data set.
	- Each factor value is structured in a consistent format for easier comprehension. The structure is ordered as follows:
		1. Domain (2 possible values)
			- time
			- freq (frequency)
		2. Signal (2 possible values)
			- Body
			- Gravity
		3. Device (2 possible values)
			- Acc (accelerometer)
			- Gyro (gyroscope)
		4. Measurement (3 possible values, if applicable)
			- Jerk (the change in acceleration)
			- Mag (magnitude, as measured by the Euclidean norm)
			- JerkMag (jerk and magnitude)
		5. Statistic (2 possible values)
			- Mean (average)
			- StdDev (standard deviation)
		6. Direction (3 possible values, if applicable)
			- X (x-direction)
			- Y (y-direction)
			- Z (z-direction)
	- Examples of features include the following:
		1. freqBodyAccJerkMeanX
			- Domain: Frequency
			- Signal: Body
			- Device: Accelerometer
			- Measurement: Jerk
			- Statistic: Mean
			- Direction: X
		2. timeGravityAccStdDevY
			- Domain: Time
			- Signal: Gravity
			- Device: Accelerometer
			- Measurement: None
			- Statistic: Standard Deviation
			- Direction: Y
		3. freqBodyGyroJerkMagMean
			- Domain: Frequency
			- Signal: Body
			- Device: Gyroscope
			- Measurement: Jerk and Magnitude
			- Statistic: Mean
			- Direction: None
		4. Use the code "levels(tidyData$features)" to retrieve all 66 values of this variable.

3. activity
	- A factor variable
	- This identifies the activity performed by the subject. There are six possible activities in this data set:
		1. Walking
		2. Walking Upstairs
		3. Walking Downstairs
		4. Sitting
		5. Standing
		6. Laying

4. meanValue
	- A continuous, numerical variable
	- The average value for the given observation