import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/provider/main_provider.dart';
import 'package:palota_rent_app/user/bottom.dart';
import 'package:palota_rent_app/user/home.dart';
import 'package:palota_rent_app/user/refactoring.dart';
import 'package:provider/provider.dart';





class viewall extends StatelessWidget {
  String userId;
  String phone;
  String name;
  String profilephoto;
  viewall({super.key,required this.userId,required this.name,required this.phone,required this.profilephoto,required this.CarImgs});
  List<String>CarImgs=[
            "assets/car.png",
            "assets/car.png",
            "assets/car.png",
            "assets/car.png",
            "assets/car.png",
            "assets/car.png",
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
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey.shade300,)),
            Padding(
              padding:  EdgeInsets.only(left: 100),
              child: Text("TOP DEALS",style: TextStyle(
                  color: Colors.amber.shade50,
                  fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ],
        ),
        SizedBox(height: 15,),
        search(context),
SizedBox(height: 6,),
        Consumer<MainProvider>(
          builder: (context,value,child) {

            return GridView.builder(shrinkWrap: true,
              itemCount: value.DetailList.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (BuildContext context, int index) {
              var items=value.DetailList[index];
                  return  Container(
                      // height:100,
                      // width:170,
                      decoration: BoxDecoration(
                        image: DecorationImage(alignment: Alignment.topCenter,
                          image: NetworkImage(items.Image),
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
                            Text(items.CarName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                                Text("${items.Price}/perday",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                              ],
                            )
                          ],
                        ),
                      ),

                  );
                });
          }
        ),




      ]
      ),
    )
    )
    )
    );
  }
}
