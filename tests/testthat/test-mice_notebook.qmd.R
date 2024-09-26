# Vérifications de mice_notebook.qmd
mice <- parse_rmd("../../mice_notebook.qmd",
  allow_incomplete = TRUE, parse_yaml = TRUE)

test_that("Le bloc-notes est-il compilé en un fichier final HTML ?", {
  expect_true(is_rendered("mice_notebook.qmd"))
  # La version compilée HTML du rapport est introuvable
  # Vous devez créer un rendu de votre bloc-notes Quarto (bouton 'Rendu')
  # Vérifiez aussi que ce rendu se réalise sans erreur, sinon, lisez le message
  # qui s'affiche dans l'onglet 'Travaux' et corrigez ce qui ne va pas dans
  # votre document avant de réaliser à nouveau un rendu HTML.
  # IL EST TRES IMPORTANT QUE VOTRE DOCUMENT COMPILE ! C'est tout de même le but
  # de votre analyse que d'obtenir le document final HTML.

  expect_true(is_rendered_current("mice_notebook.qmd"))
  # La version compilée HTML du document Quarto existe, mais elle est ancienne
  # Vous avez modifié le document Quarto après avoir réalisé le rendu.
  # La version finale HTML n'est sans doute pas à jour. Recompilez la dernière
  # version de votre bloc-notes en cliquant sur le bouton 'Rendu' et vérifiez
  # que la conversion se fait sans erreur. Sinon, corrigez et regénérez le HTML.
})

test_that("La structure du document est-elle conservée ?", {
  expect_true(all(c("Introduction et but", "Matériel et méthodes",
    "Analyses", "Description des données", "Set d'apprentissage et de test",
    "Apprentissage du modèle", "Test du modèle", "Conclusion")
    %in% (rmd_node_sections(mice) |> unlist() |> unique())))
  # Les sections (titres) attendues du document ne sont pas toutes présentes
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs titres indispensables par rapport aux exercices ont disparu ou ont
  # été modifié. Vérifiez la structure du document par rapport à la version
  # d'origine dans le dépôt "template" du document (lien au début du fichier
  # README.md).

  expect_true(all(c("setup", "import", "skim", "correlation", "chart", "table",
    "reduce", "split", "model", "confusion", "summaryconf", "save")
    %in% rmd_node_label(mice)))
  # Un ou plusieurs labels de chunks nécessaires à l'évaluation manquent
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs chunks indispensables par rapport aux exercices sont introuvables.
  # Vérifiez la structure du document par rapport à la version d'origine dans
  # le dépôt "template" du document (lien au début du fichier README.md).

  expect_true(any(duplicated(rmd_node_label(mice))))
  # Un ou plusieurs labels de chunks sont dupliqués
  # Les labels de chunks doivent absolument être uniques. Vous ne pouvez pas
  # avoir deux chunks qui portent le même label. Vérifiez et modifiez le label
  # dupliqué pour respecter cette règle. Comme les chunks et leurs labels sont
  # imposés dans ce document cadré, cette situation ne devrait pas se produire.
  # Vous avez peut-être involontairement dupliqué une partie du document ?
})

test_that("L'entête YAML a-t-il été complété ?", {
  expect_true(mice[[1]]$author != "___")
  expect_true(!grepl("__", mice[[1]]$author))
  expect_true(grepl("^[^_]....+", mice[[1]]$author))
  # Le nom d'auteur n'est pas complété ou de manière incorrecte dans l'entête
  # Vous devez indiquer votre nom dans l'entête YAML à la place de "___" et
  # éliminer les caractères '_' par la même occasion.

  expect_true(grepl("[a-z]", mice[[1]]$author))
  # Aucune lettre minuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en majuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.

  expect_true(grepl("[A-Z]", mice[[1]]$author))
  # Aucune lettre majuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en minuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.
})

test_that("Chunk 'import' : importation des données", {
  expect_true(is_identical_to_ref("import", "names"))
  # Les colonnes dans le tableau `mice` importé ne sont pas celles attendues
  # Réexécutez-le script R/mice_import.R Vous n'avez pas à modifier ce fichier.

  expect_true(is_identical_to_ref("import", "classes"))
  # La nature des variables (classe) dans le tableau `mice` est incorrecte
  # Réexécutez-le script R/mice_import.R Vous n'avez pas à modifier ce fichier.

  expect_true(is_identical_to_ref("import", "nrow"))
  # Le nombre de lignes dans le tableau `mice` est incorrect
  # Réexécutez-le script R/mice_import.R Vous n'avez pas à modifier ce fichier.

  expect_true(is_identical_to_ref("import", "units"))
  # Les unités renseignées pour les variables de `mice` sont incorrectes
  # Réexécutez-le script R/mice_import.R Vous n'avez pas à modifier ce fichier.

  expect_true(is_identical_to_ref("import", "nas"))
  # Les valeurs manquantes pour les variables de `mice` sont incorrectes
  # Réexécutez-le script R/mice_import.R Vous n'avez pas à modifier ce fichier.
})

test_that("Chunk 'correlation' : matrice de corrélation", {
  expect_true(is_identical_to_ref("correlation"))
  # La matrice de corrélation est introuvable ou n'est pas la bonne
  # Avez-vous corrigé les erreurs dans le code ?
  # Vérifiez que ce code s'exécute sans erreurs après vos corrections.
  # Vérifiez les arguments de la fonction `correlation()`. Il vous faut une
  # corrélation de Pearson. Assurez- vous d'avoir sélectionné les bonnes
  # variables.
})

test_that("Chunk 'chart' : Graphique de ubiquitin_n en fonction de la classe",  {
  expect_true(is_identical_to_ref("chart"))
  # Le graphique ubiquitin_n ~ class n'est pas généré ou est incorrect
  # # Avez-vous corrigé les erreurs dans le code ?
})

test_that("Chunk 'table' : tableau de contingence", {
  expect_true(is_identical_to_ref("table"))
  # Le tableau de contingence n'est pas généré ou est incorrect.
  # Avez-vous corrigé les erreurs dans le code ?
})

test_that("Chunk 'reduce' : sélection et transformation de la variable `class`", {
  expect_true(is_identical_to_ref("reduce", "names"))
  # Les colonnes dans le tableau `mice` importé ne sont pas celles attendues
  # Vérifiez la sélection et la transformation de la variable `class`.

  expect_true(is_identical_to_ref("reduce", "classes"))
  # La nature des variables (classe) dans le tableau `mice` est incorrecte
  # Vérifiez la sélection et la transformation de la variable `class`.

  expect_true(is_identical_to_ref("reduce", "nrow"))
  # Le nombre de lignes dans le tableau `mice` est incorrect
  # Vérifiez la sélection et la transformation de la variable `class`.

  expect_true(is_identical_to_ref("reduce", "units"))
  # Les unités renseignées pour les variables de `mice` sont incorrectes
  # Vérifiez la sélection et la transformation de la variable `class`.

  expect_true(is_identical_to_ref("reduce", "nas"))
  # Les valeurs manquantes pour les variables de `mice` sont incorrectes
  # Vérifiez la sélection et la transformation de la variable `class`.
})

test_that("Chunk 'split' : set d'apprentissage", {
  expect_true(is_identical_to_ref("split", "names"))
  # Les colonnes dans le tableau `mice_train` importé ne sont pas celles attendues
  # Vérifiez la sélection et la transformation de la variable `class`.

  expect_true(is_identical_to_ref("split", "classes"))
  # La nature des variables (classe) dans le tableau `mice_train` est incorrecte
  # Vérifiez la classe des variables du set d'apprentissage.

  expect_true(is_identical_to_ref("split", "nrow"))
  # Le nombre de lignes dans le tableau `mice_train` est incorrect.
  # Vérifiez le nombre de ligne du tableau d'apprentissage.

  expect_true(is_identical_to_ref("split", "units"))
  # Les unités renseignées pour les variables de `mice_train` sont incorrectes.
  # Vérifiez les unitiés du set d'apprentissage.

  expect_true(is_identical_to_ref("split", "nas"))
  # Les valeurs manquantes pour les variables de `mice_train` sont incorrectes.
  # Vérifiez la présence de valeurs manquantes. Il ne doit pas en avoir.
})

test_that("chunk 'model' : entrainement du classifieur", {
  expect_true(is_identical_to_ref("model"))
  # Le classifieur ne correspond pas à ce qui est attendu
  # Avez-vous corrigé les erreurs dans le code ?
  # Vérifier tous les arguments de ml_lda().
  # Dans quelle phase sommes-nous ? Et donc, quelles données devons-nous
  # utiliser ?
  # Assurez-vous d'exécuter les instructions dans l'ordre dans le script et au
  # besoin, réexécutez tout dans l'ordre depuis le début.
})

test_that("chunk 'confusion' : étude des performances du classifieur", {
  expect_true(is_identical_to_ref("confusion"))
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

