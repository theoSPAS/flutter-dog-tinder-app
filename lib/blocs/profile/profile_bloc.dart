import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/profile/profile_event.dart';
import 'package:mips_project/blocs/profile/profile_state.dart';
import 'package:mips_project/repositories/database/database_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _authSubscription;

  ProfileBloc(
      {required AuthBloc authBloc,
      required DatabaseRepository databaseRepository})
      : _authBloc = authBloc,
        _databaseRepository = databaseRepository,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      //if (state.user is AuthUserChanged) {
        if (state.user != null) {
          add(LoadProfile(userId: state.user!.uid));
        }
     // }
    });
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    _databaseRepository.getPet(event.userId).listen((pet) {
      add(UpdateProfile(pet: pet));
    });
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    emit(ProfileLoaded(pet: event.pet));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
