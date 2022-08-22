import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mips_project/repositories/auth/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      return user;
    } catch (err) {
      print('Auth repository $err');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    }catch(_){

    }
  }
}
