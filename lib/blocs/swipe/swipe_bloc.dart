import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/auth/auth_state.dart';
import 'package:mips_project/blocs/swipe/swipe_event.dart';
import 'package:mips_project/blocs/swipe/swipe_state.dart';
import 'package:mips_project/models/models.dart';
import 'package:mips_project/repositories/database/database_repository.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final AuthBloc _authBloc;
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _authSubscription;

  SwipeBloc(
      {required AuthBloc authBloc,
      required DatabaseRepository databaseRepository})
      : _authBloc = authBloc,
        _databaseRepository = databaseRepository,
        super(SwipeLoading()) {
    on<LoadPets>(_onLoadUsers);
    on<UpdateHome>(_onUpdateHome);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.status == AuthStatus.authenticated) {
        add(LoadPets(petId: state.user!.uid));
      }
    });
  }

  void _onLoadUsers(
    LoadPets event,
    Emitter<SwipeState> emit,
  ) {
    _databaseRepository
        .getPets(event.petId, 'Male', 'Akita Inu')
        .listen((pets) {
      print('$pets');
      add(UpdateHome(pets: pets));
    });
  }

  void _onUpdateHome(UpdateHome event, Emitter<SwipeState> emit) {
    if (event.pets != null) {
      emit(SwipeLoaded(pets: event.pets!));
    } else {
      emit(SwipeError());
    }
  }

  void _onSwipeLeft(
    SwipeLeft event,
    Emitter<SwipeState> emit,
  ) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;

      List<Pet> pets = List.from(state.pets)..remove(event.pet);

      if (pets.isNotEmpty) {
        emit(SwipeLoaded(pets: pets));
      } else {
        emit(SwipeError());
      }
    }
  }

  void _onSwipeRight(
    SwipeRight event,
    Emitter<SwipeState> emit,
  ) {
    if (state is SwipeLoaded) {
      if (state is SwipeLoaded) {
        final state = this.state as SwipeLoaded;

        List<Pet> pets = List.from(state.pets)..remove(event.pet);

        if (pets.isNotEmpty) {
          emit(SwipeLoaded(pets: pets));
        } else {
          emit(SwipeError());
        }
      }
    }
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
