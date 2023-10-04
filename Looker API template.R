install.packages('devtools') 
devtools::install_github("looker/lookr", ref = "api-4.0") 

library(lookr) 

CREDENTIALS <- "/Volumes/dept_shares/Impact/API Keys/Barbara Talkington/Looker API_BKT.ini"

sdk <- LookerSDK$new(configFile = CREDENTIALS) 


CONNECTION <- "wa_connection_model" 

VIEW = "base"

FIELDS <- c( 
  "enrollments.id", 
  "client_assessments.id", 
  "static_demographics.race_text", 
  "enrollments.end_date",
  "enrollments.start_date")

results <- sdk$runInlineQuery( 
  model = CONNECTION, 
  view = VIEW, 
  fields = FIELDS, 
  limit = -1, #this returns all records. The default is 500 
  queryTimezone = "America/Los_Angeles" ) 

df <- as.data.frame(do.call(rbind, results))  
print(df)


LOOK_ID = 80809  
RESULT_FORMAT = "csv" 
LIMIT = -1

data <- sdk$runLook(lookId = 80809)
look <- as.data.frame(do.call(rbind, data))  

