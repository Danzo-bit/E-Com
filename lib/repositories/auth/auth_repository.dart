import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:my_app/repositories/auth/base_auth_repository.dart';


class AuthRepository extends BaseAuthRepository{

  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
  :_firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<void> loginWithEmailAndPassword({required String email, required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(_){}
  }

  @override
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  @override
  Future<auth.User?> signUp({required String email, required String password}) async{
    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      return user;
    }catch(_){}
  }

  Stream<auth.User?> get user => _firebaseAuth.userChanges();

}