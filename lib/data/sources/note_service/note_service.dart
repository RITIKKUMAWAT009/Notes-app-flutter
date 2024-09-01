
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/models/note/note_model.dart';


class NoteService {
  static const _boxName="notesBox";
  Future<void> init()async{
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
    await Hive.openBox<NoteModel>(_boxName);
  }

List<NoteModel>? getAllNotes(){
    try{
      var box=Hive.box<NoteModel>(_boxName);
      return box.values.toList();
    }catch(e){
      if (kDebugMode) {
        print("error is------->> $e");
      }
    }
    return null;
}
Future<void>saveNote(NoteModel note)async{
    try{
      var box=Hive.box<NoteModel>(_boxName);
      await box.add(note);
    }catch(e){
      if (kDebugMode) {
        print("error while saving note  is------->> $e");
      }
    }
}

Future<void>deleteNote(int index)async{
    try{
      var box=Hive.box<NoteModel>(_boxName);
      await box.deleteAt(index);
    }catch(e){
      if (kDebugMode) {
        print("error while deleting is------->> $e");
      }
    }
}

Future<void>editNote(int index,NoteModel note)async{
    try{
      var box=Hive.box<NoteModel>(_boxName);
      await box.putAt(index,note);

    }catch(e){
      if (kDebugMode) {
        print("error while updating note $e");
      }
    }
}


}
