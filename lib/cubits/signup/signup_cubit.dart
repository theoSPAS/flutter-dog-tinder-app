import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/cubits/signup/signup_state.dart';
import 'package:mips_project/repositories/auth/auth_repository.dart';

class SingUpCubit extends Cubit<SignUpState>{
  final AuthRepository _authRepository;

  SingUpCubit({required AuthRepository authRepository}) :
      _authRepository = authRepository,
     super(SignUpState.initial());

  void emailChanged(String value){
    emit(state.copyWith(email: value, status: SignUpStatus.initial));
  }
  
  void passwordChanged(String value){
    emit(state.copyWith(password: value, status: SignUpStatus.initial));
  }

  Future<void> signUpWithCredentials() async{
    if(!state.isValid || state.status == SignUpStatus.submitting) return;
    emit(state.copyWith(status: SignUpStatus.submitting));
    try{
      var pet = await _authRepository.signUp(email: state.email, password: state.password);
      emit(state.copyWith(status: SignUpStatus.success, pet: pet));
    }catch(_){}
  }
}