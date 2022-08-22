import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/pet_model.dart';

abstract class OnBoardingEvent extends Equatable{
  const OnBoardingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnBoarding extends OnBoardingEvent{
  final Pet pet;

  const StartOnBoarding({
    this.pet = const Pet(
      id: '',
      name: '',
      age: 0,
      gender: '',
      imageUrls: [],
      description: '',
      breed: '',
      location: '',
    ),
  });

  @override
  List<Object?> get props => [pet];
}

class UpdateUser extends OnBoardingEvent{
  final Pet pet;

  const UpdateUser({required this.pet});

  @override
  List<Object?> get props => [pet];
}

class UpdateUserImages extends OnBoardingEvent{
  final Pet? pet;
  final XFile image;

  const UpdateUserImages({required this.image, this.pet});

  @override
  List<Object?> get props => [pet, image];
}