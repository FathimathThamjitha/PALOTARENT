import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palota_rent_app/user/welcome.dart';
import 'package:provider/provider.dart';

import '../constance/call_functions.dart';
import '../constance/provider/login_provider.dart';

class Splash extends StatefulWidget {
  String userId;
   Splash({super.key,required this.userId});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;
    LoginProvider loginProvider =
    Provider.of<LoginProvider>(context, listen: false);


    Timer( Duration(seconds: 4), () {
      if(loginUser==null){
        callNextReplacement(context, Welcome(uderId: widget.userId,));
      }else{
        loginProvider.userAuthorisation(context,loginUser.phoneNumber);

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 60,top: 160),
                child: Image.asset("assets/palotaSplash.png"),
              ),
              SizedBox(height: 80,),
             Image.asset("assets/splash.png")
            ],
        ),
        );
  }
}