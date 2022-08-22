import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final User? user;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      this.user});

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  @override
  bool get stringify => true;

  factory LoginState.initial() {
    return const LoginState(
        email: '', password: '', status: LoginStatus.initial, user: null);
  }

  @override
  List<Object?> get props => [email, password, status, user];

  LoginState copyWith(
      {String? email, String? password, LoginStatus? status, User? user}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user ?? this.user);
  }
}
