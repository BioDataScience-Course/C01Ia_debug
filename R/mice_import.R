# Import dataset : Mice
# url : https://archive-beta.ics.uci.edu/ml/datasets/mice+protein+expression
###############################################################################

# Packages
SciViews::R

# Read dataset -----
dir_create("data/data_raw")
mice <- read$xls("https://archive.ics.uci.edu/ml/machine-learning-databases/00342/Data_Cortex_Nuclear.xls",
  cache_file = "data/data_raw/mice_raw.xls")

# Rename variables -----
names(mice)
mice <- janitor::clean_names(mice)

# Remove and clean several variables -----
skimr::skim(mice)
mice <- sselect(mice, -h3me_k4_n, -egr1_n, -h3ac_k18_n,- p_cfos_n, -bcl2_n, -bad_n, -bcatenin_n, -elk_n)
mice <- sdrop_na(mice)
skimr::skim(mice)

# Save the dataset -----
write$rds(mice, "data/mice.rds", compress = "xz")

# Clean Environment
rm(mice)

