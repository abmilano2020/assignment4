
### Codebook

<p>

 

</p>

#### The first two columns of the tidy data set *tidy\_data.txt* show:

1.  *Subject*, who is using the device  
2.  *Activity*

The residual columns are all about the accelerometer and gyroscope
data.  
For a comprehensive list, please have a look at the *features.txt* file
in your work directory.

<p>

 

</p>

#### What the script actually does:

The data are read in and simplified to be used for later analysis  
The wanted measurements and features are defined (means, standard
deviations)  
Only the relevant data are read in to memory.  
The above steps are run for the two sets of data (training, test)  
Transform activity names to factors  
Subjects and activities are reshaped to a variables of two independent
columns.  
Eventually write the data TXT file

<p>

 

</p>

#### Manipulate the data step-by-step:

  - step 1: uploading the needed library  
  - step 2: getting activity measurements, labels and features  
  - step 3: loading and merging training data  
  - step 4: loading and merging test data  
  - step 5: merging training and test data  
  - step 6: turning into factors  
  - step 7: ordering data  
  - step 8: writing the tidy data .txt file
