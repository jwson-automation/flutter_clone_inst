import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/avatar.widget.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';

class postWidget extends StatelessWidget {
  const postWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _header(),
        const SizedBox(
          height: 15,
        ),
        _image(),
        const SizedBox(
          height: 15,
        ),
        _infoCount(),
        const SizedBox(
          height: 2,
        ),
        _infoDescription(),
        _replyTextBtn(),
        const SizedBox(
          height: 2,
        ),
        _dateAgo(),
      ]),
      // color: Colors.red,
      // width: 50,
      // height: 200,
    );
  }

  _infoCount() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(
                width: 15,
              ),
              ImageData(
                IconPath.replyIcon,
                width: 60,
              ),
              const SizedBox(
                width: 15,
              ),
              ImageData(
                IconPath.directMessage,
                width: 55,
              )
            ],
          ),
          ImageData(
            IconPath.bookMarkOffIcon,
            width: 50,
          )
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '????????? 150???',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            '????????????\n????????????\n????????????\n????????????\n',
            prefixText: '???????????????????????????',
            onPrefixTap: () {
              print('????????? ???????????? ??????');
            },
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: '?????????',
            collapseText: '??????',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '?????? 199??? ?????? ??????',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1??????',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }
}

Widget _image() {
  return CachedNetworkImage(
      imageUrl:
          'https://imagesvc.meredithcorp.io/v3/mm/image?q=60&c=sc&poi=face&w=2000&h=1000&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F06%2Fdragon-2000.jpg');
}

Widget _header() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarWidget(
          type: AvatarType.TYPE3,
          thumbPath:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUOIeegRG1HbSENz5FM6xG8O9RM2EksdL5Ng&usqp=CAU',
          nickname: '???????????????????????????',
          size: 40,
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(
              IconPath.postMoreIcon,
              width: 30,
            ),
          ),
        )
      ],
    ),
  );
}
