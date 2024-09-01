import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/domain/usercases/note/note_use_case.dart';
import 'package:note_app/presentation/home/controller/home_controller.dart';

import '../../../service_locator.dart';

class NoteDetailController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();

  Future<void> deleteNote(int index, BuildContext context) async {
    try {
      sl<NoteUseCase>().deleteNote(index).then(
        (value) {
          _homeController.loadData();
          Get.showSnackbar(const GetSnackBar(
            backgroundColor: Colors.red,
            title: "RITIK ",
            borderRadius: 10,
            duration: Duration(seconds: 2),
            message: "Note Deleted",
          ));
          Navigator.pop(context);
        },
      );
    } catch (e) {
      print("error $e");
    }
  }
}
