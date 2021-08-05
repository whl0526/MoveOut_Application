import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';

class weight_zone extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('웨이트 존',style: MyTextStyle(size: 30),),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: null,
        iconTheme: IconThemeData(color: Colors.yellow),

      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                      child: Text('Power Rack 1'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('Power Rack 2'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('lower body machine 1'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('lower body machine 2'),
                      onPressed: (){ }
                  ),RaisedButton(
                      child: Text('lower body machine 3'),
                      onPressed: (){ }
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}