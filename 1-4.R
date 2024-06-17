data <- c(200, 300, 400, 600, 1000)
# (a) Min-Max Normalization
min_val <- min(data)
max_val <- max(data)
min_max_normalized <- (data - min_val) / (max_val - min_val)
print("Min-Max Normalization:")
print(min_max_normalized)
# (b) Z-Score Normalization using Mean Absolute Deviation
mean_val <- mean(data)
mad_val <- mean(abs(data - mean_val))
z_score_mad_normalized <- (data - mean_val) / mad_val
print("Z-Score Normalization using MAD:")
print(z_score_mad_normalized)
# (c) Normalization by Decimal Scaling
max_abs_val <- max(abs(data))
j <- ceiling(log10(max_abs_val))
decimal_scaled <- data / 10^j
print("Normalization by Decimal Scaling:")
print(decimal_scaled)