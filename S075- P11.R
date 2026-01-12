install.packages("ggplot2")
[library(ggplot2)]8

bats_data <- read.csv("C:/Users/mvlui/Downloads/bats_information.csv")

bats_data$Lifespan_Num <- as.numeric(sapply(strsplit(bats_data$Average.Lifespan, "-"), "[", 1))

ggplot(bats_data, aes(x = Lifespan_Num)) +
  geom_histogram(binwidth = 2) +
  labs(
    title = "Histogram of Bat Lifespan",
    x = "Lifespan (Years)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(bats_data, aes(x = Lifespan_Num)) .

  geom_histogram(binwidth = 2) +
  facet_wrap(~ Species) +
  labs(
    title = "Histogram of Bat Lifespan by Species",
    x = "Lifespan (Years)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(bats_data, aes(y = Lifespan_Num)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Bat Lifespan",
    y = "Lifespan (Years)"
  ) +
  theme_minimal()

ggplot(bats_data, aes(x = Species, y = Lifespan_Num)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Bat Lifespan by Species",
    x = "Species",
    y = "Lifespan (Years)"
  ) +
  theme_minimal()