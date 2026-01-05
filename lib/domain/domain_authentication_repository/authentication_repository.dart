import 'package:tourn/domain/domain_data_sources/firebase_auth_sevice.dart';

abstract class AuthenticationRepository {
  Future<void> loginInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthenticationRepositoryImpl({required this.firebaseAuthService});

  @override
  Future<void> loginInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuthService.loginInWithEmailAndPassword(
        // Truyền tham số email và password
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }
}
