import 'package:supabase_flutter/supabase_flutter.dart';
import '../remote/supabase/auth_remote.dart';

class AuthRepository {
  final AuthRemote _remote;

  AuthRepository(this._remote);

  // Send OTP
  Future<void> sendOtp(String email) async {
    try {
      await _remote.sendOtp(email);
    } catch (e) {
      rethrow;
    }
  }

  // Verify OTP
  Future<User?> verifyOtp({
    required String email,
    required String token,
  }) async {
    try {
      final response =
      await _remote.verifyOtp(email: email, token: token);

      return response.user;
    } catch (e) {
      rethrow;
    }
  }

  // Current User
  User? getCurrentUser() {
    return _remote.currentUser;
  }

  // Logout
  Future<void> logout() async {
    await _remote.signOut();
  }
}