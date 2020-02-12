These are the exact instructions provided by the instructor for the first programming assignment for when the course was taken in July 2019.

Introduction
------------

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file specdata.zip that you can download from the Coursera web site.

Although this is a programming assignment, you will be assessed using a separate quiz.

Data
----

The zip file containing the data can be downloaded here:

[zip file here](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip) (2.4MB)

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air
pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is
contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:

+ Date: the date of the observation in YYYY-MM-DD format (year-month-day)

+ sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)

+ nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file,
do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either
sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

Part 1
------

Write a function named **pollutantmean.R** that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of 
monitors.The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID 
numbers,'pollutantmean'reads that monitors' particulate matter data from the directory specified in the 'directory' argument and 
returnsthe mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as 
follows:

![image1](https://user-images.githubusercontent.com/52377705/74315606-157ab900-4d78-11ea-8b1a-6f2192106a6d.png)

You can see some example output from this function below. The function that you write should be able to match this output. Please save
your code to a file named pollutantmean.R. [example here](https://d3c33hcgiwev3.cloudfront.net/_3b0da118473bfa0845efddcbe29cc336_pollutantmean-demo.html?Expires=1581638400&Signature=aGkUKCVaVzNME2Uy5yUiMr8Dxz2uH55g6xy1nn1BrQpgfBCSRvWiKe9WdtENZ2bJg3mT8t967mTkdq~UjbXpFmNHI~nHXj~hceAXAO89PgJJ1f2MC9vzhtEEwIuWNTZ9qjieudkHBXVzcr-2roU6XFtQNwKqEWkJ4YfjeQExqgI_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A)

Part 2
------

Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function
should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A
prototype of this function follows: 

![image2](https://user-images.githubusercontent.com/52377705/74315814-8a4df300-4d78-11ea-8f98-340b7b6d7338.png)

You can see some example output from this function below. The function that you write should be able to match this output. Please save
your code to a file named **complete.R**. To run the submit script for this part, make sure your working directory has the file complete.R
in it.  [example here](https://d3c33hcgiwev3.cloudfront.net/_3b0da118473bfa0845efddcbe29cc336_complete-demo.html?Expires=1581638400&Signature=F7e0dMC5Dg6Wc35qGkzRcsVWmzugeqtJOgNlHRIMwo65NX1Ni9DDzOzKkGe-3zviRQPoEHOkfeGYPRSCV9HxIQzjHM3SPNHb1IW5EjQfwHwOtvHqlBGbRKwLgbYRpu5uZs8S6PP7HuMaI1BLmlJWjBz6~hv4tBuIAcIhpHNY7sI_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A)

Part 3
------

Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate
and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The
function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold
requirement, then the function should return a numeric vector of length 0. A prototype of this function follows: 

![Image3](https://user-images.githubusercontent.com/52377705/74315978-e31d8b80-4d78-11ea-828f-4512c7bb8cc2.png)

For this function you will need to use the 'cor' function in R which calculates the correlation between two vectors. Please read the help
page for this function via '?cor' and make sure that you know how to use it.

You can see some example output from this function below. The function that you write should be able to approximately match this output.
Note that because of how R rounds and presents floating point numbers, the output you generate may differ slightly from the example
output. Please save your code to a file named **corr.R**. To run the submit script for this part, make sure your working directory has the
file corr.R in it. [example here](https://d3c33hcgiwev3.cloudfront.net/_e92e575b8e62dcb1e3a086d2ff0d5a1e_corr-demo.html?Expires=1581638400&Signature=laaymNg-yZ0zRRD2B3V97q9k-ot7n-gKf7yJSdpPAlEAYoAtanfGocuTGsvptS0XPfWTCT~EO0HqIwc9OjXPdxuvkZF3HOCpgfyjI0X3h7szQqdP7ISNAenO4Wagl6G9jUFQJNpSc84C248~UY7lU4gleyuBslsn67AsNW0JZkU_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A)

Grading
-------

This assignment will be graded using a quiz.
