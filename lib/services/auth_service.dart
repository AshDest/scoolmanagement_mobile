import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'mock_data_service.dart';

class AuthService {
  // Set to true to use mock data (no backend needed)
  static const bool useMockData = true;

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
        user = User.fromJson(response['user'] ?? response);
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

  // Logout
  static Future<void> logout() async {
    await ApiService.clearToken();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.tokenKey);
    return token != null && token.isNotEmpty;
  }

  // Get current user info
  static Future<Map<String, String?>> getCurrentUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getString(AppConstants.userIdKey),
      'name': prefs.getString(AppConstants.userNameKey),
      'role': prefs.getString(AppConstants.userRoleKey),
    };
  }
}

