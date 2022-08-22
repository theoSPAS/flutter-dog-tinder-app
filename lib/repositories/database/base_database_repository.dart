import '../../models/pet_model.dart';

abstract class BaseDatabaseRepository{
  Stream<Pet> getPet(String petId);
  Stream<List<Pet>> getPets(String petId, String gender, String breed);
  Future<void> createPet(Pet pet);
  Future<void> updatePet(Pet pet);
  Future<void> updateUserPictures(Pet pet, String imageName);
}