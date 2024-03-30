# Load necessary libraries
library(cluster)
library(readr)

# Read the CSV file
data <- read_csv("C:/Users/navan/Downloads/data.csv")

# Select relevant columns for clustering
X <- data[, c('agecat', 'credit_score', 'traffic_index')]

# Optionally, you can also scale the data to improve clustering performance
X_scaled <- scale(X)

# Handle missing or infinite values in the scaled data
X_scaled[is.na(X_scaled) | is.infinite(X_scaled)] <- 0  # Replace NA and infinite values with 0

# Specify the number of clusters
numClusters <- 2  # Update with desired number of clusters

# Perform K-means clustering with scaled and cleaned data
kmeans_model <- kmeans(X_scaled, centers = numClusters)

# View cluster centers
print(kmeans_model$centers)

# View cluster assignments
print(kmeans_model$cluster)

# Plotting the clusters
plot(X_scaled, col = kmeans_model$cluster, main = "K-means Clustering", xlab = "agecat", ylab = "credit_score")
points(kmeans_model$centers, col = 1:numClusters, pch = 8, cex = 2)  # Add cluster centers to the plot
