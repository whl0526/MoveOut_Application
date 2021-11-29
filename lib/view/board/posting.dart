import 'dart:convert';
import 'dart:async';
import 'dart:io';
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
  final RegExp _regExp = RegExp(r'[\uac00-\ud7af]', unicode: true);
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

  Future getImage() async{
    var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    _image = image;
    setState(() {
    });
  }

  Future<File> getImageFileFromAsset(Asset asset) async {

      final byteData = await asset.getByteData();
      final tempFile =
          File("${(await getTemporaryDirectory()).path}/${asset.name}");
      final file = await tempFile.writeAsBytes(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );


    return file;
  }

  List<Asset> images = <Asset>[];

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
        appBar: CustomAppbar("글쓰기"),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField(0, "제목을 입력하세요"),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (text) => post_variable[1] = text,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  maxLength: 500,
                  decoration: InputDecoration(

                      // border:InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "내용을 입력하세요"),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: InkWell(
                  child: Text(
                    "사진 불러오기",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    getMImage();
                  },
                ),
              ),
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
                                   FutureBuilder(
                                     future: getImageFileFromAsset(asset),
                                     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {

                                     return Positioned(
                                         left:10,
                                         child: RaisedButton(
                                           child: Text('awd'),
                                           onPressed: () async {

                                           },
                                         ));

                                   },
                                   )

                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: InkWell(
                  child: Text(
                    "사진 불러오기",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    getImage();
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: InkWell(
                  child: Text(
                    "업로드",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    File storedImage = File(_image!.path);
                        AwsS3.uploadFile(
                        accessKey: "",
                        secretKey: "",
                        bucket: "capstone2-bikyeo",
                        file: storedImage);
                  },
                ),
              ),
              _image != null ? FutureBuilder(
                future:  AwsS3.uploadFile(
                    accessKey: "",
                    secretKey: "",
                    bucket: "capstone2-bikyeo",
                    file: File(_image!.path)),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData){
                    return Container(
                        child: Image.network(snapshot.data)
                    );
                  }
                  else return Container();
                },

              )
                :
            Container(),


              
              
              
              
              Center(
                child: RedRoundedActionButton(
                  callback: () async {
                    print(postBoard(1234.toString(), Food, "none",
                        post_variable[1], post_variable[0]));
                    Navigator.of(context).pop();
                  },
                  botton_height: 0.02,
                  text: "작성",
                  botton_color: Colors.redAccent,
                  font_size: 13,
                  botton_width: 0.02,
                ),
              )
            ],
          ),
        ));
  }
}
