import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/avatar.widget.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:flutter_clone_inst/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        _myStory(),
        const SizedBox(
          width: 5,
        ),
        ...List.generate(
            100,
            ((index) => AvatarWidget(
                type: AvatarType.TYPE1,
                thumbPath:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUOIeegRG1HbSENz5FM6xG8O9RM2EksdL5Ng&usqp=CAU'
                //  size: 70,
                ))),
      ]),
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
        _postList(),
      ]),
    );
  }
}

Widget _postList() {
  return Column(
    children: List.generate(50, (index) => postWidget()).toList(),
  );
}

Widget _myStory() {
  return Stack(
    children: [
      AvatarWidget(
        type: AvatarType.TYPE2,
        size: 70,
        thumbPath: 'https://i.ytimg.com/vi/9_RQUEpbJoE/maxresdefault.jpg',
      ),
      Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 2)),
            child: const Center(
              child: Text(
                '+',
                style:
                    TextStyle(fontSize: 20, color: Colors.white, height: 1.1),
              ),
            ),
          ))
    ],
  );
}
