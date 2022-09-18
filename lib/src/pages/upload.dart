import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

var albums = <AssetPathEntity>[];

class _UploadState extends State<Upload> {
  var headerTitle = '';
  var imageList = <AssetEntity>[];
  var albums = <AssetPathEntity>[];
  late AssetEntity selectedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPhotos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ImageData(
              IconPath.closeImage,
              // width: 50,
            ),
          ),
        ),
        title: Text(
          'New Post',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconPath.nextImage,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        // height: Get.height,
        height: width,
        color: Colors.grey,
        child: selectedImage == null
            ? Container()
            : _photoWidget(selectedImage, 500.toInt()));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(children: [
              Text(
                headerTitle,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Icon(Icons.arrow_drop_down)
            ]),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xff808080),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    ImageData(
                      IconPath.imageSelectIcon,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      '여러항목선택',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff808080)),
                child: ImageData(IconPath.cameraIcon),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return _photoWidget(imageList[index], 200);
        });
  }

  Widget _photoWidget(
    AssetEntity asset,
    int size,
  ) {
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(
          ThumbnailSize(200, 200),
        ),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return Opacity(
                opacity: asset == selectedImage ? 0.3 : 1,
                child: Image.memory(snapshot.data!, fit: BoxFit.cover));
          } else {
            return Container();
          }
        });
  }

  void _loadPhotos() async {
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
          type: RequestType.image,
          filterOption: FilterOptionGroup(
              imageOption: const FilterOption(
                  sizeConstraint:
                      SizeConstraint(minHeight: 100, minWidth: 100)),
              orders: [
                const OrderOption(type: OrderOptionType.createDate, asc: false),
              ]));
      _loadData();
    } else {
      //권한요청
    }
    ;
  }

  void update() => setState(() {});

  void _loadData() async {
    headerTitle = albums.first.name;
    await _pagingPhotos();
    update();

    // print(albums.first.name);
  }

  Future<void> _pagingPhotos() async {
    var photos = await albums.first.getAssetListPaged(page: 0, size: 100);

    imageList.addAll(photos);
    selectedImage = imageList.first;
  }
}
