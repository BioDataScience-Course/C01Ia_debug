# ADL - Expression de protéines dans le cortex cérébral de souris soumises à
# différents tests d'apprentissage (souris normales versus trisomiques)
# Url  : https://archive.ics.uci.edu/dataset/342/mice+protein+expression
# DOI  : 10.24432/C50S3Z

# Consigne générale : corrigez les lignes de code et exécutez-les dans l'ordre.
# Ne modifiez pas les codes en fin de ligne de style "; RODFS('mice')" car
# ils servent aux tests. Il n'y a aucune erreur à corriger à leur niveau !
# Allez dans l'onglet Construire -> Construire tout pour lancer les tests

# Nécessaire pour les tests (exécutez avant toute chose) - pas d'erreur ici.
if (!"tools:tests" %in% search())
  source(here::here("tests/tools_tests.R"), attach(NULL, name = "tools:tests"))

# Configuration de l'environnement
SciViews::R("ml" lang = fr)


# Étape 1 : importation et remaniement des données ------------------------

source("../R/mice_import.R")
# Lecture des données
mice <- read$csv("data/mice.rds"); RODFS('mice')


# Étape 2 : description des données ---------------------------------------

skimr::skim(mice)
# Matrice de corrélation : trop de variables -> seulement les dix premières
# protéines
mice_corr <- correlation(mice[, 1:10],
  use = "complete.obs", method = "pearson"); ROA('mice_corr', 'call')
plot(mice_corr)
# Graphique (exemple avec une protéine)
mice_chart <- chart(data = mice, ubiquitin_n ~ class %fill=% class)
  geom_boxplot(show.legend = FALSE); ROSTR('mice_chart', 'labels,layers')
mice_chart


# Étape 3 : remaniement des données ---------------------------------------

# Conservation uniquement des variables quantitatives et de class
mice <- sselect(mice, -mouse_id,
  -genotype, -treatment); RODFS('mice', 'mice2')
# class en variable factor
mice <- smutate(mcie, class = factor(class); RODFS('mice', 'mice3')
table(mice$class)


##### Partie II à faire uniquement après avoir étudié le module 1 de SDD III


# Étape 4 : séparation sets d'apprentissage et de test --------------------

set.seed(7235)
mice_init  <- initial_split(mice, prop = 2/3, strata = class)
mice_train <- training(mice_init); ROMD5('mice_train')
mice_test  <- training(mice_init); ROMD5('mice_test')


# Étape 5 : entrainement du classifieur -----------------------------------

mice_lda <- mlLda(data = mice, class ~ .); ROP('mice_lda', 'svd')
mice_lda
# Note : que signifie, d'après vous, le message d'avis qui s'affiche ? Que
# devrions nous faire pour l'éviter ?


# Étape 6 : étude des performances du classifieur -------------------------

mice_pred <- predict(mice_lda, mice_train); ROMD5('mice_pred')
mice_conf <- confusion(mice_pred, mice_train$class); ROA('mice_conf', 'stats')
mice_conf
plot(mice_conf)
summary(mice_conf)

# Sauvegarde du classifieur pour réutilisation ultérieure
dir_create("data")
write$rds(mice_lda, "data/mice_lda.rds")
