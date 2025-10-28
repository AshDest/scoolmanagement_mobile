# Configuration de l'API

## Instructions

1. Remplacez `baseUrl` dans `lib/utils/constants.dart` avec l'URL de votre API
2. Assurez-vous que votre API retourne des données au format JSON
3. L'application attend les structures de données suivantes:

## Endpoints API

### Authentification

**POST** `/auth/login`

Request:
```json
{
  "email": "admin@school.com",
  "password": "password123"
}
```

Response:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "1",
    "name": "Admin User",
    "email": "admin@school.com",
    "role": "admin"
  }
}
```

### Étudiants

**GET** `/students`

Response:
```json
{
  "data": [
    {
      "id": "1",
      "firstName": "Jean",
      "lastName": "Dupont",
      "email": "jean.dupont@email.com",
      "phone": "+33 6 12 34 56 78",
      "classId": "1",
      "className": "Terminale S",
      "dateOfBirth": "2005-05-15",
      "address": "123 Rue de la Paix, Paris",
      "profileImage": null
    }
  ]
}
```

**GET** `/students/:id`

Response:
```json
{
  "data": {
    "id": "1",
    "firstName": "Jean",
    "lastName": "Dupont",
    "email": "jean.dupont@email.com",
    "phone": "+33 6 12 34 56 78",
    "classId": "1",
    "className": "Terminale S",
    "dateOfBirth": "2005-05-15",
    "address": "123 Rue de la Paix, Paris",
    "profileImage": null
  }
}
```

**POST** `/students`

Request:
```json
{
  "firstName": "Marie",
  "lastName": "Martin",
  "email": "marie.martin@email.com",
  "phone": "+33 6 98 76 54 32",
  "classId": "2",
  "className": "Première ES",
  "dateOfBirth": "2006-08-20",
  "address": "456 Avenue des Champs, Lyon"
}
```

**PUT** `/students/:id`

Request: (même format que POST)

**DELETE** `/students/:id`

### Professeurs

**GET** `/teachers`

Response:
```json
{
  "data": [
    {
      "id": "1",
      "firstName": "Pierre",
      "lastName": "Leclerc",
      "email": "pierre.leclerc@school.com",
      "phone": "+33 6 11 22 33 44",
      "subject": "Mathématiques",
      "profileImage": null
    }
  ]
}
```

### Classes

**GET** `/classes`

Response:
```json
{
  "data": [
    {
      "id": "1",
      "name": "Terminale S",
      "teacherId": "1",
      "teacherName": "Pierre Leclerc",
      "studentCount": 28,
      "schedule": "Lundi-Vendredi 8h-17h"
    }
  ]
}
```

## Headers

Toutes les requêtes authentifiées doivent inclure:

```
Authorization: Bearer {token}
Content-Type: application/json
Accept: application/json
```

## Codes de statut

- `200` - Succès
- `201` - Créé
- `400` - Requête invalide
- `401` - Non autorisé
- `404` - Non trouvé
- `500` - Erreur serveur

## Format des erreurs

```json
{
  "message": "Description de l'erreur"
}
```

