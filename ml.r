billionaires_2023 <- read.csv("C:/Users/ADMIN/Desktop/usci/billionare_data_for_ml/billionaires_2023.csv")
View(billionaires_2023)
billionaires_2022 <- read.csv("C:/Users/ADMIN/Desktop/usci/billionare_data_for_ml/billionaires_2022.csv")
View(billionaires_2022)
billionaires_2021 <- read.csv("C:/Users/ADMIN/Desktop/usci/billionare_data_for_ml/billionaires_2021.csv")
View(billionaires_2021)
billionaires_2020 <- read.csv("C:/Users/ADMIN/Desktop/usci/billionare_data_for_ml/billionaires_2020.csv")
View(billionaires_2020)
billionaires_2019 <- read.csv("C:/Users/ADMIN/Desktop/usci/billionare_data_for_ml/billionaires_2019.csv")
View(billionaires_2019)

# Extract the 'full_name' column from each data frame
names_2023 <- billionaires_2023$full_name
names_2022 <- billionaires_2022$full_name
names_2021 <- billionaires_2021$full_name
names_2020 <- billionaires_2020$full_name
names_2019 <- billionaires_2019$full_name
# Use the 'intersect' function to find the common names in all data frames
common_names <- Reduce(intersect, list(names_2023, names_2022, names_2021, names_2020, names_2019))
# Get the top 100 common names
top_100_common_names <- head(common_names, 100)
# Print the top 100 common names
print(top_100_common_names)


# Load the ggplot2 package
library(ggplot2)

# Filter the data frames to include only rows where 'full_name' is "Elon Musk"
musk_2023 <- billionaires_2023[billionaires_2023$full_name == "Elon Musk", ]
musk_2022 <- billionaires_2022[billionaires_2022$full_name == "Elon Musk", ]
musk_2021 <- billionaires_2021[billionaires_2021$full_name == "Elon Musk", ]
musk_2020 <- billionaires_2020[billionaires_2020$full_name == "Elon Musk", ]
musk_2019 <- billionaires_2019[billionaires_2019$full_name == "Elon Musk", ]

# Add a 'year' column to each data frame
musk_2023$year <- 2023
musk_2022$year <- 2022
musk_2021$year <- 2021
musk_2020$year <- 2020
musk_2019$year <- 2019

# Combine the data frames into one data frame
musk_data <- rbind(musk_2023, musk_2022, musk_2021, musk_2020, musk_2019)

# Use the 'ggplot' function to create a line graph
ggplot(musk_data, aes(x = year, y = net_worth, group = 1)) +
    geom_line() +
    labs(x = "Year", y = "Net Worth", title = "Growth of Elon Musk's Net Worth") +
    scale_y_continuous(limits = c(min(musk_data$net_worth), max(musk_data$net_worth)))




# Load the ggplot2 and dplyr packages
library(ggplot2)
library(dplyr)

# Filter the data frames to include only rows where 'full_name' is "Elon Musk"
musk_2023 <- billionaires_2023[billionaires_2023$full_name == "Elon Musk", ]
musk_2022 <- billionaires_2022[billionaires_2022$full_name == "Elon Musk", ]
musk_2021 <- billionaires_2021[billionaires_2021$full_name == "Elon Musk", ]
musk_2020 <- billionaires_2020[billionaires_2020$full_name == "Elon Musk", ]
musk_2019 <- billionaires_2019[billionaires_2019$full_name == "Elon Musk", ]

# Add a 'year' column to each data frame
musk_2023$year <- 2023
musk_2022$year <- 2022
musk_2021$year <- 2021
musk_2020$year <- 2020
musk_2019$year <- 2019

# Combine the data frames into one data frame
musk_data <- rbind(musk_2023, musk_2022, musk_2021, musk_2020, musk_2019)

# Arrange the data in ascending order of 'net_worth'
musk_data <- arrange(musk_data, net_worth)

# Use the 'ggplot' function to create a line graph
ggplot(musk_data, aes(x = year, y = net_worth, group = 1)) +
    geom_line() +
    labs(x = "Year", y = "Net Worth", title = "Growth of Elon Musk's Net Worth")




# Filter the data frames to include only rows where 'full_name' is "Bernard Arnault & family"
arnault_2023 <- billionaires_2023[billionaires_2023$full_name == "Bernard Arnault & family", ]
arnault_2022 <- billionaires_2022[billionaires_2022$full_name == "Bernard Arnault & family", ]
arnault_2021 <- billionaires_2021[billionaires_2021$full_name == "Bernard Arnault & family", ]
arnault_2020 <- billionaires_2020[billionaires_2020$full_name == "Bernard Arnault & family", ]
arnault_2019 <- billionaires_2019[billionaires_2019$full_name == "Bernard Arnault & family", ]

# Add a 'year' column to each data frame
arnault_2023$year <- 2023
arnault_2022$year <- 2022
arnault_2021$year <- 2021
arnault_2020$year <- 2020
arnault_2019$year <- 2019

# Combine the data frames into one data frame
arnault_data <- rbind(arnault_2023, arnault_2022, arnault_2021, arnault_2020, arnault_2019)

# Arrange the data in ascending order of 'net_worth'
arnault_data <- arrange(arnault_data, net_worth)

# Use the 'ggplot' function to create a line graph
ggplot(arnault_data, aes(x = year, y = net_worth, group = 1)) +
    geom_line() +
    labs(x = "Year", y = "Net Worth", title = "Growth of Bernard Arnault & family's Net Worth")



# top businesses in last 5 year to land them in top billionare list 
top_2023 <- billionaires_2023[billionaires_2023$rank <= 10, ]
top_2022 <- billionaires_2022[billionaires_2022$rank <= 10, ]
top_2021 <- billionaires_2021[billionaires_2021$rank <= 10, ]
top_2020 <- billionaires_2020[billionaires_2020$rank <= 10, ]
top_2019 <- billionaires_2019[billionaires_2019$rank <= 10, ]

# Combine the data frames into one data frame
top_data <- rbind(top_2023, top_2022, top_2021, top_2020, top_2019)

# Use the 'ggplot' function to create a pie chart
ggplot(top_data, aes(x = "", y = rank, fill = business_category)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0) +
    theme_void() +
    labs(title = "Business Category of Top 10 Billionaires")



library(ggplot2)
library(dplyr)

# Add a 'year' column to each data frame
billionaires_2023$year <- 2023
billionaires_2022$year <- 2022
billionaires_2021$year <- 2021
billionaires_2020$year <- 2020
billionaires_2019$year <- 2019

# Combine the data frames into one data frame
all_data <- rbind(billionaires_2023, billionaires_2022, billionaires_2021, billionaires_2020, billionaires_2019)

# Group the data by 'year' and 'self_made', and count the number of rows in each group
self_made_data <- all_data %>%
    group_by(year, self_made) %>%
    summarise(count = n())

# Use the 'ggplot' function to create a bar graph
ggplot(self_made_data, aes(x = year, y = count, group = self_made, color = self_made)) +
    geom_bar(stat = "identity", position = "dodge", aes(fill = self_made)) +
    geom_line(aes(linetype = self_made), size = 1) +
    labs(x = "Year", y = "Count", fill = "Self Made", color = "Self Made", linetype = "Self Made", title = "Change in Self Made over Last 5 Years")



# Create a function that calculates the total 'net_worth'
calculate_total_net_worth <- function(data) {
    data$net_worth <- as.numeric(sub("B", "", data$net_worth))
    total_net_worth <- sum(data$net_worth, na.rm = TRUE)
    return(total_net_worth)
}

# Apply the function to each of the data frames
total_net_worth_2023 <- calculate_total_net_worth(billionaires_2023)
total_net_worth_2022 <- calculate_total_net_worth(billionaires_2022)
total_net_worth_2021 <- calculate_total_net_worth(billionaires_2021)
total_net_worth_2020 <- calculate_total_net_worth(billionaires_2020)
total_net_worth_2019 <- calculate_total_net_worth(billionaires_2019)

# Print the total 'net_worth' for each year
print(paste("Total net worth of billionaires in 2023:", total_net_worth_2023, "billion"))
print(paste("Total net worth of billionaires in 2022:", total_net_worth_2022, "billion"))
print(paste("Total net worth of billionaires in 2021:", total_net_worth_2021, "billion"))
print(paste("Total net worth of billionaires in 2020:", total_net_worth_2020, "billion"))
print(paste("Total net worth of billionaires in 2019:", total_net_worth_2019, "billion"))



# Load the ggplot2 package
library(ggplot2)

# Create a data frame that contains the total net worth for each year
total_net_worth_data <- data.frame(
    year = c(2023, 2022, 2021, 2020, 2019),
    total_net_worth = c(total_net_worth_2023, total_net_worth_2022, total_net_worth_2021, total_net_worth_2020, total_net_worth_2019)
)

# Use the 'ggplot' function to create a bar graph
ggplot(total_net_worth_data, aes(x = year, y = total_net_worth)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    geom_line(group = 1, colour = "red", size = 1) +
    labs(x = "Year", y = "Total Net Worth (in billion)", title = "Growth of Total Net Worth of Billionaires Over the Years")



# Fit a linear regression model
model <- lm(total_net_worth ~ year, data = total_net_worth_data)

# Predict the 'total_net_worth' for the next two years
next_year_1 <- max(total_net_worth_data$year) + 1
next_year_2 <- max(total_net_worth_data$year) + 2
prediction_1 <- predict(model, newdata = data.frame(year = next_year_1))
prediction_2 <- predict(model, newdata = data.frame(year = next_year_2))

print(paste("Predicted total net worth of billionaires in", next_year_1, ":", prediction_1, "billion"))
print(paste("Predicted total net worth of billionaires in", next_year_2, ":", prediction_2, "billion"))





# Predict the 'total_net_worth' for the next three years
next_year_3 <- max(total_net_worth_data$year) + 3
prediction_3 <- predict(model, newdata = data.frame(year = next_year_3))

# Add the predicted values to the 'total_net_worth_data' data frame
total_net_worth_data <- rbind(total_net_worth_data, data.frame(year = c(next_year_1, next_year_2, next_year_3), total_net_worth = c(prediction_1, prediction_2, prediction_3)))

# Use the 'ggplot' function to create a bar graph
ggplot(total_net_worth_data, aes(x = year, y = total_net_worth)) +
    geom_bar(data = total_net_worth_data[total_net_worth_data$year <= 2023, ], stat = "identity", fill = "steelblue") +
    geom_line(data = total_net_worth_data[total_net_worth_data$year <= 2023, ], group = 1, colour = "red", size = 1) +
    geom_bar(data = total_net_worth_data[total_net_worth_data$year > 2023, ], stat = "identity", fill = "green") +
    geom_line(data = total_net_worth_data[total_net_worth_data$year > 2023, ], group = 1, colour = "orange", size = 1) +
    labs(x = "Year", y = "Total Net Worth (in billion)", title = "Growth of Total Net Worth of Billionaires Over the Years")



# Predict the 'total_net_worth' for the next three years
next_year_3 <- max(total_net_worth_data$year) + 3
prediction_3 <- predict(model, newdata = data.frame(year = next_year_3))

# Add the predicted values to the 'total_net_worth_data' data frame
total_net_worth_data <- rbind(total_net_worth_data, data.frame(year = c(next_year_1, next_year_2, next_year_3), total_net_worth = c(prediction_1, prediction_2, prediction_3)))

# Use the 'ggplot' function to create a line chart
ggplot(total_net_worth_data, aes(x = year, y = total_net_worth)) +
geom_line(data = total_net_worth_data[total_net_worth_data$year <= 2023, ], group = 1, colour = "red", size = 1) +
geom_line(data = total_net_worth_data[total_net_worth_data$year > 2023, ], group = 1, colour = "orange", size = 1) +
labs(x = "Year", y = "Total Net Worth (in billion)", title = "Growth of Total Net Worth of Billionaires Over the Years")