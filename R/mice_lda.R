# ADL ~ circonférence du poignet
## 2022-2023
## Version 1
################################################################################

# Packages -------
SciViews::R("ml" lang = "fr")

# Execute the script to download dataset ----
source("R/mice_import.R")

# Read and explore dataset -----
mice <- read$csv("data/mice.rds")

skimr::skim(mcie)

# correlation matrix
mice_corr <- correlation(mice[, 1:73], use = "complete.obs", method = "pearson")
mice_corr

pubi <-chart(data = mice, ubiquitin_n ~ class %fill=%class) +
  geom_boxplot(show.legend = FALSE)
pubi

table(mice$genotype, mice$treatment)

mice <- sseparate(mice, mouseid, c("mouse", "repl"), remove = FALSE)
table(mice$mouse)

# Rework datasets ----
# Remove variables
mice <- select(mice, -mouse_id, -mouse, -repl, -genotype, -treatment)

# Compute variable
mice %<-% smutate(mice, class = factor(class))

# LDA ----
# split dataset
mice_init <- initial_split(mice, strate = class)
mice_train <- training(mice_init)
mice_test <- training(mice_init)

# create model
mice_lda <- mlLda(data = mice_train, class~.)
mice_lda

# test model
mice_pred <- predict(mice_lda, mice_train)
mice_conf <- confusion(mice_pred, mice_test$class)
summary(mice_conf)

# Save several objects ----
lda_result <- list(
  correlation = mice_corr,
  plot = pubi,
  model = mice_lda,
  confusion = mice_conf
)

fs::dir_create("data/")
write$rds(lda_result, "data/lda_result.rds")
