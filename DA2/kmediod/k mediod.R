# Load necessary libraries
library(cluster)
library(readr)

# Read the CSV file
data <- read_csv("C:/Users/navan/Downloads/data.csv")

# Handle missing values
data <- na.omit(data)

# Select relevant columns for clustering
X <- data[, c('agecat', 'credit_score', 'traffic_index')]

# Optionally, you can also scale the data to improve clustering performance
X_scaled <- scale(X)

# Perform k-medoids clustering
numClusters <- 3  # Update with desired number of clusters
kmedoids_model <- pam(X_scaled, k = numClusters)

# View cluster assignments
print(kmedoids_model$clustering)

# Plot clusters
plot(X_scaled, col = kmedoids_model$clustering + 1, pch = 20, main = "K-medoids Clustering")
legend("topright", legend = unique(kmedoids_model$clustering), col = unique(kmedoids_model$clustering) + 1, pch = 20)
