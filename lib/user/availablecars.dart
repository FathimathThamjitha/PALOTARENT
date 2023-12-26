import 'package:flutter/material.dart';
import 'package:palota_rent_app/user/home.dart';
import 'package:palota_rent_app/user/refactoring.dart';

class AvailabelCars extends StatelessWidget {
  AvailabelCars({super.key});
  List<String>CarImg=[

    "assets/car.png",
    "assets/car.png",
    "assets/car.png",
    "assets/car.png",
    "assets/car.png",

  ];

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
        padding:  EdgeInsets.only(left: 40,top: 10),
        child:  Text("AVAILABLE CARS",style: TextStyle(
            color: Colors.amber.shade50,
            fontSize: 20,fontWeight: FontWeight.bold),),
      )
      ],
    ),
            SizedBox(height: 20,),
            search(context),
            SizedBox(height: 6,),
            SizedBox(height: height,
                child: GridView.builder(shrinkWrap: true,
                    itemCount: CarImg.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                        // height:100,
                        // width:170,
                        decoration: BoxDecoration(
                          image: DecorationImage(alignment: Alignment.topCenter,
                            image: AssetImage(CarImg[index]),
                            // fit: BoxFit.cover,
                          ),
                          // color: Color(0xff000000),
                          color: Color(0xff474E5B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding:EdgeInsets.only(top: 90,left: 5),
                          child:   Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ford Mustang",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                                  Text("30000/perday",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                                ],
                              )
                            ],
                          ),
                        ),

                      );
                    }),
            ),
          ]
    )
    )
        ),
        )
    );
  }
}
