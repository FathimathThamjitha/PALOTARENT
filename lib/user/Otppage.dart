import 'package:flutter/material.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:palota_rent_app/constance/Refactoring.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../Provider/login_provider.dart';




class Otp extends StatelessWidget {
  const Otp({super.key});

  get controller => null;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child: Scaffold(backgroundColor: Colors.transparent,
    body: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
    padding: const EdgeInsets.only(top: 60,left: 20),
    child: Text("Enter your OTP",style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.w800,color: Colors.amber.shade50),),
    ),
      Padding(
        padding:  EdgeInsets.only(left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text("Please enter the verification code sent",style: TextStyle(
                fontWeight: FontWeight.normal,fontSize: 12,color: Colors.amber.shade50),),
            Text("to +91 9074552753",style: TextStyle(
          fontWeight: FontWeight.normal,fontSize: 12,color: Colors.amber.shade50),),
            SizedBox(height: 30,),
    Padding(
      padding:  EdgeInsets.only(right: 15),
      child: Consumer<LoginProvider>(
        builder: (context,otp,child) {
          return Pinput(
            controller: otp.OTPController,
            length: 6,
            defaultPinTheme: PinTheme(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
             shape: BoxShape.rectangle,
              color: Color(0xff474E5B),
              borderRadius: BorderRadius.circular(10),

            ),textStyle: TextStyle(color: Colors.white)
          ),
            onCompleted: (value) {
              otp.verify(context);
            },

          );
        }
      ),
    ),
            Center(
              child: OtpTimerButton(
              backgroundColor:  Colors.transparent,
                // controller: controller,
                onPressed: () {},
                text: Text('OTP auto resend in ',style: TextStyle(
                  color: Colors.amber.shade50,
                  fontWeight: FontWeight.normal,fontSize: 12, ),),
                duration: 30,
              ),
            ),
          ],
    ),
    ),
      Expanded(child: SizedBox()),
      Consumer<LoginProvider>(
        builder: (context,otp,child) {
          return InkWell(
            onTap: (){
              otp.verify(context);
            },
              child: button("VERIFY", height/20, width/3,));
        }
      ),
    ],
        ),
    ),
    ),
    );
  }
  }

