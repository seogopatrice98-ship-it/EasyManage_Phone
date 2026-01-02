# EasyManage Phone

Application mobile de gestion commerciale pour Android développée avec Flutter.

## Fonctionnalités

- 📊 **Tableau de bord** - Vue d'ensemble des ventes, stock et dépenses
- 💰 **Gestion des ventes** - Enregistrement et suivi des transactions
- 📦 **Gestion du stock** - Suivi des produits et inventaire
- 💸 **Suivi des dépenses** - Gestion des coûts opérationnels
- 📈 **Rapports et analyses** - Statistiques et graphiques détaillés
- 🕒 **Historique** - Suivi complet de toutes les opérations

## Prérequis

- Flutter SDK (3.0.0 ou supérieur)
- Android Studio / VS Code
- Dart SDK

## Installation

1. Clonez le projet
2. Installez les dépendances :
   ```bash
   flutter pub get
   ```

3. Lancez l'application :
   ```bash
   flutter run
   ```

## Structure du projet

```
lib/
├── main.dart                 # Point d'entrée
├── models/                   # Modèles de données
├── services/                 # Services (base de données, etc.)
├── providers/                # State management
├── screens/                  # Écrans de l'application
└── widgets/                  # Composants réutilisables
```

## Configuration de la base de données

L'application utilise SQLite pour stocker les données localement. La base de données est automatiquement créée au premier lancement.

## Build Android

Pour générer l'APK :
```bash
flutter build apk --release
```

Pour générer l'App Bundle :
```bash
flutter build appbundle --release
```

## Licence

Propriétaire - Tous droits réservés
