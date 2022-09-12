import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 } // 나중에 제대로 어떤 쓰임인지 이름 바꿔주기

class AvatarWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  String? nickname;
  AvatarType type;
  double? size;

  AvatarWidget(
      {Key? Key,
      required this.type,
      required this.thumbPath,
      this.hasStory,
      this.nickname,
      this.size});

  Widget type1Widget() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.purple,
          Colors.orange,
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
        break;
      case AvatarType.TYPE2:
        return Container();
        break;
      case AvatarType.TYPE3:
        return Container();
        break;
    }
  }
}
