#!/bin/bash

echo "🚀 Configuration de l'application de Gestion Scolaire"
echo "=================================================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter n'est pas installé. Veuillez installer Flutter d'abord."
    exit 1
fi

echo "✅ Flutter est installé"
flutter --version
echo ""

# Get dependencies
echo "📦 Installation des dépendances..."
flutter pub get

if [ $? -eq 0 ]; then
    echo "✅ Dépendances installées avec succès"
else
    echo "❌ Erreur lors de l'installation des dépendances"
    exit 1
fi

echo ""
echo "🔧 Analyse du code..."
flutter analyze

echo ""
echo "✅ Configuration terminée!"
echo ""
echo "Pour lancer l'application, utilisez:"
echo "  flutter run"
echo ""
echo "Identifiants de démo:"
echo "  Email: admin@school.com"
echo "  Mot de passe: password123"

