import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;

  MessagePopup({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
              width: Get.width * 0.7,
              color: Colors.black,
              child: Column(
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      // fontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    message!,
                    style: const TextStyle(
                      // fontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: okCallback,
                        child: Text('확인'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black12),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: cancelCallback,
                        child: Text('취소'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
