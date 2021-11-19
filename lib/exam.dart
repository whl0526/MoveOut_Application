import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class exam extends StatefulWidget {
  @override
  _exam createState() => _exam();
}

PickedFile? _image;

class _exam extends State<exam> {

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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: InkWell(
                child: Text("awd",style: TextStyle(color: Colors.black),),
                onTap: (){getImage();},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,

              height: MediaQuery.of(context).size.height*0.8,
              child: Center(
                child: _image == null
                    ? Text("awd")
                    :Image.file(File(_image!.path)),
              ),
            )
          ],
        )
      )

    );
  }
}