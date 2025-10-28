class Teacher {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String subject;
  final String? profileImage;

  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.subject,
    this.profileImage,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'].toString(),
      firstName: json['firstName'] ?? json['first_name'] ?? '',
      lastName: json['lastName'] ?? json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      subject: json['subject'] ?? '',
      profileImage: json['profileImage'] ?? json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'subject': subject,
      'profileImage': profileImage,
    };
  }

  String get fullName => '$firstName $lastName';
}

