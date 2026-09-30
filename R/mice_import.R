# Importation des données mice
# Url  : https://archive.ics.uci.edu/dataset/342/mice+protein+expression
# DOI  : 10.24432/C50S3Z
# Note : vous ne devez rien changer dans ce script et il est exécuté
# automatiquement depuis mice_notebook.qmd qui est le fichier à corriger du projet

# Configuration de l'environnement
SciViews::R(lang = "fr")


# Importation des données depuis Internet ---------------------------------

dir_create("data/data_raw")
# Téléchargement du fichier zip.
if(!fs::file_exists("data/data_raw/Data_Cortex_Nuclear.xls")) {
  download.file(
    "https://archive.ics.uci.edu/static/public/342/mice+protein+expression.zip",
    destfile = "data/data_raw/mice.zip")
  unzip("data/data_raw/mice.zip", exdir = "data/data_raw/")
  fs::file_delete("data/data_raw/mice.zip")
}

mice <- read$xls("data/data_raw/Data_Cortex_Nuclear.xls")

# Nettoyage du nom des variables ------------------------------------------

names(mice)
mice <- janitor::clean_names(mice)
skimr::skim(mice)


# Élimination de variables et de valeurs manquantes -----------------------

mice <- sselect(mice, -h3me_k4_n, -egr1_n, -h3ac_k18_n,- p_cfos_n, -bcl2_n,
  -bad_n, -bcatenin_n, -elk_n)
# Élimination des lignes ayant des valeurs manquantes
mice <- sdrop_na(mice)
skimr::skim(mice)


# Enregistrement du jeu de données nettoyé --------------------------------

write$rds(mice, "data/mice.rds", compress = "xz")
# Nettoyage de l'environnement
rm(mice)
