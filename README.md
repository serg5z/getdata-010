* run_analysis script depends on 'reshape2' package. Use install.packages("reshape2") to install it.
* source run_analysis.R into R with source command
* run run_analysis(<path to dataset>) function to obtain a dataset with mean values of mean and std. dev. mesurments. 

The script assumes that the data is downloaded and extracted. Path to the daset directory containing 'test' and 'train' folder should passed as parameter to run_analysis function.

Sript reads and combines X_train.txt and X_text.txt files from train and test directories respectevely.

Column names are assumed to be stored in 'features.txt' file in the root data directory. They are read and assigned to combined X data.

Only columns with names ending with 'mean()' and 'std()' are choosen for later processing.

Data is extended with 'subject' and 'Activity' columns. And finally summarized for each subject and activity. During this phase mean values are calculated for each measurment column in the dataset.
