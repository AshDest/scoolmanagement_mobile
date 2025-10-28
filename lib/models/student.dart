class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String classId;
  final String className;
  final DateTime dateOfBirth;
  final String address;
  final String? profileImage;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.classId,
    required this.className,
    required this.dateOfBirth,
    required this.address,
    this.profileImage,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'].toString(),
      firstName: json['firstName'] ?? json['first_name'] ?? '',
      lastName: json['lastName'] ?? json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      classId: json['classId']?.toString() ?? json['class_id']?.toString() ?? '',
      className: json['className'] ?? json['class_name'] ?? '',
      dateOfBirth: json['dateOfBirth'] != null 
          ? DateTime.parse(json['dateOfBirth']) 
          : json['date_of_birth'] != null
              ? DateTime.parse(json['date_of_birth'])
              : DateTime.now(),
      address: json['address'] ?? '',
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
      'classId': classId,
      'className': className,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'address': address,
      'profileImage': profileImage,
    };
  }

  String get fullName => '$firstName $lastName';
}

