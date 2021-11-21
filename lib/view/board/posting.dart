import 'package:flutter/material.dart';
import 'package:move_application/models/post_postingBoard.dart';
import 'package:move_application/style/red_container.dart';
import 'package:move_application/view/appbar.dart';
import 'package:move_application/view/board/categories/cloth.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class posting extends StatefulWidget{
  final String categoty;
  posting({required this.categoty});
  @override
  _posting createState() => _posting();
}



List<Asset> images = <Asset>[];

class _posting extends State<posting> {
  String Food = 'food';
  String Title ="";
  String Content ="";
  final RegExp _regExp = RegExp(r'[\uac00-\ud7af]', unicode: true);
//0= 타이틀,1=내용,2=이미지
  List<String> post_variable = ['','','',''];
  Widget customTextField(@required int textVariable,String hintText){
    return Container(
        width: MediaQuery.of(context).size.width*0.8,
        child: TextField(
          onChanged: (text) => post_variable[textVariable]=text,
          decoration: InputDecoration(

            // border:InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintText: hintText
          ),
        )
    );

  }

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



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: CustomAppbar("글쓰기"),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(0,"제목을 입력하세요"),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*0.8,
              child: TextField(

                onChanged: (text) => post_variable[1]=text,
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 500,
                decoration: InputDecoration(

                  // border:InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: "내용을 입력하세요"
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width*0.7,
              child:InkWell(
                child: Text("사진 불러오기",style: TextStyle(color: Colors.black),),
                onTap: (){getMImage();},
              ),
            ),
            images.isEmpty
                ? Container()
                : Container(
              height:200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    Asset asset = images[index];
                    return Container(
                      child:  AssetThumb(
                        asset: asset, width: 5, height: 5,),
                    );


                  }),
            ),

            Center(
              child: RedRoundedActionButton(
                callback:() async {
                  print(postBoard( 1234.toString(),Food, "none", post_variable[1], post_variable[0]));
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
      )

    );
  }
}
