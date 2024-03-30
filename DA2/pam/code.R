# Load necessary libraries
library(cluster)
library(readr)
library(factoextra)

# Read the CSV file
data <- read_csv("C:/Users/navan/Downloads/Credit Card Customer Data.csv")

# Select relevant columns for clustering
X <- data[, c("Avg_Credit_Limit", "Total_Credit_Cards", "Total_visits_bank", "Total_visits_online", "Total_calls_made")]

# Optionally, you can also scale the data to improve clustering performance
X_scaled <- scale(X)

# Specify the number of clusters
numClusters <- 3  # Update with the desired number of clusters

# Perform PAM clustering with scaled data
pam_model <- pam(X_scaled, k = numClusters)

# Visualize the clustering results using a silhouette plot
silhouette_plot <- silhouette(pam_model$clustering, dist(X_scaled))
plot(silhouette_plot)

# Create a scatter plot of the clustered data
fviz_cluster(pam_model, data = X_scaled, geom = "point", stand = FALSE)
