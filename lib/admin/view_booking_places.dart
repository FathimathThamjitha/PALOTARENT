import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/constance/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../user/refactoring.dart';
import 'add_booking_places.dart';

class View_Booking_Places extends StatelessWidget {

  const View_Booking_Places({super.key,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider provider=Provider.of<MainProvider>(context,listen: false );
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(backgroundColor: Colors.transparent,
    body: Column(
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
    padding:  EdgeInsets.only(left: 10,top: 10),
    child:  Text("VIEW BOOKING PLACES",style: TextStyle(
    color: Colors.amber.shade50,
    fontSize: 20,fontWeight: FontWeight.bold),),
    )
    ],
    ),

   Consumer<MainProvider>(
     builder: (context,value,child) {
       return Container(
         child: ListView.builder(shrinkWrap: true,
           itemCount: value.BookingPlacelist.length,
           itemBuilder: (context, index) {
             return GestureDetector(
               onTap: (){
                 // value.getBookingPlaces(value.BookingPlacelist[index].id);

                 showDialog(
                   context: context,
                   builder: (ctx) => AlertDialog(
                     backgroundColor: Color(0xffD9D9D9),

                     content:Text("Are you sure want to edit or delete?",
                       style: TextStyle(
                         fontSize: 15,
                         // fontFamily: 'Futura',
                         color:  Color(0xff35103B),
                       ),),
                     actions: [
                       Row(
                         children: [
                           Consumer<MainProvider>(
                               builder: (context,value,child) {
                                 return TextButton(
                                     onPressed: () {
                                       finish(context);
                                       value.editBookingPlace(value.BookingPlacelist[index].id );
                                       print(value.BookingPlacelist[index].id+"kjjjj");
                                       callNext(context,add_booking_places(from: 'EDIT',
                                         Plcid:value.BookingPlacelist[index].id ,));

                                     },
                                     child: Text("EDIT",
                                       style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                                       ),));
                               }
                           ),
                           TextButton(
                             onPressed: () {
                               finish(context);
                               provider.deleteBookingPlaces(value.BookingPlacelist[index].id, context);
                             },

                             child: Text("DELETE",
                               style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                               ),),
                           ),

                         ],
                       ),
                     ],



                   ),
                 );

               },
               child: Container(margin: EdgeInsets.all(5),
                 height: height/13,width: width/1.5,

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(4)),
                   color: Color(0xff474E5B).withOpacity(0.30),
                 ),
                 child:  Center(
                   child: Text(value.BookingPlacelist[index].Place,style: TextStyle(fontWeight: FontWeight.bold,
                       fontSize: 17,color:Colors.amber.shade50),),
                 ),

               ),
             );

         },),
       );
     }
   )
  ],
    ),
        floatingActionButton:Consumer<MainProvider>(
          builder: (context,value,child) {
            return FloatingActionButton(
                child: Icon(Icons.add,color: Colors.amber.shade50,size:30,),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                backgroundColor: Color(0xff474E5B).withOpacity(0.40),
                onPressed: (){

                value.clearBookPlcfunction();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBrands()));
                  callNext(context, add_booking_places(from: "NEW",Plcid: "",));

                });
          }
        ),
    )
    )
    );
  }
}
