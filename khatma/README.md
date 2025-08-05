# Khatma Flutter

Ce projet est une réimplémentation en Flutter de l'application "Khatma App". Il a été créé en se basant sur le code source d'une application Android existante.

## Structure du Projet

**NOTE IMPORTANTE :** Les dossiers `resources` et `sources` à la racine sont les restes du projet Android original et peuvent être ignorés ou supprimés. Le nouveau projet Flutter se trouve dans les dossiers `lib`, `assets`, etc.

- `lib/`: Contient tout le code source Dart.
  - `main.dart`: Le point d'entrée de l'application.
  - `ecrans/`: Contient les différents écrans (pages) de l'application.
  - `modeles/`: Contient les classes de modèle de données (ex: `Khatma`).
  - `auxiliaires/`: Contient les classes d'aide (base de données, logique de date, etc.).
  - `theme/`: Contient la configuration du thème de l'application.
- `assets/`: Contient les ressources statiques.
  - `images/`: Contient les images des pages du Coran.
  - `icon/`: Contient l'icône de l'application.
- `pubspec.yaml`: Le fichier de configuration du projet Flutter.

## Configuration Manuelle Requise

En raison des limitations de l'environnement de développement, toutes les images n'ont pas pu être copiées automatiquement.

**Action requise :**
1.  Copiez toutes les images `.jpg` et `.png` du dossier `resources/res/drawable` du projet original dans le dossier `khatma_flutter/assets/images/`.
2.  Assurez-vous d'avoir le SDK Flutter installé sur votre machine.
3.  Exécutez `flutter pub get` à la racine du dossier `khatma_flutter` pour récupérer les dépendances.
4.  Exécutez `flutter pub run flutter_launcher_icons:main` pour appliquer l'icône de l'application.
5.  Lancez l'application avec `flutter run`.

## Fonctionnalités

- Affichage de la lecture quotidienne du Coran basée sur un cycle de 21 jours.
- Navigation entre les jours précédents et suivants.
- Affichage des pages du Coran sous forme d'images zoomables.
- Menus pour accéder à la liste des Ahzab, au Duaa de la Khatma, et à d'autres informations.
- Thème vert et blanc, avec code entièrement commenté en français.
- Noms de fichiers en français pour une meilleure compréhension.
