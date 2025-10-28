import '../models/student.dart';
import '../models/teacher.dart';
import '../models/school_class.dart';
import '../models/user.dart';

/// Service de données simulées pour les tests
/// Utilisez ce service si vous n'avez pas encore de backend
class MockDataService {
  // Mock Users
  static final User mockAdmin = User(
    id: '1',
    name: 'Admin User',
    email: 'admin@school.com',
    role: 'admin',
    token: 'mock_token_123456789',
  );

  // Mock Students
  static final List<Student> mockStudents = [
    Student(
      id: '1',
      firstName: 'Jean',
      lastName: 'Dupont',
      email: 'jean.dupont@email.com',
      phone: '+33 6 12 34 56 78',
      classId: '1',
      className: 'Terminale S',
      dateOfBirth: DateTime(2005, 5, 15),
      address: '123 Rue de la Paix, Paris',
    ),
    Student(
      id: '2',
      firstName: 'Marie',
      lastName: 'Martin',
      email: 'marie.martin@email.com',
      phone: '+33 6 23 45 67 89',
      classId: '1',
      className: 'Terminale S',
      dateOfBirth: DateTime(2005, 8, 20),
      address: '456 Avenue des Champs, Lyon',
    ),
    Student(
      id: '3',
      firstName: 'Pierre',
      lastName: 'Dubois',
      email: 'pierre.dubois@email.com',
      phone: '+33 6 34 56 78 90',
      classId: '2',
      className: 'Première ES',
      dateOfBirth: DateTime(2006, 3, 10),
      address: '789 Boulevard Saint-Michel, Marseille',
    ),
    Student(
      id: '4',
      firstName: 'Sophie',
      lastName: 'Lefebvre',
      email: 'sophie.lefebvre@email.com',
      phone: '+33 6 45 67 89 01',
      classId: '2',
      className: 'Première ES',
      dateOfBirth: DateTime(2006, 11, 25),
      address: '321 Rue Victor Hugo, Toulouse',
    ),
    Student(
      id: '5',
      firstName: 'Thomas',
      lastName: 'Bernard',
      email: 'thomas.bernard@email.com',
      phone: '+33 6 56 78 90 12',
      classId: '3',
      className: 'Seconde A',
      dateOfBirth: DateTime(2007, 1, 30),
      address: '654 Avenue de la République, Nice',
    ),
  ];

  // Mock Teachers
  static final List<Teacher> mockTeachers = [
    Teacher(
      id: '1',
      firstName: 'Pierre',
      lastName: 'Leclerc',
      email: 'pierre.leclerc@school.com',
      phone: '+33 6 11 22 33 44',
      subject: 'Mathématiques',
    ),
    Teacher(
      id: '2',
      firstName: 'Anne',
      lastName: 'Moreau',
      email: 'anne.moreau@school.com',
      phone: '+33 6 22 33 44 55',
      subject: 'Français',
    ),
    Teacher(
      id: '3',
      firstName: 'Jacques',
      lastName: 'Petit',
      email: 'jacques.petit@school.com',
      phone: '+33 6 33 44 55 66',
      subject: 'Histoire-Géographie',
    ),
  ];

  // Mock Classes
  static final List<SchoolClass> mockClasses = [
    SchoolClass(
      id: '1',
      name: 'Terminale S',
      teacherId: '1',
      teacherName: 'Pierre Leclerc',
      studentCount: 28,
      schedule: 'Lundi-Vendredi 8h-17h',
    ),
    SchoolClass(
      id: '2',
      name: 'Première ES',
      teacherId: '2',
      teacherName: 'Anne Moreau',
      studentCount: 25,
      schedule: 'Lundi-Vendredi 8h-17h',
    ),
    SchoolClass(
      id: '3',
      name: 'Seconde A',
      teacherId: '3',
      teacherName: 'Jacques Petit',
      studentCount: 30,
      schedule: 'Lundi-Vendredi 8h-17h',
    ),
  ];

  // Mock login
  static Future<User> mockLogin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    if (email == 'admin@school.com' && password == 'password123') {
      return mockAdmin;
    }

    throw Exception('Email ou mot de passe incorrect');
  }

  // Get all mock students
  static Future<List<Student>> getMockStudents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockStudents;
  }

  // Get mock student by ID
  static Future<Student> getMockStudentById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final student = mockStudents.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Étudiant non trouvé'),
    );
    return student;
  }

  // Get all mock teachers
  static Future<List<Teacher>> getMockTeachers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockTeachers;
  }

  // Get all mock classes
  static Future<List<SchoolClass>> getMockClasses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockClasses;
  }
}

