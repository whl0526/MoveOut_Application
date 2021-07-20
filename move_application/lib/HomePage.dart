import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();




}

class _HomePageState extends State<HomePage>{

  Future<Null> _onReFresh() async {
    setState(() {});
    print('d');
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       body: RefreshIndicator(onRefresh: _onReFresh,
         child: SingleChildScrollView(
           physics: AlwaysScrollableScrollPhysics(),
           child: Container(
             // decoration: BoxDecoration(
             //   border: Border(bottom: BorderSide(color: Colors.yellow,width: 5)),
             // ),
             //위쪽 상태바 바로 아래서 시작
             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),

             child: Column(

               children: [

                 Row(

                   mainAxisAlignment: MainAxisAlignment.center,

                   children: [

                     IconButton(
                       onPressed: () {                       },
                       icon: Icon(Icons.menu),
                     ),
                     Spacer(),
                     Text('비켜!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)),
                     Spacer(),
                     IconButton(
                       icon: Icon(Icons.gps_fixed),
                       onPressed: () {
                       },
                     )

                   ],
                 ),

                 Container(

                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(height: 50,),

                       Row(
                         children: [
                           Expanded(
                             child: Container(
                               decoration: BoxDecoration(
                                 border: Border(bottom: BorderSide(color: Colors.yellow,width: 5),top: BorderSide(color: Colors.yellow,width: 5),right: BorderSide(color: Colors.yellow,width: 5),left: BorderSide(color: Colors.yellow,width: 5)),
                               ),
                               child: Text("김민석",
                                 style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),
                                 textAlign: TextAlign.center,
                               ) ,
                             ),
                           )
                         ],

                       ),
                       Container(
                         color: Colors.black,
                         child:Container(

                           height: 60,
                           width: 350,
                           decoration: BoxDecoration(
                             border: Border(bottom: BorderSide(color: Colors.yellow,width: 5),right: BorderSide(color: Colors.yellow,width: 5),left: BorderSide(color: Colors.yellow,width: 5)),
                           ),
                           child: Text("회원번호 : 5581",
                             style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                             textAlign: TextAlign.center,
                           ) ,
                         ),
                       ),

                     ],
                   ),
                 ),

               ],
             ),


           ),
         ),),
    );
    throw UnimplementedError();
  }

}
