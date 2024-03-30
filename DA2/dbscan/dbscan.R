# Load necessary libraries
library(readr)
library(dbscan)

# Read the CSV file
data <- read_csv("C:/Users/navan/Downloads/data.csv")

# Handle missing values
data <- na.omit(data)

# Select relevant columns for clustering
X <- data[, c('agecat', 'credit_score', 'traffic_index')]

# Optionally, you can also scale the data to improve clustering performance
X_scaled <- scale(X)

# Perform DBSCAN clustering
dbscan_model <- dbscan(X_scaled, eps = 0.5, minPts = 5)

# View cluster assignments
print(dbscan_model$cluster)

# Plot clusters
plot(X_scaled, col = dbscan_model$cluster + 1, pch = 20, main = "DBSCAN Clustering")
legend("topright", legend = unique(dbscan_model$cluster), col = unique(dbscan_model$cluster) + 1, pch = 20)
