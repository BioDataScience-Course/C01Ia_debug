# Débogage de script R et ADL

## Avant-propos

La première partie de ce projet est un petit auto-test pour vous rafraîchir l'esprit sur l'utilisation de R pour l'analyse des données. Il nécessite comme prérequis d'avoir déjà utilisé R (par exemple, cours de SDD I).

La seconde partie est une analyse discriminante linéaire avec le package {mlearning}. Il faut avoir assimilé l'ensemble des notions du premier module du cours de Science des Données Biologiques III avant de réaliser cette partie. Elle contient aussi du code erroné à corriger.

Ce projet correspond au template <https://github.com/BioDataScience-Course/C01Ia_debug>.

## Objectifs

Cet exercice est individuel, **court** et **cadré**.

Vous devez :

-   corriger un script R (`R/mice_lda.R` seulement, ne touchez pas à `R/mice_import.R`) !
-   créer un classifieur utilisant l'analyse discriminante linéaire (ADL))
-   étudier les performances du classifieur avec un set de test

## Consignes

Corrigez la première partie du script `R/mice_lda.R` avant d'aborder le module 1 du cours SDD III. Si vous n'y arrivez pas, revoyez les chapitres des cours SDD I et SDD II qui correspondent à vos lacunes avant d'aller plus avant. **Le script `R/mice_import.R` est appelé par `R/mice_lda.R` mais il ne doit pas être modifié. Il ne contient aucune erreur !**

Corrigez la seconde partie du script `R/mice_lda.R` lorsque vous aurez étudié le contenu du premier module du cours SDD III. Regardez d'un œil critique les résultats obtenus et demandez-vous si ce classifieur pourrait répondre aux attentes des scientifiques qui ont produit le jeu de données.

## Informations sur les données

Ces données sont à disposition sur le site de l'UC Irvine Machine Learning Repository :

[Higuera, Clara, Gardiner, Katheleen & Cios, Krzysztof. (2015). Mice Protein Expression. UCI Machine Learning Repository.](https://archive.ics.uci.edu/dataset/342/mice+protein+expression)

Elles ont été employées dans le cadre de la publication suivante :

[Higuera C, Gardiner KJ, Cios KJ (2015) Self-Organizing Feature Maps Identify Proteins Critical to Learning in a Mouse Model of Down Syndrome. PLoS ONE 10(6): e0129126.journal.pone.0129126](https://doi.org/10.1371/journal.pone.0129126)
