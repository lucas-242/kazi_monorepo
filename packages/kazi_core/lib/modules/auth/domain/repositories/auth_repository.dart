import 'package:kazi_core/shared/entities/user.dart';

abstract interface class AuthRepository {
  Future<User> signInWithPassword(String email, String password);

  Future<void> signUp();

  Future<User> refreshSession(String? refreshToken);

  Future<void> forgotPassword(String email);

  Future<void> resetPassword(String token, String newPassword);

  Future<void> changePassword(String currentPassword, String newPassword);
}
