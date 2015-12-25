# Code Book

Features and activities are first read.

Then data, activity labels, and subjects of the training set are read.

Data column names are set to the features. Activity labels are matched with the activity names. Then subjects and activities are combined with data into one data frame.

The same steps done for the training set is done for the test set.

Then both data frames with subjects, activities, and data are combined into another data frame as the complete set.

The means of each feature grouped by subjects and activities are aggregated. Then mean and standard deviation features are subset out for the final data set.
