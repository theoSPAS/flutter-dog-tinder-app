import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_event.dart';
import 'package:mips_project/blocs/onboarding/onboarding_state.dart';
import 'package:mips_project/models/models.dart';
import 'package:mips_project/repositories/database/database_repository.dart';
import 'package:mips_project/repositories/storage/storage_repository.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final DatabaseRepository _databaseRepository;
  final StorageRepository _storageRepository;

  OnBoardingBloc(
      {required DatabaseRepository databaseRepository,
      required StorageRepository storageRepository})
      : _databaseRepository = databaseRepository,
        _storageRepository = storageRepository,
        super(OnBoardingLoading()) {
    on<StartOnBoarding>(_onStartOnBoarding);
    on<UpdateUser>(_onUpdateUser);
    on<UpdateUserImages>(_onUpdateUserImages);
  }

  void _onStartOnBoarding(
      StartOnBoarding event, Emitter<OnBoardingState> emit) async {
    await _databaseRepository.createPet(event.pet);
    emit(OnBoardingLoaded(pet: event.pet));
  }

  void _onUpdateUser(UpdateUser event, Emitter<OnBoardingState> emit) {
    if(state is OnBoardingLoaded){
      _databaseRepository.updatePet(event.pet);
      emit(OnBoardingLoaded(pet: event.pet));
    }
  }

  void _onUpdateUserImages(
      UpdateUserImages event,
      Emitter<OnBoardingState> emit,
      ) async {
    if (state is OnBoardingLoaded) {
      Pet user = (state as OnBoardingLoaded).pet;
      await _storageRepository.uploadImage(user, event.image);

      _databaseRepository.getPet(user.id!).listen((pet) {
        add(UpdateUser(pet: pet));
      });
    }
  }
}
