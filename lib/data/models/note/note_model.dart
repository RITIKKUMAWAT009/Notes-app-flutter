import 'package:hive/hive.dart';

part 'note_model.g.dart'; // This will be generated

@HiveType(typeId: 0)
class NoteModel extends HiveObject {

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  NoteModel( {required this.id,required this.title, required this.content});
}
