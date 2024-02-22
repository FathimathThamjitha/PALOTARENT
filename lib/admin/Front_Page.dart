import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/View_Booings.dart';
import 'package:palota_rent_app/admin/Requests.dart';
import 'package:palota_rent_app/admin/Top_Brands.dart';
import 'package:palota_rent_app/admin/Users_List.dart';
import 'package:palota_rent_app/constance/Call_Functions.dart';
import 'package:palota_rent_app/user/Palota_start.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import '../constance/Refactoring.dart';
import '../user/Topbrands.dart';
import '../user/welcome.dart';
import 'View_Booking_Places.dart';
import 'Add_Brands.dart';
import '../constance/Admin_Refactoring.dart';
// import 'car_detail_fullview.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

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
      Consumer<MainProvider>(
        builder: (context,val,child) {
          return GestureDetector(onTap: (){
            val.getProfilelist();
            callNext(context, requestts());
          },
              child: containerList("Requests",height/13,width/1.5));
        }
      ),
        Consumer<MainProvider>(
          builder: (context,value,child) {

            return GestureDetector(onTap: (){
              value.getBrandName();

              callNext(context, Topbrandscars());


            },
                child: containerList("Top Brands",height/13,width/1.5),);
          }
        ),
      Consumer<MainProvider>(
        builder: (context,value,child) {

          return GestureDetector(onTap: (){

            value.getUserInfo();

            callNext(context, UsersList());
          },
            child: containerList("Users List",height/13,width/1.5),);
        }
      ),

        GestureDetector(onTap: (){
          callNext(context, view_Bookings());
        },
            child: containerList("View Bookings",height/13,width/1.5),),

         Consumer<MainProvider>(
           builder: (context,value,child) {
             return GestureDetector(
                 onTap: (){
                   value.getBookingPlaces();
                   callNext(context, View_Booking_Places());
                 },
                 child: containerList("Booking Places",height/13,width/1.5));
           }
         ),
      SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.only(left: 60),
        child: InkWell(
          onTap: (){
          FirebaseAuth auth=FirebaseAuth.instance;
          auth.signOut();
          callNextReplacement(context, Welcome(uderId: '',));
        },
          child: Container(
            height: 45,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color:Color(0xffD9D9D9).withOpacity(0.30),
            ),
            child: Center(
              child: Text("Log out",style: TextStyle(fontWeight:
              FontWeight.bold,fontSize: 17,
                  color: Colors.amber.shade50),),
            ),
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
