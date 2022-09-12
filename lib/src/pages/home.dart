import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            100,
            ((index) => Container(
                  width: 60,
                  height: 60,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageData(IconPath.logo, width: 270),
        actions: [
          GestureDetector(
              onTap: () => {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageData(IconPath.directMessage, width: 50),
              ))
        ],
        elevation: 0,
      ),
      body: ListView(children: [
        _storyBoardList(),
      ]),
    );
  }
}
