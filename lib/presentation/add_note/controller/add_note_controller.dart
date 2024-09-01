import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/config/random_color/random_data_generator.dart';
import 'package:note_app/data/models/note/note_model.dart';
import 'package:note_app/domain/usercases/note/note_use_case.dart';
import 'package:note_app/presentation/home/controller/home_controller.dart';
import 'package:note_app/service_locator.dart';

class AddNoteController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  ///[ADD_NOTE_TO_LIST]
  Future<void> addNote(BuildContext context) async {
    try {
      NoteModel note = NoteModel(
          id: DateTime.now().toIso8601String().toString(),
          title: titleController.text,
          content: contentController.text);
      sl<NoteUseCase>().addNote(note);
      print("data is ${note.title}");
      print("content is ${note.content}");
      // _homeController.allNotes.add(note);
      print(_homeController.allNotes.length);
      _homeController.loadData().then((value) {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: Colors.blueAccent,
          title: "RITIK",
          borderRadius: 10,
          duration: Duration(seconds: 2),
          message: "Note Created Successfully",
        ));
        Navigator.pop(context);
      },);
    } catch (e) {
      print("error is $e");
    }
  }

  Color backgroundColor() {
    return sl<RandomDataGenerator>().getCardColor(DateTime.now().toIso8601String());
  }
}
