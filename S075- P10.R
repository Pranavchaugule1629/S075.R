install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

library(ggplot2)
library(dplyr)
library(tidyr)

bat_data <- read.csv("C:/Users/Hp/Downloads/bats_information.csv")

str(bat_data)
head(bat_data)

print(ggplot(bat_data, aes(x = Species)) +
        geom_bar() +
        labs(title = "Bat Distribution by Suborder", x = "Bat Suborder", y = "Count") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

print(ggplot(bat_data, aes(x = Habitat)) +
        geom_bar() +
        labs(title = "Bat Habitat Distribution", x = "Habitat Type", y = "Number of Bat Species") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

bat_data_clean <- bat_data %>%
  mutate(
    avg_lifespan = as.numeric(gsub("-.*", "", Average.Lifespan)),
    max_lifespan = as.numeric(gsub(".*-", "", Average.Lifespan)),
    lifespan_midpoint = ifelse(is.na(max_lifespan), avg_lifespan, (avg_lifespan + max_lifespan) / 2)
  )

print(ggplot(bat_data_clean, aes(x = Species, y = lifespan_midpoint)) +
        geom_boxplot() +
        labs(title = "Lifespan Distribution by Bat Suborder", x = "Bat Suborder", y = "Average Lifespan (Years)") +
        theme_minimal())

print(ggplot(bat_data, aes(x = Food)) +
        geom_bar() +
        labs(title = "Bat Diet Distribution", x = "Food Type", y = "Count") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

disease_counts <- bat_data %>%
  separate_rows(Susceptible.Diseases, sep = ", ") %>%
  group_by(Susceptible.Diseases) %>%
  summarise(count = n()) %>%
  filter(!is.na(Susceptible.Diseases) & Susceptible.Diseases != "")

print(ggplot(disease_counts, aes(x = reorder(Susceptible.Diseases, -count), y = count)) +
        geom_bar(stat = "identity") +
        labs(title = "Most Common Diseases in Bats", x = "Disease", y = "Number of Bat Species Affected") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

protection_counts <- bat_data %>%
  separate_rows(Protection.from.External.Threats, sep = ", ") %>%
  group_by(Protection.from.External.Threats) %>%
  summarise(count = n()) %>%
  filter(!is.na(Protection.from.External.Threats) & Protection.from.External.Threats != "")

print(ggplot(protection_counts, aes(x = reorder(Protection.from.External.Threats, -count), y = count)) +
        geom_bar(stat = "identity") +
        labs(title = "Protection Mechanisms Against External Threats", x = "Protection Mechanism", y = "Count") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

print(ggplot(bat_data, aes(x = DNA.Structure)) +
        geom_bar() +
        labs(title = "DNA Structure Distribution in Bats", x = "DNA Structure Type", y = "Count") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

print(ggplot(bat_data, aes(x = Environment)) +
        geom_bar() +
        labs(title = "Environmental Adaptability of Bats", x = "Environment Type", y = "Count") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)))

food_by_suborder <- bat_data %>%
  count(Species, Food)

print(ggplot(food_by_suborder, aes(x = Food, y = n, fill = Species)) +
        geom_bar(stat = "identity", position = "dodge") +
        labs(title = "Diet Distribution by Bat Suborder", x = "Food Type", y = "Count", fill = "Suborder") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))

disease_by_habitat <- bat_data %>%
  separate_rows(Susceptible.Diseases, sep = ", ") %>%
  group_by(Habitat, Susceptible.Diseases) %>%
  summarise(count = n(), .groups = "drop") %>%
  filter(!is.na(Susceptible.Diseases) & Susceptible.Diseases != "")

top_diseases <- disease_by_habitat %>%
  group_by(Susceptible.Diseases) %>%
  summarise(total = sum(count)) %>%
  arrange(desc(total)) %>%
  slice_head(n = 5) %>%
  pull(Susceptible.Diseases)

disease_by_habitat_filtered <- disease_by_habitat %>%
  filter(Susceptible.Diseases %in% top_diseases)

print(ggplot(disease_by_habitat_filtered, aes(x = Habitat, y = count, fill = Susceptible.Diseases)) +
        geom_bar(stat = "identity", position = "dodge") +
        labs(title = "Top 5 Diseases by Habitat", x = "Habitat", y = "Count", fill = "Disease") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)))