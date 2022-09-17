import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/pages/search/search_focus.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 100; i++) {
      groupBox[i % 3].add(1);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _appbar(),
          _body(),
        ]),
      ),
    );
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(SearchFocus());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffefefef)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 4,
                  ),
                  Text('검색',
                      style: TextStyle(fontSize: 15, color: Color(0xff838383)))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body() {
    // 그리드뷰를 사용하면 더 쉽게 간단하게 제작 가능하다.
    return Expanded(
      child: SingleChildScrollView(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                    height: Get.width * 0.33 * groupBox[index][jndex],
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                    )),
              ).toList(),
              // [

              // ],
            ),
          ),
        ).toList(),
      )),
    );
  }

  //         Container(
  //           height: 150,
  //           color: Colors.blue,
  //         ),
  //         Container(
  //           height: 150,
  //           color: Colors.yellow,
  //         ),
  //       ],
  //     ),
  //   ),
  //   Expanded(
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 150,
  //           color: Colors.blue,
  //         ),
  //         Container(
  //           height: 150,
  //           color: Colors.red,
  //         ),
  //         Container(
  //           height: 150,
  //           color: Colors.green,
  //         ),
  //       ],
  //     ),
  //   ),
  //   Expanded(
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 150,
  //           color: Colors.green,
  //         ),
  //         Container(
  //           height: 300,
  //           color: Colors.grey,
  //         )
  //       ],
  //     ),
  //   ),
//         // ],
//       ),
//     );
//   }
// }
}
