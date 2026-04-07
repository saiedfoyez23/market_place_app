import 'dart:convert';

class JwtValidatorController {

  /// Decode Base64 URL safely
  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Invalid Base64');
    }

    return utf8.decode(base64Url.decode(output));
  }

  /// Decode JWT payload
  static Map<String, dynamic> _decodePayload(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    return json.decode(payload);
  }

  /// 🔥 Dynamic Role Validation
  static Map<String, dynamic> validateToken({
    required String token,
    List<String>? allowedRoles, // 👈 dynamic roles
  }) {
    try {
      final decoded = _decodePayload(token);

      // 🔹 Role validation (dynamic)
      if (allowedRoles != null && allowedRoles.isNotEmpty) {
        final role = decoded['role'];

        if (!allowedRoles.contains(role)) {
          return {
            "isValid": false,
            "message": "This is not a ${allowedRoles.first} account",
          };
        }
      }

      // 🔹 Email validation
      final email = decoded['email'];
      if (email == null || email.toString().isEmpty) {
        return {
          "isValid": false,
          "message": "Invalid email",
        };
      }

      return {
        "isValid": true,
        "data": decoded,
      };
    } catch (e) {
      return {
        "isValid": false,
        "message": "Invalid token",
      };
    }
  }


}