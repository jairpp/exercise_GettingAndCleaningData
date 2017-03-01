CODEBOOK for tidyGroupedData.csv
================

Data set used on this project, called Human Activity Recognition Using Smartphones Dataset, came from here: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Human Activity Recognition Using Smartphones Dataset
----------------------------------------------------

#### Experiment description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

#### Collected data

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features\_info.txt' for more details.

#### For each record it is provided:

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

Generated tidyGroupedData.csv dataset
-------------------------------------

Human Activity Recognition Using Smartphones Dataset was processed by run\_analysis.R and resulted on tidyGroupedData.csv dataset.

#### Process

-   Train and Test datasets were merged
-   Only feature means and standard deviations were keept for all windows, subjects and activities.
-   Data were grouped by subjects and activities
-   Ffeatures means and standard deviations were summirized by mean

#### codebook

-   subject: integer from 1 to 30 to identify the subject of the study
-   activity: factor to identify the real activity been executed while data were collected:

``` r
activity_labels
```

    ##   code              label
    ## 1    1            WALKING
    ## 2    2   WALKING_UPSTAIRS
    ## 3    3 WALKING_DOWNSTAIRS
    ## 4    4            SITTING
    ## 5    5           STANDING
    ## 6    6             LAYING

##### Mesurements variable:

Mesurements variable are formed by te following parts in this order:

-   't' or 'f'.
    -   't' extends for Time domain
    -   'f' extends for Frequency domain
-   feature
    -   bodyacc for Body acceletarion
    -   gravityacc for Gravity Acceleration
    -   bodygyro for Body gyroscope
-   jerk identifygng jerk transformation
-   mag identifying magnitude
-   mean or std for
-   x, y or z cordinates
