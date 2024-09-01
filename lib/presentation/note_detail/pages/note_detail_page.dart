import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/config/random_color/random_data_generator.dart';
import 'package:note_app/data/models/note/note_model.dart';
import 'package:note_app/presentation/note_detail/controller/note_detail_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/constants.dart';
import '../../../service_locator.dart';
import '../../add_note/widgets/custom_text_field.dart';

class NoteDetailPage extends StatelessWidget {
  final NoteModel note;
  final int index;
  const NoteDetailPage({super.key, required this.note, required this.index});
  @override
  Widget build(BuildContext context) {
    final Color bgColor=sl<RandomDataGenerator>().getCardColor(note.id);
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor.withOpacity(0.1),
        foregroundColor: Colors.white,
        title: const Text("Note"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        actions: [
          const Icon(
            Icons.edit,
            color: Colors.white,
          )
              .onTap(
                () {},
          ).paddingOnly(right: 10),
          const Icon(
            Icons.person,
            color: Colors.white,
          )
              .onTap(
                () {},
          ).paddingSymmetric(horizontal: 20)
        ],
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(5),
        child: Column(
          children: [
            buildContainer(100,size.width,bgColor,35,2,note.title),
            buildContainer(200,size.width,bgColor, 22,20,note.content),
            120.heightBox,
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    sl<NoteDetailController>().deleteNote(index,context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 50,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    Constants.delete,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
  Widget buildContainer(double height,double width,Color bgColor,double fontSize,int maxLines,String text){
    return Card(
        elevation: 20,
        shadowColor:Colors.black26,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 50.0, // Minimum height to avoid very small containers
              maxWidth: width, // Maximum width provided by the user
            ),
            width: width,
            child:Text(text,style: TextStyle(fontSize:fontSize,fontWeight: FontWeight.w400),),
          ),
        ));
  }
}
