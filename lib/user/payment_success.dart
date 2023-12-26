import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/user/refactoring.dart';

import 'carview.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Padding(
      padding:  EdgeInsets.only(top: 200),
      child: Center(child: Image.asset("assets/tick.png",scale: 1.10,)),
    ),
      SizedBox(height: 100,),
      Text("Successful!",style: TextStyle(fontSize: 30,
          fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
      SizedBox(height: 20,),
      Text("Successfully Made Your Payment",style: TextStyle(fontSize: 15,
          fontWeight: FontWeight.w100,color: Colors.amber.shade50),),
      SizedBox(height: 60,),
      InkWell(
        onTap: (){
          callNext(context, carview());
        },
          child: button("DONE", height/20, width/3,)),

      
      ]
    )
    )
    )
    )
    );
  }
}
