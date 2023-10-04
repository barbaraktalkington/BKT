#connect to Azure server
#maybe be helpful to restart r

#install packages (do once)
#install.packages('odbc')
#install.packages('RODBC')

#load libraries
library('odbc') 
library('RODBC') 
library(dplyr) 
library('DBI') 
library(lubridate)

#set up parameters
driver <- '/opt/homebrew/lib/libmsodbcsql.17.dylib'
server <- "rha-bnl-prod.sql.azuresynapse.net"
database <- "rhabnl"

#need to configure the following
uid <- Sys.getenv("SYNAPSE_SQL_ADMIN_USERNAME")
pwd <- Sys.getenv("SYNAPSE_SQL_ADMIN_PASSWORD")

# Create the connection string 
con_str <- paste0(   "Driver={", driver, "};",
                     "Server=", server, ";",
                     "Database=", database, ";",
                     "UID=", uid, ";",
                     "PWD=", pwd )

# if needed install driver msodbcsql17 (using terminal) - (do once)
# brew install microsoft/mssql-release/msodbcsql17

# Establish the connection 
con <- dbConnect(odbc::odbc(), .connection_string = con_str)

#Querying SQL tables:

# Install and load the DBI package
install.packages("DBI")
library(DBI)

# For example, connecting to a MySQL database
data <- dbGetQuery(con, "select * from clients")
