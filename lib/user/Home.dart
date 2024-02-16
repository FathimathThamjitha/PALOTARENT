import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/user/payment_fail.dart';
import 'package:palota_rent_app/constance/refactoring.dart';
import 'package:palota_rent_app/user/topbrands.dart';
import 'package:palota_rent_app/user/viewall.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import 'All_Cars.dart';
import 'Availablecars.dart';
import 'Carview.dart';
import 'urorder.dart';


class home extends StatelessWidget {
  home({super.key});
List <String> carsGrid=[
  "assets/fordgrid.png",
  "assets/fordgrid.png",
];
List <String> carImages=[
  "assets/benz.png",
  "assets/img.png",
  "assets/minilogo.png",
  "assets/volkswagen.png",
  "assets/toyota.png"
];
  @override
  Widget build(BuildContext context) {
    MainProvider provider= Provider.of<MainProvider>(context,listen: false);

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
                 Padding(
               padding: const EdgeInsets.only(left: 20,top: 10),
               child: Row(
                 children: [

                        Icon(Icons.menu,color: Colors.amber.shade50,),

                       SizedBox(width:width/ 2.10,),
                   GestureDetector(onTap:(){



                     Navigator.push(context, MaterialPageRoute(builder: (context) => paymentfail()));
                   },
                      child: Image.asset('assets/palotagrp.png',scale: 2.50,)),
        ],
      ),
      ),
            SizedBox(height: 20,),
            search(context),

                 SizedBox(height: 8,),
                 Padding(
                   padding: EdgeInsets.only(left: 13),
                   child: Row(
                     children: [
                       Text("Top Deals",style: TextStyle(fontSize: 15,
                           fontWeight: FontWeight.w800,color: Colors.amber.shade50),),
                       SizedBox(width: 170,),

                       Consumer<MainProvider>(
                           builder: (context,value,child) {
                           return GestureDetector(
                             onTap: (){
                               value.getAllCarDetailsSecond();
                               callNext(context, viewall(userId: '', name: '', phone: '', profilephoto: '', CarImgs: [],));
                               },

                             child: Row(
                               children: [
                                 Text("View all",style: TextStyle(fontSize: 15,
                                   fontWeight: FontWeight.w800,color: Colors.amber.shade50,),),
                                 Icon(Icons.arrow_forward_ios_rounded,color:Colors.amber.shade50,size: 16,),
                               ],
                             ),
                           );
                         }
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 8,),
                   Consumer<MainProvider>(
                     builder: (context,value,child) {
                       return Container(height: 150,
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           shrinkWrap: true,
                           itemCount: value.DetailList.length,
                           itemBuilder: (context, index) {
                             var items=value.DetailList[index];
                           return GestureDetector(
                             onTap: (){

                               Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) =>carview()));},
                             child: Padding(
                               padding:  EdgeInsets.only(left:6),
                               child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Container(
                                     height:150,
                                     width:170,
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
                                       padding:EdgeInsets.only(top: 100,left: 5),
                                       child:   Column(
                                         children: [
                                           Padding(
                                             padding:  EdgeInsets.only(right: 65),
                                             child: Text(items.CarName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                                           ),
                                           Row(
                                             children: [
                                               Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                                               Text("${items.Price}/perday",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           );
                         },),
                       );
                     }
                   ),

                 SizedBox(height: 5,),
                 Padding(
                   padding:  EdgeInsets.only(left: 5,right: 5),
                   child: ClipRRect(borderRadius: BorderRadius.circular(10),
                     child: ColoredBox(
                       color:  Colors.black45,
                       child:
            ListTile(
            title: Text('Availabe Cars',style:
            TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: Colors.amber.shade50,)),

            subtitle: Text("Long term and Short term",style:
            TextStyle(fontWeight:FontWeight.normal,fontSize: 15,color: Colors.amber.shade50,)
            ),
            trailing: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>AvailabelCars()));},
              child: Container(
                height: 22,
                width: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color(0xffD9D9D9),
                  ),
                child:Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.black,),
                  ),
            ),
            )
                     ),
                   ),
                 ),
        SizedBox(height: 10,),
         Container( height:185,
              width:349,
              decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(14),),
              child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 15,left: 10),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text("Top Brands",style:
              TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: Colors.amber.shade50,)),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 10,left: 210),
                      child:GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>Topbrands()));},
                        child:
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Color(0xffD9D9D9),
                        ),
                        child:Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.black,),
                      ),
                    ),
                    )
                  ],
                ),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BMWcars()));
              },
                child: Container( padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  height: 147,
                  width: width,
                  child:
                  Consumer<MainProvider>(
                    builder: (context,value,child) {

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:value.NameList.length,
                        itemBuilder: (context, index) {
                          var items=value.NameList[index];
                          return Container(margin: EdgeInsets.all(10),
                            // color: Color(0xffD9D9D9),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffD9D9D9),
                            image: DecorationImage(image: NetworkImage(items.Logo),fit: BoxFit.contain)


                            ),
                            height: 300,
                            width: 80,


                          );

                        },);
                    }
                  ),
                ),
              )


          ]
          )),

            SizedBox(height: 10,),
              GestureDetector(
    onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>urorder()));},
                child: Padding(
                  padding:  EdgeInsets.only(left: 5,right: 5),
                  child: Container(
                    height: 60,

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color:  Colors.black45,
                    ),
                      child:Padding(
                        padding:  EdgeInsets.only(bottom: 10),
                        child: Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Your order',style:
                            TextStyle(fontWeight:FontWeight.bold,
                              fontSize: 16,color: Colors.amber.shade50,)),
                            Image.asset("assets/urordericon.png"),
                            //
                          ],
                        ),
                      ),
                  ),
                ),
              ),
      ]
    ),
          )
    )
      ) );






  }
}
