# Vérification de R/mice_lda.R

test_that("Étape 1 : importation et remaniement des données", {
  expect_true(is_identical_to_ref("mice"))
  # Le jeu de données `mice` est introuvable ou incorrect après l'étape 1
  # Avez-vous corrigé les erreurs dans le code ?
  # Avez-vous exécuté les instructions au-dessus dans l'ordre ?
})

test_that("Étape 2 : description des données", {
  expect_true(is_identical_to_ref("mice_corr"))
  # La matrice de corrélation n'est pas celle demandée, ou n'est pas trouvée
  # Avez-vous corrigé les erreurs dans le code ?
  # Relisez bien le commentaire au dessus du code pour déterminer ce qui est
  # attendu.

  expect_true(is_identical_to_ref("mice_chart"))
  # Le graphique n'est pas bon
  # Est-ce que les données s'affichent sur le graphique ? Si pas, c'est sans
  # doute qu'il y a une erreur dans le code entre chart() et geom_boxplot().
})

test_that("Étape 3 : remaniement des données", {
  expect_true(is_identical_to_ref("mice2"))
  # Le jeu de données réduit ne correspond pas à ce qui est attendu
  # L'ADL ne peut utiliser que des variables quantitatives en plus de la
  # variable de classe que l'on veut prédire. Êtes-vous certain que c'est le cas
  # à l'issue de l'élimination de variables avec sselect() ?

  expect_true(is_identical_to_ref("mice3"))
  # La variable class n'est pas être factor, ou autre problème dans les données
  # Suite à la sélection des variables pertinentnes pour l'ADL, vous devez aussi
  # vous assurer que la variable de classe soit factor avant de vous lancer dans
  # l'ADL.
})

test_that("Étape 4 : séparation sets d'apprentissage et de test", {
  expect_true(is_identical_to_ref("mice_train"))
  # Le set d'apprentissage est incorrect
  # Avez-vous corrigé les erreurs dans le code ?
  # Avez-vous vérifié les arguments des fonctions ?
  # La séparation en train et test est incorrecte. Assurez-vous que vous
  # exécutez les instructions dans l'ordre à partir de set.seed() et au besoin,
  # réexécutez tout dans l'ordre depuis le début du script pour être certain.

  expect_true(is_identical_to_ref("mice_test"))
  # Le set de test est incorrect
  # Avez-vous corrigé les erreurs dans le code ?
  # Avez-vous vérifié les arguments des fonctions ?
  # La séparation en train et test est incorrecte. Assurez-vous que vous
  # exécutez les instructions dans l'ordre à partir de set.seed() et au besoin,
  # réexécutez tout dans l'ordre depuis le début du script pour être certain.
})

test_that("Étape 5 : entrainement du classifieur", {
  expect_true(is_identical_to_ref("mice_lda"))
  # Le classifieur ne correspond pas à ce qui est attendu
  # Avez-vous corrigé les erreurs dans le code ?
  # Vérifier tous les arguments de mlLda().
  # Dans quelle phase sommes-nous ? Et donc, quelles données devons-nous
  # utiliser ?
  # Assurez-vous d'exécuter les instructions dans l'ordre dans le script et au
  # besoin, réexécutez tout dans l'ordre depuis le début.
})

test_that("Étape 6 : étude des performances du classifieur", {
  expect_true(is_identical_to_ref("mice_pred"))
  # La prédiction en phase de test est incorrect
  # Avez-vous corrigé les erreurs dans le code ?
  # Réfléchissez bien à ce que l'on fait ici. On est en phase de test du
  # classifieur. Quelles données utilise-t-on ici ?

  expect_true(is_identical_to_ref("mice_conf"))
  # La matrice de confusion ne correspond pas à ce qui est attendu
  # Avez-vous corrigé les erreurs dans le code ?
  # Réfléchissez bien à ce que l'on fait ici. On est en phase de test du
  # classifieur. Que doit-on comparer dans cette matrice de confusion ?
  # Vous indiquez les prédictions du modèle en premier et les classes connues
  # en second. Réfléchissez bien à ceci : (1) quelles données utilise-t-on ici ?
  # Et (2) où se trouvent les prédictions et les classes de référence ?
  # Rappelez-vous que pour indiquer la variable `var` du jeu de données `df`,
  # vous indiquez. `var$df`.
})
