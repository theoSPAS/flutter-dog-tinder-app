import 'package:equatable/equatable.dart';

import '../../models/pet_model.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();

  @override
  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<Pet> pets;

  const SwipeLoaded({
    required this.pets,
  });

  @override
  List<Object> get props => [pets];
}

class SwipeError extends SwipeState {}