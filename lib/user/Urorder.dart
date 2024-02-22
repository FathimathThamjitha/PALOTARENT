import 'package:flutter/material.dart';
import 'package:palota_rent_app/user/Home.dart';
import 'package:palota_rent_app/constance/Refactoring.dart';

class urorder extends StatelessWidget {
  const urorder ({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Column(
    children: [
      Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 10,top: 10),
            child: GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
            },
                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
          ),
          SizedBox(width: 40,),
          Padding(
            padding:  EdgeInsets.only(left: 60,top: 10),
            child:  Text("YOUR ORDER",style: TextStyle(
                color: Colors.amber.shade50,
                fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      SizedBox(height: 34,),
      Yourorder("assets/carnobg.png","Audi RS5 Sportback","20000/perday",),
      Yourorder("assets/carnobg.png","Audi RS5 Sportback","20000/perday",),

      ]
    ),
    )
    )
        )
    );
  }
}
