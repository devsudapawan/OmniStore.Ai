import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemote {
  final _client = Supabase.instance.client;

  // Send Email OTP (Magic Link / OTP)
  Future<void> sendOtp(String email) async {
    await _client.auth.signInWithOtp(
      email: email,
      shouldCreateUser: true,
    );
  }

  // Verify OTP
  Future<AuthResponse> verifyOtp({
    required String email,
    required String token,
  }) async {
    final response = await _client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );

    return response;
  }

  // Sign Out
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // Get Current User
  User? get currentUser => _client.auth.currentUser;
}