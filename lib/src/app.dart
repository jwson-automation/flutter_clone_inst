import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:flutter_clone_inst/src/controller/bottom_nav_controller.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.pink[400],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: 0,
          onTap: (value) {
            //Setstate는 GetX를 쓰고 있어서 쓰지 않겠소
          },
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
      onWillPop: () async {
        return false; // False 닫지않겠다 / True 닫겠다
      },
    );
  }
}
