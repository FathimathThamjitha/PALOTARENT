import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/Call_Functions.dart';
import 'package:palota_rent_app/user/Payment_success.dart';
import 'package:palota_rent_app/constance/Refactoring.dart';

import 'Bookingpage.dart';

class paymentpage extends StatefulWidget {
  const paymentpage({super.key});

  @override
  State<paymentpage> createState() => _paymentpageState();
}

class _paymentpageState extends State<paymentpage> {
  String? type;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return  SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child: Scaffold(backgroundColor: Colors.transparent,
    body: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Padding(
        padding:  EdgeInsets.only(left: 10),
        child: Row(
          children: [
            GestureDetector(onTap: (){
           // Navigator.push(context,
           // MaterialPageRoute(builder: (context) =>
           // Bookingpage()));
              back(context);

  },
                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
        Padding(
          padding:  EdgeInsets.only(left: 100),
          child: Text("PAYMENT",style: TextStyle(
              color: Colors.amber.shade50,
              fontSize: 20,fontWeight: FontWeight.bold),),
        ),],
    ),
      ),
SizedBox(height: 30,),
      Padding(
        padding:  EdgeInsets.only(left: 10),
        child: Container(
          height: 200,
        width: 340,
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff474E5B).withOpacity(0.30),
        ),
        child: Column(
        children: [
        ListTile(
        title: Text("Credit/Debit card",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,
        color: Colors.amber.shade50),),
        leading: Radio(value: "Credit/Debit Card",groupValue: type, onChanged: (value){
          setState(() {

            type=value;
          });
        }),

          trailing: Image.asset("assets/img_1.png"),
    ),
    Divider(color: Color(0xff474E5B),thickness: 2,),

          ListTile(
            title: Text("UPI",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,
                color: Colors.amber.shade50),),

            leading: Radio(value: "UPI", focusColor: Color(0xff474E5B),groupValue: type, onChanged: (value){
              setState(() {
                type=value;

              });
            }),

            trailing:Image.asset("assets/img_2.png"),
          ),
          Divider(color: Color(0xff474E5B),thickness: 2,),
          ListTile(
            title: Text("Cash on delivery",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,
                color: Colors.amber.shade50),),

            leading: Radio(value: "Cash On Delivery", focusColor: Color(0xff474E5B),groupValue: type, onChanged: (value){
              setState(() {
                type=value;

              });
            }),

          ),
        ]
    )
    ),
      ),
SizedBox(height: 180,),
     Container(
          height:200,
          width: width,
          color:Color(0xff474E5B) ,
          child: Padding(
            padding:  EdgeInsets.only(left: 15,top: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PRICE DETAILS",style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),),

 Divider(color: Colors.grey.shade300,thickness: 2,endIndent: 14,),
Column(
  children: [


                Row(
                  children: [
                    Text("price",style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),),
                    SizedBox(width: 180,),
                    Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                    Text("20000",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                  ],
                ),
             SizedBox(height: 30,),
              Row(
                children: [
                  Text("Delivery",style: TextStyle(fontSize: 17,
                      fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),),
                  SizedBox(width: 158,),
                  Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                  Text("1500",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                ],
              ),
    SizedBox(height: 30,),
    Row(
      children: [
        Text("Total Amount",style: TextStyle(fontSize: 17,
            fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),),
        SizedBox(width: 116,),
        Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
        Text("21500",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),

      ],
    ),
  ],
),

              ]
     )
          )
     ),



      Row(
        children: [
          Container(height: 66,
            width: 180,
            color: Colors.amber.shade50,
            child: Padding(
              padding:  EdgeInsets.only(left: 30,top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.currency_rupee_sharp,color: Colors.black,size: 13,),
                      Text("21500",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                    ],
                  ),
                      Padding(
                        padding:  EdgeInsets.only(right: 40),
                        child: Text("View Price Details",style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.bold,color: Colors.cyan.shade800),),
                      ),
                ],
              ),
            ),
          ),

              GestureDetector(onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>
    PaymentSuccess()));},
            child: Container(height: 66,
              width: 180,
              color: Colors.teal.shade300,
              child:  Padding(
                padding:  EdgeInsets.only(left: 80),
                child: Row(
                  children: [
                    Text("PAY",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                    Icon(Icons.arrow_forward,color: Colors.amber.shade50,)
                  ],
                ),
              ),
              ),

              ),
        ],
      )
            ]
        ),
          )
        ),




    );
  }
}
