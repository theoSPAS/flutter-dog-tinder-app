import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mips_project/models/pet_model.dart';
import 'package:mips_project/repositories/database/base_database_repository.dart';
import 'package:mips_project/repositories/storage/storage_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<Pet> getPet(String petId) {
    print('Getting user images from DB');
    return _firebaseFirestore
        .collection('users')
        .doc(petId)
        .snapshots()
        .map((snap) => Pet.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(Pet pet, String imageName) async {
    String downloadUrl = await StorageRepository()
        .getDownloadURL(pet, imageName);

    return _firebaseFirestore.collection('users')
        .doc(pet.id).update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl])
    });
  }

  @override
  Future<void> createPet(Pet pet) async {
    await _firebaseFirestore
        .collection('users')
         .doc(pet.id)
         .set(pet.toMap());
  }

  @override
  Future<void> updatePet(Pet pet) {
    return _firebaseFirestore
        .collection('users')
        .doc(pet.id)
        .update(pet.toMap())
        .then((value) => print('Pet document updated.'));
  }

  @override
  Stream<List<Pet>> getPets(String petId, String gender, String breed) {
    return _firebaseFirestore.collection('users')
        .where('gender', isNotEqualTo: gender)
        .where('breed', isEqualTo: breed)
        .snapshots()
        .map((snap){
          return snap.docs.map((doc) => Pet.fromSnapshot(doc)).toList();
    });
  }
}
