import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: GestureDetector(
            onTap: Get.back,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconPath.backBtnIcon),
            )),
        titleSpacing: 0,
        title: Expanded(
          child: Container(
            // width: 50,
            // height: 50,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef)),
            child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '검색',
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 7, bottom: 7),
                    isDense: true)),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: AppBar().preferredSize.height,
                      width: Size.infinite.height,
                      child: TabBar(
                        controller: tabController,
                        tabs: const [
                          Text(
                            '인기',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            '계정',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            '계정',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            '계정',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            '계정',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          // _tabMenu(),
          // _tabView(),
        ],
      )),
    );
  }
}
