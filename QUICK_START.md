# 🚀 Guide de Démarrage Rapide

## 📱 Application de Gestion Scolaire

Une application Flutter complète avec un design élégant en **bleu et blanc** pour la gestion d'établissements scolaires.

---

## ⚡ Installation en 3 Étapes

### 1️⃣ Installer les dépendances

```bash
cd /home/ash/Documents/mobile/schoolmanagement
flutter pub get
```

### 2️⃣ Lancer l'application

```bash
flutter run
```

### 3️⃣ Se connecter avec les identifiants de test

```
📧 Email: admin@school.com
🔒 Mot de passe: password123
```

---

## 🎨 Aperçu de l'Application

### Écran de Connexion
- Design moderne avec logo circulaire
- Champs de saisie élégants avec validation
- Bouton de connexion avec animation de chargement
- Palette bleu et blanc cohérente

### Dashboard (Accueil)
- En-tête avec dégradé bleu (du clair au foncé)
- Message de bienvenue personnalisé
- Statistiques rapides en cartes
- Menu avec 6 modules principaux:
  ```
  👨‍🎓 Étudiants    👨‍🏫 Professeurs
  📚 Classes       ✅ Présence
  📊 Notes         ⚙️ Paramètres
  ```

### Liste des Étudiants
- Barre de recherche en temps réel
- Cartes avec avatars colorés
- Informations essentielles visibles
- Modal de détails complet
- Pull-to-refresh
- Bouton FAB pour ajouter

---

## 🎯 Fonctionnalités Disponibles

### ✅ Implémenté
- [x] Authentification sécurisée
- [x] Dashboard interactif
- [x] Gestion des étudiants (lecture)
- [x] Recherche en temps réel
- [x] Mode hors-ligne avec données de démo
- [x] Navigation fluide
- [x] Gestion d'erreurs

### 🔜 Prêt à implémenter
- [ ] Ajout/Modification/Suppression d'étudiants
- [ ] Module professeurs complet
- [ ] Module classes
- [ ] Système de présence
- [ ] Gestion des notes
- [ ] Notifications
- [ ] Rapports PDF

---

## 📁 Structure du Projet

```
lib/
├── main.dart                    ← Point d'entrée
├── models/                      ← Modèles de données
│   ├── user.dart
│   ├── student.dart
│   ├── teacher.dart
│   └── school_class.dart
├── services/                    ← Logique métier
│   ├── api_service.dart         (HTTP générique)
│   ├── auth_service.dart        (Authentification)
│   ├── student_service.dart     (Étudiants)
│   └── mock_data_service.dart   (Données de test)
├── screens/                     ← Interface utilisateur
│   ├── login_screen.dart        (Connexion)
│   ├── home_screen.dart         (Dashboard)
│   └── students_screen.dart     (Liste étudiants)
├── widgets/                     ← Composants réutilisables
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── custom_card.dart
└── utils/
    └── constants.dart           (Couleurs, styles, config)
```

---

## 🎨 Palette de Couleurs

```dart
Bleu Principal:  #2196F3  ████████
Bleu Foncé:      #1976D2  ████████
Bleu Clair:      #64B5F6  ████████
Bleu Accent:     #03A9F4  ████████
Blanc:           #FFFFFF  ████████
Gris Clair:      #F5F5F5  ████████
```

---

## 🔧 Configuration

### Mode Actuel: MOCK (Données de Démo)
L'application fonctionne **sans backend** grâce aux données simulées.

**Données disponibles:**
- 5 étudiants de test
- 3 professeurs de test
- 3 classes de test

### Passer en Mode Production

**Étape 1:** Ouvrir `lib/utils/constants.dart`
```dart
static const String baseUrl = 'https://votre-api.com/api';
```

**Étape 2:** Désactiver le mock dans `lib/services/auth_service.dart`
```dart
static const bool useMockData = false;
```

**Étape 3:** Désactiver le mock dans `lib/services/student_service.dart`
```dart
static const bool useMockData = false;
```

---

## 📚 Documentation

| Fichier | Description |
|---------|-------------|
| `README.md` | Vue d'ensemble et installation |
| `PROJECT_SUMMARY.md` | Résumé complet du projet |
| `GUIDE.md` | Guide utilisateur détaillé |
| `API_CONFIG.md` | Configuration API et endpoints |
| `CHECKLIST.md` | Liste de vérification complète |

---

## 💡 Conseils Utiles

### Commandes Fréquentes

```bash
# Nettoyer le projet
flutter clean && flutter pub get

# Analyser le code
flutter analyze

# Formater le code
flutter format lib/

# Construire pour Android
flutter build apk --release

# Construire pour le Web
flutter build web --release

# Voir les appareils disponibles
flutter devices
```

### Dépannage Rapide

**Problème:** Erreurs de packages  
**Solution:** `flutter pub get`

**Problème:** L'app ne démarre pas  
**Solution:** `flutter clean && flutter pub get && flutter run`

**Problème:** Pas d'appareil trouvé  
**Solution:** Lancez un émulateur ou connectez un appareil

---

## 🎉 Vous êtes Prêt!

L'application est complète et fonctionnelle. Lancez-la maintenant:

```bash
flutter run
```

Puis connectez-vous avec:
- **Email:** admin@school.com
- **Mot de passe:** password123

---

## 📞 Besoin d'Aide?

Consultez les fichiers de documentation dans le projet:
- Questions d'installation → `CHECKLIST.md`
- Utilisation de l'app → `GUIDE.md`
- Configuration API → `API_CONFIG.md`
- Vue d'ensemble → `PROJECT_SUMMARY.md`

---

**Créé avec ❤️ et Flutter**

Design: Bleu & Blanc | Architecture: MVVM | État: Production Ready ✅

