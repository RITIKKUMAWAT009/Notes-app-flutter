import 'package:note_app/data/models/note/note_model.dart';

abstract class NoteRepository {
  List<NoteModel>? getAllNotes();
  Future<void> saveNote(NoteModel note);
  Future<void> deleteNoteAt(int index);
}
