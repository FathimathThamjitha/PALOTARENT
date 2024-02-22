import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/Call_Functions.dart';
import 'package:palota_rent_app/user/Payment_page.dart';
import 'package:palota_rent_app/constance/Refactoring.dart';

class paymentfail extends StatelessWidget {
  const paymentfail({super.key});

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
        child: Center(child:
        Image.asset("assets/payment_fail.png",color: Colors.red,),)
    ),
      SizedBox(height: 100,),
      Text("Payment Failed!",style: TextStyle(fontSize: 30,
          fontWeight: FontWeight.bold,color: Colors.red),),
      SizedBox(height: 60,),
      InkWell(
        onTap: (){
          callNext(context, paymentpage());
        },
          child: button("TRY AGAIN", height/20, width/3,)),
      ]

    )
    )
    )
    )
    );
  }
}
