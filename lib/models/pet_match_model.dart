import 'package:equatable/equatable.dart';
import 'package:mips_project/models/pet_model.dart';

import 'chat_model.dart';

class PetMatch extends Equatable{
  final int id;
  final int petId;
  final Pet matchedPet;
  final List<Chat>? chat;

  const PetMatch({required this.chat, required this.id, required this.petId,required this.matchedPet});

  @override
  List<Object?> get props => [id, petId, matchedPet, chat];

  static List<PetMatch> matches = [
    PetMatch(
        id: 1,
        petId: 1,
        matchedPet: Pet.pets[1],
        chat: Chat.chats.where((chat) => chat.petId == 1 && chat.matchedPetId == 2).toList()),
    PetMatch(
        id: 2,
        petId: 1,
        matchedPet: Pet.pets[2],
        chat: Chat.chats.where((chat) => chat.petId == 1 && chat.matchedPetId == 3).toList()),
    PetMatch(
        id: 3,
        petId: 1,
        matchedPet: Pet.pets[3],
        chat: Chat.chats.where((chat) => chat.petId == 1 && chat.matchedPetId == 4).toList()),
    // PetMatch(
    //     id: 4,
    //     petId: 1,
    //     matchedPet: Pet.pets[4],
    //     chat: Chat.chats.where((chat) => chat.petId ==1 && chat.matchedPetId == 5).toList()),
    // PetMatch(
    //     id: 5,
    //     petId: 1,
    //     matchedPet: Pet.pets[5],
    //     chat: Chat.chats.where((chat) => chat.petId ==1 && chat.matchedPetId == 6).toList()),
    // PetMatch(
    //     id: 6,
    //     petId: 1,
    //     matchedPet: Pet.pets[6],
    //     chat: Chat.chats.where((chat) => chat.petId ==1 && chat.matchedPetId == 7).toList()),
    // PetMatch(
    //     id: 7,
    //     petId: 1,
    //     matchedPet: Pet.pets[7],
    //     chat: Chat.chats.where((chat) => chat.petId ==1 && chat.matchedPetId == 8).toList()),
    // PetMatch(
    //     id: 8,
    //     petId: 1,
    //     matchedPet: Pet.pets[8],
    //     chat: Chat.chats.where((chat) => chat.petId ==1 && chat.matchedPetId == 9).toList()),
  ];
}