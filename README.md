#Code book and description of how the code works

# Code book:

tidy_data.txt contains 180 observations of 89 variables.

The data contains the means and standard deviation of different measures of each individual performing different activities.
More information can be found in the features_info.txt, available at the rep




# Description of how the run_analysis.R script works:

First, we import all the datasets. Be aware of changing the working directory according to where the files are located.
The names of the variables were assigned, as suggested by the provided code book.

The labels and corresponding subject codes were added.

Test and train sets were merged.

Following the provided instructions, only the variables containing the meand and standard deviation of the measurements were considered.

Activity's code was changed by labels.

Data was grouped by activity and subject, following the instructions.

The final output is then saved in a txt text document named tidy_data.txt, inside a folder named data.
