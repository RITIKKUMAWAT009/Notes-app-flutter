import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:note_app/data/models/note/note_model.dart';
import 'package:note_app/domain/usercases/note/note_use_case.dart';

import '../../../service_locator.dart';

class HomeController extends GetxController{
  RxList<NoteModel>allNotes=<NoteModel>[].obs;
  @override
  void onInit() {
    loadData();
    super.onInit();
  }
Future<void> loadData()async{
  try{
  allNotes.value=sl<NoteUseCase>().getALlNotes()??[];
  print("all list length in homeController---${allNotes.length}");
  }catch(e){
    print("error in homeController $e");
  }
}

Future<void>deleteNote(int index)async{
    try{
      sl<NoteUseCase>().deleteNote(index);
    }catch(e){
      print("error while deleting---$e");
    }
}





  ///[SOME EXAMPLE CODE ]
// Color _getCardColor(int index) {
//   final baseColor = Colors.blueAccent;
//   final shadeFactor =7 * (index + 1); // Increase shade by position
//   return baseColor.withAlpha(255 - shadeFactor.clamp(0, 200));
// }
// Color _getCardColor(int index) {
//   // Generate a color with a different hue based on the index
//   final hue = (index * 40) % 360; // Vary hue to get different colors
//   return HSVColor.fromAHSV(1.0, hue.toDouble(), 0.8, 0.9).toColor();
// }
}