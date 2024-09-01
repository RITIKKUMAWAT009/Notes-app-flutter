import 'package:flutter/material.dart';
import 'package:note_app/data/models/note/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final Color color;
  final Offset shadowOffset;
  final double height;
  final double width;

  const NoteCard(
      {super.key, required this.note,
      required this.color,
      required this.shadowOffset,
      this.height = 150,
      this.width = 350});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: shadowOffset,
              spreadRadius: 5,
              blurRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                overflow: TextOverflow.ellipsis,
                note.title,
                style: const TextStyle(color: Colors.white, fontSize: 22,),maxLines:2,),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                  overflow: TextOverflow.ellipsis,
                  note.content,
                  style: const TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white70, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
