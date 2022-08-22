import 'package:equatable/equatable.dart';
import '../../models/pet_model.dart';

abstract class OnBoardingState extends Equatable{
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingLoading extends OnBoardingState{}

class OnBoardingLoaded extends OnBoardingState{
  final Pet pet;

  const OnBoardingLoaded({required this.pet});

  @override
  List<Object> get props => [pet];
}