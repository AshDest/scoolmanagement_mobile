class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Votre API renvoie la structure : {"success":true,"message":"...","data":{"user":{...},"token":"..."}}

    // Si la réponse contient 'data', on l'utilise, sinon on utilise json directement
    final userData = json['data']?['user'] ?? json;
    final token = json['data']?['token'] ?? json['token'];

    return User(
      id: userData['id'].toString(),
      name: userData['name'] ?? '',
      email: userData['email'] ?? '',
      // Votre API utilise profile.role au lieu de role directement
      role: userData['profile']?['role'] ?? userData['role'] ?? 'user',
      token: token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'token': token,
    };
  }
}