import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constants.dart';
import 'package:note_app/presentation/add_note/controller/add_note_controller.dart';
import 'package:note_app/presentation/add_note/widgets/custom_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class AddNotePage extends StatelessWidget {
  final AddNoteController addNoteController;
final Color bgColor;
   AddNotePage({
    super.key,
     required this.bgColor,
    required this.addNoteController,
  });

  final GlobalKey<ScaffoldState>scaffoldKey=GlobalKey<ScaffoldState>();
  final GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final Color bgColor = addNoteController.backgroundColor();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ).onTap(
          () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        title: Text(Constants.addNote),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(5),
        child: Form(
          autovalidateMode:AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                  bgColor: bgColor.withOpacity(0.7),
                  hintText: Constants.hintTitle,
                  fontSize: 30,
                  maxLines: 2,
                  controller: addNoteController.titleController,
                  text: Constants.title),
              CustomTextField(
                  bgColor: bgColor.withOpacity(0.7),
                  hintText: Constants.hintContent,
                  fontSize: 22,
                  maxLines: 10,
                  controller: addNoteController.contentController,
                  text: Constants.content),
              50.heightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 60,
                child: ElevatedButton(
                    onPressed: () async{
                      if(formKey.currentState!.validate()){
                        await addNoteController.addNote(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 50,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      Constants.confirm,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
              ),
              20.heightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width - 70,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 50,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      Constants.cancel,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
