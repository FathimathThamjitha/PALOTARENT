import 'package:flutter/material.dart';

import '../user/refactoring.dart';

class Add_Booking_Places extends StatelessWidget {
  const Add_Booking_Places({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // MainProvider provider=Provider.of<MainProvider>(context,listen: false );
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Row(
    children: [
    Padding(
    padding:  EdgeInsets.only(left: 10,top: 10),
    child:GestureDetector(onTap: (){
    Navigator.pop(context);
    },
    child:
    Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,),
    ),
    ),
    SizedBox(width: 40,),
    Padding(
    padding:  EdgeInsets.only(left: 50,top: 10),
    child:  Text("BOOKING PLACES",style: TextStyle(
    color: Colors.amber.shade50,
    fontSize: 20,fontWeight: FontWeight.bold),),
    )
    ],
    ),
  ]
    )
    )
    )
    )
    );
  }
}
