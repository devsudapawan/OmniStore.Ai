import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../data/remote/supabase/auth_remote.dart';
import '../../../../data/repository/auth_repository.dart';

/// -------------------------------
/// Repository Provider
/// -------------------------------
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(AuthRemote());
});

/// -------------------------------
/// Auth State
/// -------------------------------
class LoginState {
  final bool isLoading;
  final String? error;

  const LoginState({
    this.isLoading = false,
    this.error,
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// -------------------------------
/// Auth Notifier
/// -------------------------------
class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository _repository;

  LoginNotifier(this._repository) : super(const LoginState());

  /// Send OTP
  Future<void> sendOtp(String email) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      await _repository.sendOtp(email);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Verify OTP
  Future<User?> verifyOtp({
    required String email,
    required String token,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final user = await _repository.verifyOtp(
        email: email,
        token: token,
      );

      state = state.copyWith(isLoading: false);

      return user;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Invalid OTP",
      );
      return null;
    }
  }
}

/// -------------------------------
/// Provider
/// -------------------------------
final loginProvider =
StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginNotifier(repository);
});