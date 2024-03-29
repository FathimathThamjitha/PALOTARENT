import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/Front_Page.dart';
import 'package:palota_rent_app/constance/Call_Functions.dart';
import 'package:palota_rent_app/user/Home.dart';
import 'package:provider/provider.dart';

import '../user/Bottom.dart';
import '../user/Otppage.dart';
import 'main_provider.dart';

class LoginProvider extends ChangeNotifier{
  String VerificationId ="";
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController LoginController = TextEditingController();
  TextEditingController OTPController = TextEditingController();

  void sendotp(BuildContext context) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${LoginController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
            ));
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: OTPController.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        userAuthorisation(context,user.phoneNumber!);
      } else {
        if (kDebugMode) {
          print("6546");
        }}
      });
  }
  
  
  void userAuthorisation(BuildContext context,String?phone){
    String loginType='';
    String name='';
    String loginphone='';
    String photo='';
    String userId='';
    String carid='';

    MainProvider mainProvider = Provider.of<MainProvider>(context, listen:false);
    mainProvider.getBrandName();

    db.collection("USERS").where("PHONE",isEqualTo: phone).get().then((value){
      if(value.docs.isNotEmpty){
        for(var e in value.docs){
          Map<dynamic, dynamic> map = e.data();
          loginType= map["TYPE"].toString();
          name= map["NAME"].toString();
          loginphone= map["PHONE"].toString();
          userId = map["USER_ID"].toString();



          if(loginType == "ADMIN"){
            callNextReplacement(context, FrontPage());
          }else{
            db.collection("CUSTOMER").doc(userId).get().then((value) {
              if(value.exists) {
         mainProvider.getProfiledetails(userId);


         
             // photo= value.get("PHOTO").toString();
             mainProvider.getAllBrandDetails();
                callNextReplacement(context, Bottombar(userId: userId,phone: loginphone,name: name,profilephoto:photo ,));

              }

              });








          }
        }
      }
    });
  }

  TextEditingController CustomerNameController = TextEditingController();
  TextEditingController CustomerPhoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController DetailsController = TextEditingController();

  void Addbooking(String usrId) {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> bookingMap = HashMap();
    bookingMap["NAME"] = CustomerNameController.text.toString();
    bookingMap["PHONE"] = CustomerPhoneController.text.toString();
    bookingMap["DATE"] = dateController.text.toString();
    bookingMap["LOCATION"] = LocationController.text.toString();
    bookingMap["BOOKING_ID"] = id;
    // appointmentMap["USER_ID"] = usrId;
    bookingMap["ADDED_TIME"] = DateTime.now();
    // appointmentMap["STATUS"] = "REQUESTED";

    db.collection("APPOINTMENTS").doc(id).set(bookingMap);
    // getbooking();
    notifyListeners();
  }


}