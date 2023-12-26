import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/view_booings.dart';

import '../user/refactoring.dart';
import 'admin_refactoring.dart';

class View_Booking_Details extends StatelessWidget {
  const View_Booking_Details({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child: Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Column(
    children: [
    Row(
    children: [
    Padding(
    padding:  EdgeInsets.only(left: 10,top: 10),
    child: GestureDetector(onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>view_Bookings()));
    },
    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
    ),
    SizedBox(width: 40,),
    Padding(
    padding:  EdgeInsets.only(left: 40,top: 10),
    child:  Text("BOOKING DETAILS",style: TextStyle(
    color: Colors.amber.shade50,
    fontSize: 20,fontWeight: FontWeight.bold),),

    ),]),
      SizedBox(height: 20,),
      Row(
        children: [
          Image.asset("assets/minicooper.png"),
          Column(
            children: [
              Text("MiniCooper",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50)),
              Row(
                children: [
                  Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                  Text("25000/perday",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),

                ],
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 20,),
      KeyValue("Name:","Shibila"),
      KeyValue("Phone:","9074552753"),
      KeyValue("Pick Location:","Perinthalmanna"),
      KeyValue("Drop Location:","Perinthalmanna"),
      KeyValue("Pick Date:","10/12/2023"),
      KeyValue("Drop Date","12/12/2023"),
      KeyValue("NO.Days:","1"),
      KeyValue("Payment:","Payed"),
      KeyValue("Payment Method:","Google Pay"),
      SizedBox(height: 10,),
      Divider(thickness: 2,color: Color(0xffD9D9D9),
        endIndent: 5,indent: 5,)



    ]
    )
    )
    )
    )
    );
  }
}
