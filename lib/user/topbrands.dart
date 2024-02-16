import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:palota_rent_app/user/Home.dart';
import 'package:palota_rent_app/constance/refactoring.dart';

import '../admin/add_brands.dart';
import 'All_Cars.dart';

class Topbrands extends StatelessWidget {
  Topbrands({super.key});
  List <String> carLogos=[
    "assets/benz.png",
    "assets/minilogo.png",
    "assets/img_3.png",
    "assets/toyota.png",
    "assets/benz.png",
    "assets/minilogo.png",
    "assets/img_3.png",
    "assets/toyota.png",
  ];

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
            padding:  EdgeInsets.only(left: 70,top: 10),
            child:  Text("TOP BRANDS",style: TextStyle(
                color: Colors.amber.shade50,
                fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      SizedBox(height: 40,),
      SizedBox(height: height,
        child: Container(
          height: 100,
          width: 250,
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: carLogos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return  GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>BMWcars()));},
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(alignment: Alignment.center,
                        image: AssetImage(carLogos[index]),
                      ),
                      color: Color(0xffD9D9D9).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),

                  ),
                );
              }),
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
