import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String email;
  final String password;
  final SignUpStatus status;
  final User? pet;

  const SignUpState(
      {required this.email, required this.password, required this.status, required this.pet});

  factory SignUpState.initial() {
    return const SignUpState(
        email: '', password: '',
        status: SignUpStatus.initial,
        pet: null);
  }

  @override
  bool get stringify => true;

  SignUpState copyWith({
    String? email,
    String? password,
    SignUpStatus? status,
    User? pet
  }) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        pet: pet ?? this.pet);
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [email, password, status, pet];
}
