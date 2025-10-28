import '../models/student.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'mock_data_service.dart';

class StudentService {
  // Set to true to use mock data (no backend needed)
  static const bool useMockData = true;

  // Get all students
  static Future<List<Student>> getAllStudents() async {
    try {
      if (useMockData) {
        return await MockDataService.getMockStudents();
      }

      final response = await ApiService.get(AppConstants.studentsEndpoint);
      final List<dynamic> data = response['data'] ?? response;
      return data.map((json) => Student.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load students: $e');
    }
  }

  // Get student by ID
  static Future<Student> getStudentById(String id) async {
    try {
      if (useMockData) {
        return await MockDataService.getMockStudentById(id);
      }

      final response = await ApiService.get('${AppConstants.studentsEndpoint}/$id');
      return Student.fromJson(response['data'] ?? response);
    } catch (e) {
      throw Exception('Failed to load student: $e');
    }
  }

  // Create student
  static Future<Student> createStudent(Student student) async {
    try {
      final response = await ApiService.post(
        AppConstants.studentsEndpoint,
        student.toJson(),
      );
      return Student.fromJson(response['data'] ?? response);
    } catch (e) {
      throw Exception('Failed to create student: $e');
    }
  }

  // Update student
  static Future<Student> updateStudent(Student student) async {
    try {
      final response = await ApiService.put(
        '${AppConstants.studentsEndpoint}/${student.id}',
        student.toJson(),
      );
      return Student.fromJson(response['data'] ?? response);
    } catch (e) {
      throw Exception('Failed to update student: $e');
    }
  }

  // Delete student
  static Future<void> deleteStudent(String id) async {
    try {
      await ApiService.delete('${AppConstants.studentsEndpoint}/$id');
    } catch (e) {
      throw Exception('Failed to delete student: $e');
    }
  }
}

