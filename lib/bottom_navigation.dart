// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
// // import 'package:note_app/presentation/home/controller/home_controller.dart';
// // import 'package:note_app/presentation/home/pages/home_page.dart';
// // import 'package:note_app/presentation/profile/pages/profile_page.dart';
// // import 'package:note_app/service_locator.dart';
// //
// // class CustomBottomNavigation extends StatefulWidget {
// //   const CustomBottomNavigation({super.key});
// //
// //   @override
// //   State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
// // }
// //
// // class _CustomBottomNavigationState extends State<CustomBottomNavigation> with SingleTickerProviderStateMixin{
// //   late TabController tabController;
// //   @override
// //   void initState() {
// //     super.initState();
// //     tabController=TabController(initialIndex: 0,length: 2, vsync: this);
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return BottomBar(
// //       fit: StackFit.expand,
// //       icon: (width, height) => Center(
// //         child: IconButton(
// //           padding: EdgeInsets.zero,
// //           onPressed: null,
// //           icon: Icon(
// //             Icons.arrow_upward_rounded,
// //             // color: unselectedColor,
// //             size: 50,
// //           ),
// //         ),
// //       ),
// //
// //       borderRadius: BorderRadius.circular(500),
// //       duration: Duration(seconds: 1),
// //       curve: Curves.decelerate,
// //       showIcon: true,
// //       width: MediaQuery.of(context).size.width * 0.8,
// //        barColor: Colors.blue,
// //       start: 2,
// //       end: 0,
// //       offset: 10,
// //       barAlignment: Alignment.bottomCenter,
// //       iconHeight: 35,
// //       iconWidth: 35,
// //       reverse: false,
// //
// //       hideOnScroll: true,
// //       scrollOpposite: false,
// //       onBottomBarHidden: () {},
// //       onBottomBarShown: () {},
// //       body: (context, controller) => TabBarView(
// //           controller: tabController,
// //           dragStartBehavior: DragStartBehavior.down,
// //           physics: const BouncingScrollPhysics(),
// //           children: [
// //             HomePage(homeController: sl<HomeController>()),
// //             ProfilePage(),
// //           ]
// //       ),
// //       child: TabBar(
// //         controller: tabController,onTap:(value) {
// //       },
// //         tabs: [
// //         Tab(icon: Icon(Icons.home),text:"Home",),
// //         Tab(icon: Icon(Icons.person),text:"Profile",)
// //       ],),
// //     );
// //   }
// // }
// //
// //
// //
//
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:note_app/presentation/add_note/pages/add_note.dart';
// import 'package:note_app/presentation/home/controller/home_controller.dart';
// import 'package:note_app/presentation/home/pages/home_page.dart';
// import 'package:note_app/presentation/profile/pages/profile_page.dart';
// import 'package:note_app/service_locator.dart';
//
// import 'presentation/add_note/controller/add_note_controller.dart';
//
// class NavigationExample extends StatelessWidget {
//   const NavigationExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => AnimatedNotchBottomBar(
//           blurFilterY: 10,
//           blurFilterX: 10,
//           notchColor: Colors.red,
//           showShadow: true,
//           showBlurBottomBar: false,
//           showBottomRadius: false,
//           textOverflow: TextOverflow.ellipsis,
//           showTopRadius: true,
//           circleMargin: 5,
//           notchShader: null,
//           removeMargins: false,
//           blurOpacity: 1,
//           notchBottomBarController:
//               NotchBottomBarController(index: controller.selectedIndex.value),
//           notchGradient: RadialGradient(colors: [
//             Colors.blue.shade100,
//             Colors.blue.shade200,
//             Colors.blue.shade400,
//             Colors.blue.shade600,
//           ]),
//           color: Colors.blueAccent,
//           elevation: 10,
//           textAlign: TextAlign.center,
//           onTap: (value) => controller.selectedIndex.value = value,
//           bottomBarItems: const [
//             BottomBarItem(
//               inActiveItem: Icon(Iconsax.home),
//               activeItem: Icon(Iconsax.home),
//               itemLabelWidget: Text(
//                 'Home',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//             BottomBarItem(
//               inActiveItem: Icon(Iconsax.user),
//               activeItem: Icon(Iconsax.user),
//               itemLabelWidget: Text(
//                 'Profile',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ],
//           kIconSize: 20,
//           kBottomRadius: 5,
//         ),
//       ),
//       body: Obx(() => controller.screen[controller.selectedIndex.value]),
//       floatingActionButton: Draggable(
//           feedback: FloatingActionButton(
//               backgroundColor: Colors.white,
//               child: const Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 35,
//               ),
//               onPressed: () {}),
//           childWhenDragging: Container(),
//           onDragEnd: (details) => print(details.offset),
//           child: FloatingActionButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   side: const BorderSide(color: Colors.white,width: 1,)),
//               backgroundColor: Colors.blueAccent,
//               child: const Icon(
//                 Icons.add,
//                 color: Colors.black,
//                 size: 35,
//               ),
//               onPressed: () {
//                 Navigator.push(context,MaterialPageRoute(builder: (context) => AddNotePage(addNoteController:sl<AddNoteController>()),));
//               })),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
//
// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//   final screen = [
//     HomePage(homeController: sl<HomeController>()),
//     const ProfilePage(),
//   ];
// }
