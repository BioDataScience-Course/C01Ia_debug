# SDD III module 1 : Débogage d'un document Quarto et ADL

La première partie de ce projet est un petit autotest pour vous rafraîchir l'esprit sur l'utilisation de R pour l'analyse des données. Il nécessite comme prérequis d'avoir déjà utilisé R (par exemple, cours de SDD I).

La seconde partie est une analyse discriminante linéaire réalisée avec le package {mlearning}. Il faut avoir assimilé l'ensemble des notions du premier module du cours de Science des Données biologiques III avant de réaliser cette partie. Elle contient aussi du code erroné à corriger.

Il correspond au dépôt GitHub <https://github.com/BioDataScience-Course/C01Ia_debug> et est distribué sous licence [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

## Objectifs

Cet exercice est individuel, **court** et **cadré**. Vous devez :

-   corriger le code R présent dans le document Quarto
-   créer un classifieur utilisant l'analyse discriminante linéaire (ADL)
-   étudier les performances du classifieur avec un set de test

## Consignes

Des collègues scientifiques travaillent sur la trisomie 21. Ils en sont à l'étude sur des souris. Ils vous ont transmis un document Quarto (`mice_notebook.qmd`) pour vous montrer les premières avancées dans le traitement des données collectées. Ce document ne compile pas à cause d'une multitude de fautes dans le code. On peut les regrouper en deux grandes catégories :

-   les erreurs syntaxiques (code incorrect qui ne s'exécute pas) comme l'oubli de parenthèses, de virgules, de points, de guillemets...
-   les erreurs conceptuelles (code qui s'exécute, mais effectue un mauvais traitement), comme par exemple, l'entraînement du modèle sur les données de test ou encore les tests de performance réalisés sur les données d'entraînement.

**Le script R/mice_import.R ne doit pas être modifié. Il ne contient aucune erreur !**

Corrigez ce carnet de notes. Il doit être possible de le compiler (obtenir un HTML en appuyant sur le bouton Rendu) sans qu'aucune erreur n'apparaisse. Vous avez une batterie de tests à votre disposition dans l'onglet 'Construire' -\> bouton 'Construire tout' pour vérifier vos corrections. N'utilisez pas l'argument `echo=FALSE` dans vos chunks. Le code R qui génère les résultats doit rester visible dans la version HTML finale. Enfin, vérifiez que votre dernier commit et push sont bien enregistrés sur GitHub à la fin de l'exercice.

## Informations sur les données

Ces données sont disponibles depuis le site de l'UC Irvine Machine Learning Repository :

[Higuera, Clara, Gardiner, Katheleen & Cios, Krzysztof. (2015). Mice Protein Expression. UCI Machine Learning Repository.](https://archive.ics.uci.edu/dataset/342/mice+protein+expression)

Elles ont été employées dans le cadre de la publication suivante :

[Higuera C, Gardiner KJ, Cios KJ (2015) Self-Organizing Feature Maps Identify Proteins Critical to Learning in a Mouse Model of Down Syndrome. PLoS ONE 10(6): e0129126.journal.pone.0129126](https://doi.org/10.1371/journal.pone.0129126)
