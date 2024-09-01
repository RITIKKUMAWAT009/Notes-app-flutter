import 'package:note_app/data/models/note/note_model.dart';
import 'package:note_app/domain/entities/note_entity/note_entity.dart';
import 'package:note_app/domain/repository/note_repo/note_repo.dart';

import '../../../service_locator.dart';

class NoteUseCase {
  // final NoteRepository noteRepository;
  NoteUseCase();
  Future<void> addNote(NoteModel note){
    return sl<NoteRepository>().saveNote(note);
  }
  List<NoteModel>? getALlNotes(){
    return sl<NoteRepository>().getAllNotes();
  }
  Future<void>deleteNote(int index)async{
    return await sl<NoteRepository>().deleteNoteAt(index);
  }
}