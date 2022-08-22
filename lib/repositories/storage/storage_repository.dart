import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mips_project/repositories/database/database_repository.dart';
import '../../models/pet_model.dart';
import 'base_storage_repository.dart';

class StorageRepository extends BaseStorageRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<void> uploadImage(Pet pet,XFile image) async {
    try {
      await storage
          .ref('${pet.id}/${image.name}')
          .putFile(io.File(image.path))
          .then((p0) => DatabaseRepository()
          .updateUserPictures(pet, image.name));
    } catch (err) {
      print(err);
    }
  }

  @override
  Future<String> getDownloadURL(Pet pet,String imageName) async {
    String downloadURL =
        await storage.ref('${pet.id}/$imageName').getDownloadURL();
    return downloadURL;
  }
}
