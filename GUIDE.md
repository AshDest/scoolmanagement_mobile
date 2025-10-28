# Guide de l'Application

## 🎨 Design et Couleurs

L'application utilise une palette de couleurs professionnelle en **bleu et blanc**:

### Couleurs Principales
- **Bleu Principal**: `#2196F3` - Utilisé pour les éléments interactifs principaux
- **Bleu Foncé**: `#1976D2` - Pour les dégradés et accents
- **Bleu Clair**: `#64B5F6` - Pour les éléments secondaires
- **Blanc**: `#FFFFFF` - Arrière-plans et textes sur fond foncé
- **Gris Clair**: `#F5F5F5` - Arrière-plans alternatifs

## 📱 Écrans de l'Application

### 1. Écran de Démarrage (Splash Screen)
- Logo de l'école avec dégradé bleu
- Animation de chargement
- Vérification automatique de l'état de connexion

### 2. Écran de Connexion
- Design épuré et moderne
- Champs de saisie avec icônes
- Logo circulaire en haut
- Bouton de connexion arrondi
- Informations de démo affichées

**Identifiants de test:**
- Email: `admin@school.com`
- Mot de passe: `password123`

### 3. Écran d'Accueil (Dashboard)
- En-tête avec dégradé bleu
- Message de bienvenue personnalisé
- Statistiques rapides (Étudiants, Professeurs)
- Menu principal avec icônes:
  - 👨‍🎓 Étudiants
  - 👨‍🏫 Professeurs
  - 📚 Classes
  - ✅ Présence
  - 📊 Notes
  - ⚙️ Paramètres

### 4. Écran des Étudiants
- Barre de recherche en haut
- Liste scrollable avec avatars
- Cartes avec informations de base
- Pull-to-refresh pour actualiser
- Modal de détails en bas avec:
  - Avatar large
  - Nom complet
  - Badge de classe
  - Email
  - Téléphone
  - Date de naissance
  - Adresse

### 5. Bouton d'Ajout Flottant
- Bouton FAB bleu en bas à droite
- Prêt pour ajouter de nouveaux étudiants

## 🚀 Fonctionnalités

### Implémentées
- ✅ Authentification avec token
- ✅ Écran d'accueil avec statistiques
- ✅ Liste des étudiants
- ✅ Recherche d'étudiants
- ✅ Détails d'un étudiant
- ✅ Pull-to-refresh
- ✅ Gestion d'état
- ✅ Stockage local (SharedPreferences)
- ✅ Mode hors-ligne avec données simulées

### À Venir
- 📝 Ajout/Modification d'étudiants
- 👨‍🏫 Gestion des professeurs
- 📚 Gestion des classes
- ✅ Système de présence
- 📊 Gestion des notes
- 🔔 Notifications
- 📄 Génération de rapports
- 🌐 Mode multilingue

## 🎯 Points Forts du Design

### Interface Utilisateur
- **Clean et Moderne**: Interface épurée avec beaucoup d'espace blanc
- **Cohérence Visuelle**: Utilisation cohérente des couleurs et des formes
- **Responsive**: S'adapte à différentes tailles d'écran
- **Accessibilité**: Bonne hiérarchie visuelle et contraste

### Interactions
- **Animations Fluides**: Transitions douces entre les écrans
- **Feedback Visuel**: Boutons avec états de chargement
- **Gestes Intuitifs**: Pull-to-refresh, tap pour détails
- **Navigation Simple**: Structure claire et logique

### Composants Réutilisables
- `CustomButton`: Boutons personnalisés avec icônes et états de chargement
- `CustomTextField`: Champs de texte stylisés avec validation
- `CustomCard`: Cartes avec ombres et coins arrondis

## 📊 Architecture

### Structure MVVM
- **Models**: Classes de données (Student, Teacher, etc.)
- **Services**: Logique métier et appels API
- **Screens**: Interface utilisateur
- **Widgets**: Composants réutilisables
- **Utils**: Constantes, styles, helpers

### Gestion des Données
- **API REST**: Communication avec le backend
- **Cache Local**: SharedPreferences pour les données utilisateur
- **Mock Data**: Données de test pour le développement

## 🔧 Configuration

### Mode Mock (Par défaut)
Le mode mock est activé par défaut dans:
- `lib/services/auth_service.dart`
- `lib/services/student_service.dart`

```dart
static const bool useMockData = true;
```

### Mode Production
Pour utiliser une vraie API:
1. Changez `useMockData` à `false`
2. Configurez l'URL dans `lib/utils/constants.dart`
3. Assurez-vous que votre API suit le format décrit dans `API_CONFIG.md`

## 📱 Compatibilité

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎨 Personnalisation

### Changer les Couleurs
Modifiez `lib/utils/constants.dart`:

```dart
class AppColors {
  static const Color primaryBlue = Color(0xFF2196F3); // Votre couleur
  // ...
}
```

### Changer les Styles de Texte
```dart
class AppStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    // ...
  );
}
```

## 💡 Conseils d'Utilisation

1. **Premier Lancement**: Utilisez les identifiants de démo
2. **Navigation**: Explorez le menu principal depuis l'accueil
3. **Recherche**: Utilisez la barre de recherche pour filtrer les étudiants
4. **Détails**: Tapez sur une carte étudiant pour voir les détails
5. **Actualisation**: Tirez vers le bas pour recharger les données
6. **Déconnexion**: Utilisez l'icône logout en haut à droite

## 🐛 Dépannage

### L'application ne se lance pas
```bash
flutter clean
flutter pub get
flutter run
```

### Erreurs de dépendances
```bash
flutter pub upgrade
```

### Problèmes de cache
```bash
flutter clean
rm -rf .dart_tool
flutter pub get
```

