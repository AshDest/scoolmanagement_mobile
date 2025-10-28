# Application de Gestion Scolaire

Une application Flutter moderne et élégante pour la gestion scolaire avec un design en bleu et blanc.

## Fonctionnalités

- 🔐 Authentification sécurisée
- 👨‍🎓 Gestion des étudiants
- 👨‍🏫 Gestion des professeurs
- 📚 Gestion des classes
- ✅ Suivi de présence
- 📊 Gestion des notes
- 🎨 Design moderne en bleu et blanc

## Installation

1. Assurez-vous d'avoir Flutter installé (version 3.9.2 ou supérieure)
2. Clonez le projet
3. Installez les dépendances:

```bash
flutter pub get
```

4. Lancez l'application:

```bash
flutter run
```

## Configuration de l'API

Modifiez le fichier `lib/utils/constants.dart` pour configurer l'URL de votre API:

```dart
static const String baseUrl = 'https://votre-api.com/api';
```

## Structure du Projet

```
lib/
├── main.dart                 # Point d'entrée
├── models/                   # Modèles de données
│   ├── student.dart
│   ├── teacher.dart
│   ├── school_class.dart
│   └── user.dart
├── screens/                  # Écrans de l'application
│   ├── login_screen.dart
│   ├── home_screen.dart
│   └── students_screen.dart
├── services/                 # Services API
│   ├── api_service.dart
│   ├── auth_service.dart
│   └── student_service.dart
├── widgets/                  # Widgets réutilisables
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── custom_card.dart
└── utils/                    # Utilitaires
    └── constants.dart        # Constantes et styles
```

## Dépendances Principales

- `http` - Requêtes HTTP
- `provider` - Gestion d'état
- `shared_preferences` - Stockage local
- `intl` - Internationalisation

## Identifiants de Démo

- Email: admin@school.com
- Mot de passe: password123

## Personnalisation des Couleurs

Les couleurs peuvent être modifiées dans `lib/utils/constants.dart`:

```dart
class AppColors {
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color darkBlue = Color(0xFF1976D2);
  static const Color lightBlue = Color(0xFF64B5F6);
  // ...
}
```

## Contribution

Les contributions sont les bienvenues! N'hésitez pas à ouvrir une issue ou une pull request.

## Licence

MIT

