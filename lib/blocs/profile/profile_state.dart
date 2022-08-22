import 'package:equatable/equatable.dart';
import 'package:mips_project/models/models.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Pet pet;

  const ProfileLoaded({
    required this.pet,
  });

  @override
  List<Object> get props => [pet];
}
