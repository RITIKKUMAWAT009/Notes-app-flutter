

import 'package:get_it/get_it.dart';
import 'package:note_app/config/random_color/random_data_generator.dart';
import 'package:note_app/data/repository/note_repo_impl/note_repo_impl.dart';
import 'package:note_app/data/sources/note_service/note_service.dart';
import 'package:note_app/domain/repository/note_repo/note_repo.dart';
import 'package:note_app/domain/usercases/note/note_use_case.dart';
import 'package:note_app/presentation/add_note/controller/add_note_controller.dart';
import 'package:note_app/presentation/home/controller/home_controller.dart';
import 'package:note_app/presentation/note_detail/controller/note_detail_controller.dart';

final sl =GetIt.instance;
void setUpServiceLocator(){


  // Register Data Sources
  // sl.registerLazySingleton<LocalNoteDataSource>(() => LocalNoteDataSource());
  sl.registerSingleton<NoteService>(NoteService());

  // // Register Repositories
  // sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));

  sl.registerSingleton<NoteRepository>(NoteRepoImpl(noteService: sl<NoteService>()),);


  // // Register Use Cases
  // sl.registerLazySingleton<AddNote>(() => AddNote(sl()));
  // sl.registerLazySingleton<EditNote>(() => EditNote(sl()));

  sl.registerSingleton<NoteUseCase>(NoteUseCase());

  ///[CONFIG]
  sl.registerSingleton<RandomDataGenerator>(RandomDataGenerator());


  // // Register Controllers
  // sl.registerFactory(() => NoteController(sl()));
  // sl.registerFactory(() => EditNoteController(sl()));
  sl.registerFactory<HomeController>(()=> HomeController());
  sl.registerFactory<AddNoteController>(() => AddNoteController(),);
  sl.registerFactory<NoteDetailController>(() => NoteDetailController(),);
}