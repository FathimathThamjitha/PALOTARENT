import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/View_Booking_Places.dart';
import 'package:palota_rent_app/constance/Call_Functions.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import '../constance/Refactoring.dart';

class add_booking_places extends StatelessWidget {
  String from;
  String Plcid;
   add_booking_places({super.key,required this.from,required this.Plcid});


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

    Padding(
      padding:  EdgeInsets.only(left: 7,top: 30),
      child: Container(
      height: height/3,
      width: width/1.04,
      decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(0.40),
      borderRadius: BorderRadius.circular(8),
      ),

      child: Padding(
      padding:  EdgeInsets.only(top: 40),
      child: Column(
      children: [
      SizedBox(width:250,
      height: 40,
      child: Consumer<MainProvider>(
        builder: (context,value,child) {
          return TextFormField(controller: value.PlaceController,
          cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            isCollapsed: true,
          contentPadding: EdgeInsets.all(8),
          fillColor: Color(0xffD9D9D9).withOpacity(0.30),
          filled: true,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none),
          hintText: 'Add Booking Places',hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,fontSize: 15),
          ),

          );
        }
      )
      ),

     SizedBox(height: 20,),
        Consumer<MainProvider>(
          builder: (context,value,child) {

            return InkWell(onTap: (){
              if (from == "NEW"){
              value.addBookingPlaces("NEW",'');
              }
              else{
                value.addBookingPlaces("EDIT",Plcid);



              }
              callNext(context, View_Booking_Places());

            },
              child: Container(
                height: height/22,
                width: width/5,
                color: Colors.amber.shade50,
                child: Center(
                  child: Text("ADD",style: TextStyle(
                      fontWeight: FontWeight.w500,fontSize:15,color: Colors.black),),
                ),
              ),
            );
          }
        )

      ]
                      )
                  ),

            ),
    ),




    ]
        )
    )
    )
        )
    );
  }
}
