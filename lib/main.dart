import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/bottom_navigation.dart';
import 'package:note_app/data/sources/note_service/note_service.dart';
import 'package:note_app/presentation/home/controller/home_controller.dart';

import 'package:note_app/presentation/home/pages/home_page.dart';
import 'package:note_app/presentation/splash/page/splash_page.dart';
import 'package:note_app/service_locator.dart';


Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
 await NoteService().init();
 Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomePage(homeController:sl<HomeController>(),),
      home: const SplashPage(),
    );
  }
}


