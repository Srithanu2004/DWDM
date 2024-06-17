
sales_prices <- c(5, 10, 11, 13, 15, 35, 50, 55, 72, 92, 204, 215)
# Equal-frequency partitioning
equal_frequency_bins <- split(sales_prices, ceiling(seq_along(sales_prices) / 4))
print("Equal-frequency partitioning:")
print(equal_frequency_bins)
# Equal-width partitioning
min_val <- min(sales_prices)
max_val <- max(sales_prices)
width <- (max_val - min_val) / 3
equal_width_bins <- list(
  sales_prices[sales_prices >= min_val & sales_prices < min_val + width],
  sales_prices[sales_prices >= min_val + width & sales_prices < min_val + 2 * width],
  sales_prices[sales_prices >= min_val + 2 * width & sales_prices <= max_val]
)
print("Equal-width partitioning:")
print(equal_width_bins)
# Clustering
set.seed(123)  # Setting seed for reproducibility
kmeans_result <- kmeans(sales_prices, centers = 3)
# Assign data points to their respective clusters
cluster_bins <- split(sales_prices, kmeans_result$cluster)
print("Clustering:")
print(cluster_bins)