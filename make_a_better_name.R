# Function to create a readable column name

make_a_better_name <- function(my_name){
  # The subject and activity columns are clear already and need no change
  if (my_name == "Subject" || my_name == "Activity")
  {
    return_string <- my_name
    return(return_string)
  }
  
  # Measurement type
  location_first_hyphen <- regexpr("-", my_name) - 1
  return_string <- substr(my_name, 2, location_first_hyphen)
  return_string <- paste0(return_string,"_")
  
  # Including coordinate if any
  if (grepl("[Xx]$", my_name))
    return_string <- paste0(return_string,"X_")
  
  if (grepl("[Yy]$", my_name))
    return_string <- paste0(return_string,"Y_")
  
  if (grepl("[Zz]$", my_name))
    return_string <- paste0(return_string,"Z_")
  
  #Determine mean vs std dev
  if (grepl("mean", my_name)) 
    return_string <- paste0(return_string,"Mean_")
  
  if (grepl("std", my_name)) 
    return_string <- paste0(return_string,"StandardDev_")
  
  #Determine time vs frequency
  if (grepl("^t", my_name)) 
    return_string <- paste0(return_string,"Time")
  
  if (grepl("^f", my_name)) 
    return_string <- paste0(return_string,"Frequency")
  
  #Change mag with magnitude
  return_string <- sub("[Mm]ag", "Magnitude", return_string)
  
  return(return_string)
}