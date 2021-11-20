import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class exam extends StatefulWidget {
  @override
  _exam createState() => _exam();
}

PickedFile? _image;
List<Asset> images = <Asset>[];

class _exam extends State<exam> {

  // ------------------------------selectedAsset option사용-----------------------------
  getMImage() async {
    List<Asset> resultList = <Asset>[];
    resultList =
    await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,

        selectedAssets: images,
    );
    setState(() {
      images = resultList;
    });
  }
  Future getImage() async{
    var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    _image = image;
    setState(() {
    });
  }
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Container(
                  child: InkWell(
                    child: Text("awd",style: TextStyle(color: Colors.black),),
                    onTap: (){getMImage();},
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //
                //   height: MediaQuery.of(context).size.height*0.8,
                //   child: Center(
                //     child: _image == null
                //         ? Text("awd")
                //         :Image.file(File(_image!.path)),
                //   ),
                // ),
                images.isEmpty
                    ? Container()
                    : Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        Asset asset = images[index];
                        return Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          width: MediaQuery.of(context).size.width,
                          child:  AssetThumb(
                            asset: asset, width: 3000, height: 3000,),
                        );


                      }),
                ),
              ],
            )
        ),
      )


    );
  }
}