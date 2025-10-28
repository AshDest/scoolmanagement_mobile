import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.tokenKey);
  }

  static Map<String, String> _getHeaders({String? token}) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  // Generic GET request
  static Future<dynamic> get(String endpoint, {bool requiresAuth = true}) async {
    try {
      String? token;
      if (requiresAuth) {
        token = await _getToken();
      }

      final url = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await http.get(
        url,
        headers: _getHeaders(token: token),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Generic POST request
  static Future<dynamic> post(
      String endpoint,
      Map<String, dynamic> body, {
        bool requiresAuth = true,
      }) async {
    try {
      String? token;
      if (requiresAuth) {
        token = await _getToken();
      }

      final url = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await http.post(
        url,
        headers: _getHeaders(token: token),
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Generic PUT request
  static Future<dynamic> put(
      String endpoint,
      Map<String, dynamic> body, {
        bool requiresAuth = true,
      }) async {
    try {
      String? token;
      if (requiresAuth) {
        token = await _getToken();
      }

      final url = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await http.put(
        url,
        headers: _getHeaders(token: token),
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Generic DELETE request
  static Future<dynamic> delete(String endpoint, {bool requiresAuth = true}) async {
    try {
      String? token;
      if (requiresAuth) {
        token = await _getToken();
      }

      final url = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await http.delete(
        url,
        headers: _getHeaders(token: token),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {'success': true};
      }
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Please login again');
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      final errorBody = response.body.isNotEmpty
          ? jsonDecode(response.body)
          : {'message': 'Unknown error'};
      throw Exception(errorBody['message'] ?? 'Server error');
    }
  }

  // Save token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.tokenKey, token);
  }

  // Clear token (logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.tokenKey);
  }
}
