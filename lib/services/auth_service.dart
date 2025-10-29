import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'mock_data_service.dart';

class AuthService {
  // Set to false to use real API instead of mock data
  static const bool useMockData = false;

  // Login
  static Future<User> login(String email, String password) async {
    try {
      User user;

      if (useMockData) {
        // Use mock data
        user = await MockDataService.mockLogin(email, password);
      } else {
        // Use real API
        final response = await ApiService.post(
          AppConstants.loginEndpoint,
          {
            'email': email,
            'password': password,
          },
          requiresAuth: false,
        );

        // Votre API renvoie la structure complète avec success, message, data
        user = User.fromJson(response);
      }

      // Save token and user info
      if (user.token != null) {
        await ApiService.saveToken(user.token!);
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.userIdKey, user.id);
      await prefs.setString(AppConstants.userRoleKey, user.role);
      await prefs.setString(AppConstants.userNameKey, user.name);

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Rest of the methods remain the same
  static Future<void> logout() async {
    await ApiService.clearToken();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.tokenKey);
    return token != null && token.isNotEmpty;
  }

  static Future<Map<String, String?>> getCurrentUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getString(AppConstants.userIdKey),
      'name': prefs.getString(AppConstants.userNameKey),
      'role': prefs.getString(AppConstants.userRoleKey),
    };
  }
}