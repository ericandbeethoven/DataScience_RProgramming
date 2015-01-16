pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  files <- (Sys.glob(paste(directory,"//*.csv", sep = "")))[id];
 
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## Could also validate and error trap for erroneous entries 
  
  combined_data <- c()
  for (file in files) {
    file_data <- read.csv(file, sep = ",");
    pollutant_data <- file_data[,pollutant];
    pollutant_data <- pollutant_data[!is.na(pollutant_data)]
    combined_data <- c(combined_data, pollutant_data)
  }
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  return(mean(combined_data));
}
