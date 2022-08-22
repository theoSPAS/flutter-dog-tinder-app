import 'package:equatable/equatable.dart';
import 'package:mips_project/models/models.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadPets extends SwipeEvent {
  final String petId;

  const LoadPets({
    required this.petId,
  });

  @override
  List<Object> get props => [petId];
}

class UpdateHome extends SwipeEvent {
  final List<Pet>? pets;

  const UpdateHome({required this.pets});

  @override
  List<Object?> get props => [pets];
}

class SwipeLeft extends SwipeEvent {
  final Pet pet;

  const SwipeLeft({
    required this.pet,
  });

  @override
  List<Object?> get props => [pet];
}

class SwipeRight extends SwipeEvent {
  final Pet pet;

  const SwipeRight({
    required this.pet,
  });

  @override
  List<Object?> get props => [pet];
}
