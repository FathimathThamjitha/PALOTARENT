import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/view_booking_details.dart';

import '../constance/refactoring.dart';
import 'front_page.dart';

class view_Bookings extends StatelessWidget {
  const view_Bookings({super.key});

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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FrontPage()));
    },
    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
    ),
    SizedBox(width: 40,),
    Padding(
    padding:  EdgeInsets.only(left: 60,top: 10),
    child:  Text("BOOKINGS",style: TextStyle(
    color: Colors.amber.shade50,
    fontSize: 20,fontWeight: FontWeight.bold),),

    ),]),
SizedBox(height: 25,),

      Row(
        children: [


          Padding(
            padding:  EdgeInsets.only(left: 20,top: 7),
            child: Text("Name:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
          ),
          SizedBox(width: 10,),
          Padding(
            padding:  EdgeInsets.only(top: 8),
            child: Text("Shibila",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
          ),
        ],
      ),
      SizedBox(height: 3,),
      Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20,top: 7),
            child: Text("Phone:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
          ),
          SizedBox(width: 10,),
          Padding(
            padding:  EdgeInsets.only(top: 8),
            child: Text("9074552753",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
          ),
        ],
      ),
       Align(alignment: Alignment.centerRight,
           child: InkWell(onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>View_Booking_Details()));
           },
               child: Icon(Icons.arrow_forward_ios,color: Colors.amber.shade50,size:30,))),
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

Divider(thickness: 2,color: Color(0xffD9D9D9),
endIndent: 5,indent: 5,)


    ])
    )
    )
    )
    );
  }
}
