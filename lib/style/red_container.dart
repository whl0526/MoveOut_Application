

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const kPimaryColor = Color(0xffF7BB0E);

const kActionColor = Color(0xffF00000);

const kBackgroundColor = Color(0xff29282C);
const kMovieNameStyle =
TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white , );


final kPromaryColorTextStyle =
TextStyle(color: kPimaryColor, fontSize: 18.0, fontWeight: FontWeight.bold);

final BoxDecoration kRoundedFadedBorder = BoxDecoration(
    border: Border.all(color: Colors.white54, width: .5),
    borderRadius: BorderRadius.circular(15.0));


class RedRoundedActionButton extends StatelessWidget {
  RedRoundedActionButton({required this.text,required this.callback,required this.botton_height,required this.botton_width,required this.font_size,required this.botton_color });

  final String text;
  final double botton_height;
  final double botton_width;
  final double font_size;
  final Color botton_color;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(

        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * botton_height , horizontal:MediaQuery.of(context).size.width*botton_width),
        decoration: BoxDecoration(
            color: botton_color , borderRadius: BorderRadius.circular(15.0)/*,border: Border.all(width: 3)*/),
        child: Text(text, style: TextStyle(fontSize:font_size , fontWeight: FontWeight.bold , color:Colors.black ,letterSpacing: 1.0)),
      ),
    );
  }
}
