import 'package:flutter/material.dart';
import 'package:move_application/style/text_style.dart';
import 'package:move_application/power_rack_1.dart';

import 'appbar.dart';

class weight_zone extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
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
                      onPressed: ()async{

                          final res = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Power_Rack_1()));
                          print(res);

                      }
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