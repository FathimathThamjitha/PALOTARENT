import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/constance/provider/login_provider.dart';
import 'package:palota_rent_app/constance/provider/main_provider.dart';
import 'package:palota_rent_app/user/refactoring.dart';
import 'package:provider/provider.dart';

import 'createac.dart';
import 'otppage.dart';

class Welcome extends StatelessWidget {
  String uderId;
  Welcome({super.key,required this.uderId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children:<Widget> [
            SizedBox(height: height,
              child: Stack(
                  children:[
        Image.asset("assets/ford.png"),
    Positioned(top: 185,height:height/1,
        child: Container(
          decoration: BoxDecoration(color: Color(0xff262C35),
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),topRight: Radius.circular(25))),
        height:height/3,
        width: width/1,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                padding:  EdgeInsets.only(top: 20,left: 20),
                    child: Text("Welcome,",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.amber.shade50),),
                    // SizedBox(height: height/15,),
                ),
               Consumer<LoginProvider>(
                 builder: (context,login,child) {
                   return texxtingss(login.LoginController);
                 }
               ),
               SizedBox(height: 140,),
               Consumer<LoginProvider>(
                 builder: (context,login,child) {
                   return
                     Consumer<LoginProvider>(
                     builder: (context,login3,child) {
                       return InkWell(
                         onTap: () {
                           login3.sendotp(context);
                         },
                           child: button("Login", height/20, width/3, ));
                     }
                   );
                 }
               ),
                SizedBox(height: 10,),
                 Consumer<MainProvider>(
                   builder: (context,value,child) {
                     return InkWell(
                       onTap: (){
                         value.clearNamePhone();

                         callNext(context, Crteac( userId: " ",from: "New",));
                       },
                         child: button("Create Account", height/20, width/3,));
                   }
                 ),
              ],
            ),

        ),
    ),
    ],
    ),
            ),
    ],
    ),
      ) , 

    );
  }
}
