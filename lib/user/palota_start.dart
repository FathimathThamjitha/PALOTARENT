import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/user//refactoring.dart';
import 'package:palota_rent_app/user/welcome.dart';

class Start extends StatelessWidget {
  String userId;
   Start ({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
     height: height,width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bgimg1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                         padding: const EdgeInsets.only(top: 30,left: 20),
                         child: Image.asset("assets/palotagrp.png" ,scale: 2,),
                       ),
                    SizedBox(height: 10,),
                    Text("A journey of a thousand",style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                    SizedBox(height: 2,),
                    Text("miles begins with a",style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                    SizedBox(height: 2,),
                    Text("single step ",style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 60),
                child: InkWell(
                    onTap: (){
                      callNext(context, Welcome(uderId: '',));
                    },
                    child: button("GET STARTED", height/20, width/3, )),
              )



                ],
          ),
        ),

      ),
    );
  }
}
