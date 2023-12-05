Billionaires.Statistics.Dataset <- read.csv("C:/Users/ADMIN/Desktop/usci/billionare_data/Billionaires Statistics Dataset.csv")
Billionaires.Statistics.Dataset <- Billionaires.Statistics.Dataset[!duplicated(Billionaires.Statistics.Dataset), ]
Billionaires.Statistics.Dataset <- Billionaires.Statistics.Dataset[!is.na(Billionaires.Statistics.Dataset$gross_tertiary_education_enrollment), ]
View(Billionaires.Statistics.Dataset)


dim(Billionaires.Statistics.Dataset)
head(Billionaires.Statistics.Dataset)
tail(Billionaires.Statistics.Dataset)
summary(Billionaires.Statistics.Dataset)
nrow(Billionaires.Statistics.Dataset)
ncol(Billionaires.Statistics.Dataset)
names(Billionaires.Statistics.Dataset)

# Sort the dataset by the 'rank' column in ascending order
sorted_rank_dataset <- Billionaires.Statistics.Dataset[order(Billionaires.Statistics.Dataset$rank), ]
# Select the top 20 individuals by rank
top_20_rank_individuals <- head(sorted_rank_dataset, 20)
# Concatenate 'personName' and 'source'
person_source <- paste(top_20_rank_individuals$personName, top_20_rank_individuals$source, sep = " - ")
# Print the 'personName' and 'source' of the top 20 ranked individuals
print(person_source)



category_counts <- table(Billionaires.Statistics.Dataset$category)
# Calculate percentages
category_percentages <- round(category_counts / sum(category_counts) * 100)
# Create labels
labels <- paste(names(category_percentages), ": ", category_percentages, "%", sep="")
# Draw pie chart with labels
pie(category_counts, main = "Pie Chart of Category", col = rainbow(length(category_counts)), labels = labels)


industry_counts <- table(Billionaires.Statistics.Dataset$industries)
# Draw histogram
barplot(industry_counts, main = "Histogram of Industries", xlab = "Industry", ylab = "Frequency")


Billionaires.Statistics.Dataset$selfMade <- ifelse(Billionaires.Statistics.Dataset$selfMade, "Self Made", "Inherited")
selfMade_counts <- table(Billionaires.Statistics.Dataset$selfMade)
# Calculate percentages
selfMade_percentages <- round(selfMade_counts / sum(selfMade_counts) * 100)
# Create labels
labels <- paste(names(selfMade_percentages), ": ", selfMade_percentages, "%", sep="")
# Draw pie chart with labels
pie(selfMade_counts, main = "Pie Chart of Self Made", col = rainbow(length(selfMade_counts)), labels = labels)


gender_counts <- table(Billionaires.Statistics.Dataset$gender)
# Calculate percentages
gender_percentages <- round(gender_counts / sum(gender_counts) * 100)
# Create labels
labels <- paste(names(gender_percentages), ": ", gender_percentages, "%", sep="")
# Draw pie chart with labels
pie(gender_counts, main = "Pie Chart of Gender", col = rainbow(length(gender_counts)), labels = labels)


#counts
total_finalWorth <- sum(Billionaires.Statistics.Dataset$finalWorth, na.rm = TRUE)
total_finalWorth_f <- total_finalWorth / 1000
# Print total_finalWorth in billion
print(paste(total_finalWorth_f, "billion USD"))

# # Sort the dataset by 'rank' in ascending order
# sorted_rank_dataset <- Billionaires.Statistics.Dataset[order(Billionaires.Statistics.Dataset$rank), ]
# # Select the top 10 countries by rank
# top_10_rank_countries <- head(sorted_rank_dataset, 10)
# # Sort the top 10 ranked countries by 'gdp_country' in descending order
# top_10_rank_countries <- top_10_rank_countries[order(-top_10_rank_countries$gdp_country), ]
# # Concatenate 'personName' and 'gdp_count'
# concatenated_names <- paste(top_10_rank_countries$personName, top_10_rank_countries$gdp_count, sep = " - ")
# # Print the concatenated names and gdp_count
# print(concatenated_names)


# Mean of the total worth
mean_finalWorth <- mean(Billionaires.Statistics.Dataset$finalWorth, na.rm = TRUE)
print(mean_finalWorth)


# Filter 'birthYear' to include only years from 1940 onwards
birthYear_filtered <- Billionaires.Statistics.Dataset$birthYear[Billionaires.Statistics.Dataset$birthYear >= 1940]
# Count the occurrences of each year
birthYear_counts <- table(birthYear_filtered)
# Draw bar graph
barplot(birthYear_counts, main = "Bar Graph of Birth Year (1940 onwards)", xlab = "Birth Year", ylab = "Frequency")


# Create a frequency table of the 'source' column
source_counts <- table(Billionaires.Statistics.Dataset$source)
# Sort the frequency table in descending order
sorted_source_counts <- sort(source_counts, decreasing = TRUE)
# Select the top 5 'source' with the highest count
top_5_source <- head(sorted_source_counts, 5)
# Print the top 5 'source' with the highest count
print(top_5_source)


# Select the top 10 'source' with the highest count
top_10_source <- head(sorted_source_counts, 10)
# Create a histogram for the top 10 'source'
barplot(top_10_source, main = "Top 10 Source", xlab = "Source", ylab = "Count")


# Sort the 'top_20_rank_individuals' dataset by 'personName' in ascending order
sorted_personName_dataset <- top_20_rank_individuals[order(top_20_rank_individuals$personName), ]
# Print the 'personName' and 'total_tax_rate_country' of the sorted dataset
print(paste(sorted_personName_dataset$personName, sorted_personName_dataset$total_tax_rate_country, sep = " - "))



library(ggplot2)
library(maps)
# Create a data frame for the wealth distribution
wealth_distribution <- data.frame(
    latitude = Billionaires.Statistics.Dataset$latitude_country,
    longitude = Billionaires.Statistics.Dataset$longitude_country,
    wealth = Billionaires.Statistics.Dataset$finalWorth
)
# Create a world map
world_map <- map_data("world")
# Create a geolocation graph for wealth distribution
ggplot() +
    geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill = "white", color = "black") +
    geom_point(data = wealth_distribution, aes(x = longitude, y = latitude, size = wealth), color = "blue") +
    theme_minimal() +
    labs(title = "Wealth Distribution", x = "Longitude", y = "Latitude", size = "Wealth")


