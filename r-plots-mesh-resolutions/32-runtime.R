library(ggplot2)
library(gghighlight)
library(tidyr)
library(readr)

# Read the CSV file
data <- read_csv("2-32.csv")

# Reshape the data from wide to long format
data_long <- pivot_longer(data, 
                          cols = c("Genoa", "Milan"), 
                          names_to = "microarch", 
                          values_to = "Runtime")

# Add corresponding standard errors
data_long$SE <- ifelse(data_long$microarch == "Genoa", 
                       data$`Genoa Standrd Error`, 
                       data$`Milan Standard Error`)

# Create the line chart with error bars and labels
ggplot(data_long, aes(x = `mesh resolution`, y = Runtime, color = microarch, group = microarch)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = Runtime - SE, ymax = Runtime + SE), width = 0.2) +
  geom_text(data = subset(data_long, microarch == "Genoa"),
            aes(label = round(Runtime, 1)), vjust = 1.5, hjust = 0.5, size = 3) +
  geom_text(data = subset(data_long, microarch == "Milan"),
            aes(label = round(Runtime, 1)), vjust = -1.5, hjust = 0.5, size = 3) +
  scale_x_discrete(limits = data$`mesh resolution`) +
  scale_y_continuous(limits = c(0, max(data_long$Runtime + data_long$SE) * 1.2)) +
  labs(title = "MPAS-Julia : ntasks=32",
       x = "Mesh Resolution",
       y = "Runtime (seconds)") +
  theme_minimal() +
  theme(legend.position = "bottom",
        panel.background = element_rect(fill = "gray95", color = NA),
        plot.background = element_rect(fill = "white", color = NA),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  gghighlight()
