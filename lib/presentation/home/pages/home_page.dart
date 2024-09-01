import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/config/random_color/random_data_generator.dart';
import 'package:note_app/presentation/home/controller/home_controller.dart';
import 'package:note_app/presentation/note_detail/pages/note_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../service_locator.dart';
import '../../add_note/controller/add_note_controller.dart';
import '../../add_note/pages/add_note.dart';
import '../widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Note> notes = [
  //   Note(
  //     title: "Grocery Day",
  //     content: "carrots, cardamom, almond flour, cashews...",
  //   ),
  //   Note(
  //     title: "Taylor Swift Lyrics",
  //     content: "Songs and lyrics for every mood...",
  //   ),
  //   Note(
  //     title: "Lazy Painting Ideas",
  //     content: "Quick and easy painting ideas...",
  //   ),
  //   Note(
  //     title: "Grocery Day",
  //     content: "carrots, cardamom, almond flour, cashews...",
  //   ),
  //   Note(
  //     title: "Taylor Swift Lyrics",
  //     content: "Songs and lyrics for every mood...",
  //   ),
  //   Note(
  //     title: "Lazy Painting Ideas",
  //     content: "Quick and easy painting ideas...",
  //   ),
  //   Note(
  //     title: "Taylor Swift Lyrics",
  //     content: "Songs and lyrics for every mood...",
  //   ),
  //   Note(
  //     title: "Lazy Painting Ideas",
  //     content: "Quick and easy painting ideas...",
  //   ),
  // ];
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final randomDataGenerator = sl<RandomDataGenerator>();
    // final HomeController controller=sl<HomeController>();
    final Color bgColor = controller.allNotes.isEmpty
        ? Colors.white
        : randomDataGenerator
            .getCardColor(controller.allNotes[currentIndex].id);
    return Scaffold(
      backgroundColor: bgColor.withOpacity(0.6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor.withOpacity(0.1),
        foregroundColor: Colors.white,
        title: const Text("Your Notes"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.white,
          )
              .onTap(
                () {},
              )
              .paddingOnly(right: 10),
          const Icon(
            Icons.person,
            color: Colors.white,
          )
              .onTap(
                () {},
              )
              .paddingSymmetric(horizontal: 20)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Obx(
              () => Stack(
                alignment: Alignment.center,
                children: controller.allNotes.reversed.map((note) {
                  int index = controller.allNotes.indexOf(note);
                  return Positioned(
                    top: index * 8.0,
                    child: Dismissible(
                      key: Key(note.id),
                      direction: DismissDirection
                          .horizontal, // Allow swiping in any direction
                      onDismissed: controller.allNotes.length > 1
                          ? (direction) {
                              // print(notes.length);
                              if (index == 0) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    // Move the dismissed note to the end of the list
                                    currentIndex = index;
                                    controller.allNotes.remove(note);
                                    controller.allNotes.add(note);
                                  });
                                });
                              }
                            }
                          : null,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: randomDataGenerator.randomTransform(),
                        child: NoteCard(
                          note: note,
                          color: randomDataGenerator.getCardColor(note.id),
                          shadowOffset: const Offset(0, 15),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Obx(
              () => GridView.builder(
                itemCount: controller.allNotes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailPage(note:controller.allNotes[index],index:index),
                          ));
                    },
                    child: NoteCard(
                        note: controller.allNotes[index],
                        color: controller.allNotes.isEmpty
                            ? Colors.white
                            : randomDataGenerator
                                .getCardColor(controller.allNotes[index].id),
                        shadowOffset: const Offset(0, 5)),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Draggable(
          feedback: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {}),
          childWhenDragging: Container(),
          onDragEnd: (details) => print(details.offset),
          child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  )),
              backgroundColor: bgColor,
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNotePage(
                        bgColor:bgColor,
                          addNoteController: sl<AddNoteController>()),
                    ));
              })),
    );
  }
}
