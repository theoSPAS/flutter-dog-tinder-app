import 'package:equatable/equatable.dart';

import '../../models/pet_model.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String userId;

  const LoadProfile({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UpdateProfile extends ProfileEvent {
  final Pet pet;

  const UpdateProfile({required this.pet});

  @override
  List<Object> get props => [pet];
}
