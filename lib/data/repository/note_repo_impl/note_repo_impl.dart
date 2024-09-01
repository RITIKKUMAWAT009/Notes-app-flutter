import 'package:note_app/data/models/note/note_model.dart';
import 'package:note_app/domain/repository/note_repo/note_repo.dart';

import '../../sources/note_service/note_service.dart';

class NoteRepoImpl extends NoteRepository{
  final NoteService noteService;
  NoteRepoImpl({required this.noteService});

  @override
  Future<void> deleteNoteAt(int index) async{
    return await noteService.deleteNote(index);
  }

  @override
 List<NoteModel>? getAllNotes() {
return noteService.getAllNotes();
  }

  @override
  Future<void> saveNote(NoteModel note) async{
return await noteService.saveNote(note);
  }
}