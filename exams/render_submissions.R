# render Rmd files
# author: Lawrence De Geest

# how it works:
## compile this file with source()
## then in the console run render_subs()
## a bunch of files and directories will appear at the end. self-explanatory
## HEADS UP! make sure you set your directory to the folder in which the submissions live

# what you get
## compiled htmls in their own folder
## folder of submissions that did compile
## folder of submissions that did NOT compile
## success.txt (list of files that rendered and their count)
## failure.txt (list of files that DID NOT render and their count)
## a log file for each submission. this will tell you where (which chunk) compilation failed

## START
# load dependencies just in case .Rmds don't have them
library(tidyverse)
library(broom)

render_subs = function(){
  
  # set up ------------------------------------------------------------------
  # store the .Rmd files
  files = list.files(pattern = paste0(c(".Rmd", ".rmd"), collapse="|"))
  # create an empty directory for logs
  dir.create("logs")
  # create an empty submissions directory
  dir.create("successful_subs")
  dir.create("failed_subs")
  # string to create a directory for rendered Rmd files (string passed to rmarkdown::render)
  output_dir = "compiled_subs"
  # logging
  ## files rendered
  success = file("success.txt", "w")
  write("The following files were rendered: \n\n", success)
  ## files not rendered
  failure = file("failure.txt", "w")
  write("These files were *not* rendered: \n\n", failure)
  
  # render the docs ---------------------------------------------------------
  for (f in files){
    ## drop the extension
    handle = f %>% 
      stringr::str_replace_all(., " ", "-") %>% 
      stringr::str_split(., "\\.") %>% 
      unlist() %>% 
      .[1]
    ## open a log file for the student
    log_file = paste0("logs/", handle, ".txt")
    sink(log_file)
    ## try rendering the submission
    try(
      rmarkdown::render(f, output_format = "html_document", output_dir = output_dir),
      silent = TRUE
    )
    sink()
    ## move the file
    ## check if file was rendered and update logs
    f_compiled = paste0(paste0(output_dir, "/", handle,  ".html"))
    message("\n checking for ", f_compiled, "\n")
    if(file.exists(f_compiled)) {
      # update the success log
      write(paste0(f, "\n"), success, append = TRUE)
      # move the file
      file.copy(from = f, to = paste0("successful_subs/", f))
      # remove the og file
      file.remove(f)
    } else {
      # update the failure log
      write(paste0(f, "\n"), failure, append = TRUE)
      # move the file
      file.copy(from = f, to = paste0("failed_subs/", f))
      # remove the og file
      file.remove(f)
      # in case rmarkdown started rendering the file and created a directory, delete it
      attempted_dir = paste0(output_dir, "/", handle, "_files") 
      if(dir.exists(attempted_dir)) unlink(attempted_dir, recursive = TRUE) 
    }
  }
  
  # count and close ---------------------------------------------------------
  ## should wrap this in loop or at least a function but ran out of time
  
  all_lines_success = readLines("success.txt")
  count_success = all_lines_success[which(all_lines_success!="")] %>% length() %>% -1
  write(paste0("\n\nTOTAL: ", count_success, " (about ", round(100*count_success/length(files),0), "%)"), success, append = TRUE)
  close(success)
  
  all_lines_failure = readLines("failure.txt")
  count_failure = all_lines_failure[which(all_lines_failure!="")] %>% length() %>% -1
  write(paste0("\n\nTOTAL: ", count_failure, " (about ", round(100*count_failure/length(files),0), "%)"), failure, append = TRUE)
  close(failure)
  
  # that's it!
  
}

# END


