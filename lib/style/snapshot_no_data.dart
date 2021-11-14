import 'package:flutter/material.dart';

class snapshotNoData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                color: Colors.yellow[500],
              ),
            )
          ],
        ));
  }
}