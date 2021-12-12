import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_picker/image_picker.dart';
import 'package:move_application/models/s3_upload.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:move_application/models/post_postingBoard.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';
import 'package:move_application/view/board/categories/cloth.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path/path.dart' as path;
class posting extends StatefulWidget {
  final String categoty;

  posting({required this.categoty});

  @override
  _posting createState() => _posting();
}

class _posting extends State<posting> {
  String Food = 'food';
  String Title = "";
  String Content = "";
  String BoardImage = "";
  PickedFile? _image;

//0= 타이틀,1=내용,2=이미지
  List<String> post_variable = ['', '', '', ''];


  Widget customTextField(@required int textVariable, String hintText) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextField(
          onChanged: (text) => post_variable[textVariable] = text,
          decoration: InputDecoration(

              // border:InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintText: hintText),
        ));
  }

  //이미지 한장만 가져오기
  Future getImage() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    _image = image;
    setState(() {});
  }

  //
  Future<List<String>> getImageFileFromAsset(List<Asset> asset) async {

    List<String> ImageUrls = [];
    for(int i = 0;i<asset.length;i++){

      final byteData = await asset[i].getByteData();
      final tempFile =
      File("${(await getTemporaryDirectory()).path}/${asset[i].name}");
      final file = await tempFile.writeAsBytes(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );

      String filePath = file.toString().split("File:").elementAt(1).split("'").elementAt(1);
      ImageUrls.add(filePath);

    }

    return ImageUrls;
  }

  List<Asset> images = <Asset>[];
  List<File>  fileImage = <File>[];


  getMImage() async {
    List<Asset> resultList = <Asset>[];
    resultList = await MultiImagePicker.pickImages(
      maxImages: 10,
      enableCamera: true,
      selectedAssets: images,
    );

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      List<Asset> images = <Asset>[];
    }

    return Scaffold(
        appBar: CustomAppbar("글 쓰기"),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField(0, "제목"),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (text) => post_variable[1] = text,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  maxLength: 500,
                  decoration: InputDecoration(
                      // border:InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      hintText: "내용을 입력하세요."),
                ),
              ),

              Container(
                margin: EdgeInsets.all(10.0),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: AssetImage(
                          "icons/camera1.png",
                        ),
                        width: 30,
                        height: 28,
                      ),
                    ],
                  ),
                  onTap: () {
                    getMImage();
                  },
                ),
              ),

              //여러 사진 불러와서 띄우기
              images.isEmpty
                  ? Container()
                  : Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (BuildContext context, int index) {
                              Asset asset = images[index];
                              return Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.yellow,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1)),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print('ad');
                                      },
                                      child: AssetThumb(
                                        asset: asset,
                                        width: 3000,
                                        height: 3000,
                                        spinner: const Center(
                                          child: SizedBox(
                                            width: 200,
                                            height: 50,
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Text((index + 1).toString() +
                                          '/' +
                                          images.length.toString()),
                                    ),

                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
              //사진하나불러오기
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.7,
              //   child: InkWell(
              //     child: Text(
              //       "사진 불러오기",
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     onTap: () {
              //       getImage();
              //     },
              //   ),
              // ),

              //aws
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.7,
              //   child: InkWell(
              //     child: Text(
              //       "업로드",
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     onTap: () {
              //       File storedImage = File(_image!.path);
              //       AwsS3.uploadFile(
              //           accessKey: "",
              //           secretKey: "",
              //           bucket: "capstone2-bikyeo",
              //           file: storedImage);
              //     },
              //   ),
              // ),

              //aws업로드 이미지 보여주기
              // (_image != null) ? Container(
              //   height: 200,
              //   width: MediaQuery.of(context).size.width,
              //   child: Image.file(
              //     File(_image!.path),
              //     fit: BoxFit.fill,
              //   ),
              // )
              //     :Container(),

              //작성버튼
              FutureBuilder(
                future: getImageFileFromAsset(images),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                  return Center(
                    child: RedRoundedActionButton(
                      callback: () async {
                        //snapshot은 List<String> file.path들
                        for(int i=0;i<snapshot.data.length;i++){
                          File storedImage = File(snapshot.data[i]);
                          BoardImage +=
                           'https://capstone2-bikyeo.s3.ap-northeast-2.amazonaws.com//'+path.basename(storedImage.path)+',';
                          AwsS3.uploadFile(
                              accessKey: "AKIA4A3FZ5KZFILVFRGT",
                              secretKey: "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",
                              bucket: "capstone2-bikyeo",
                              file: storedImage,
                          );
                        }

                        print(postBoard(1234.toString(),Food, BoardImage,
                            post_variable[1], post_variable[0]));
                        Navigator.pop(context,true);

                      },
                      botton_height: 0.012,
                      text: "완료",
                      botton_color: Colors.redAccent,
                      font_size: 12.5,
                      botton_width: 0.025,
                    ),
                  );
                },

              ),


              //이미지바꾸기
              // (images.length != 0)
              //     ?FutureBuilder(
              //   future: getImageFileFromAsset(images[1]),
              //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              //     print(snapshot.data);
              //     print(_image!.path);
              //     return  Image.file(
              //       File(snapshot.data),
              //       fit: BoxFit.fill,
              //     );
              //   },
              // )
              //     :Container(),

            ],
          ),
        ));
  }
}
