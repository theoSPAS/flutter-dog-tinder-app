import 'package:image_picker/image_picker.dart';
import '../../models/pet_model.dart';

abstract class BaseStorageRepository{
  Future<void> uploadImage(Pet pet, XFile image);
  Future<String> getDownloadURL(Pet pet,String imageName);
}