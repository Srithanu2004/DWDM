# Load the dataset
diabetes_data <- read.csv("diabetes.csv")

# Create the Scatterplot
ggplot(diabetes_data, aes(x = Age, y = BloodPressure)) +
  geom_point() +
  labs(title = "Scatterplot of Blood Pressure vs Age",
       x = "Age",
       y = "Blood Pressure") +
  theme_minimal()

# For the bar chart, let's bin the age into groups and then calculate the mean blood pressure for each group

# Create age bins
diabetes_data <- diabetes_data %>%
  mutate(AgeGroup = cut(Age, breaks = seq(20, 80, by = 10), include.lowest = TRUE))

# Calculate mean blood pressure for each age group
age_bp_summary <- diabetes_data %>%
  group_by(AgeGroup) %>%
  summarise(MeanBloodPressure = mean(BloodPressure, na.rm = TRUE))

# Create the Bar Chart
ggplot(age_bp_summary, aes(x = AgeGroup, y = MeanBloodPressure)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Bar Chart of Mean Blood Pressure by Age Group",
       x = "Age Group",
       y = "Mean Blood Pressure") +
  theme_minimal()