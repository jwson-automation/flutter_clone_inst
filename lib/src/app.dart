import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:flutter_clone_inst/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_inst/src/pages/home.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.pink[100],
          // appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              // Container(child: Center(child: Text('home'))),
              Container(child: Center(child: Text('search'))),
              Container(child: Center(child: Text('upload'))),
              Container(child: Center(child: Text('activity'))),
              Container(child: Center(child: Text('mypage'))),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.pink[400],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: controller.pageIndex.value, // 왜 안될까
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconPath.homeOff),
                activeIcon: ImageData(IconPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.searchOff),
                activeIcon: ImageData(IconPath.searchOn),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.uploadIcon),
                label: 'upload',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.activeOff),
                activeIcon: ImageData(IconPath.activeOn),
                label: 'active',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.pink[100]),
                ),
                label: 'profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
