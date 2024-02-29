import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/Top_Brands.dart';
import 'package:palota_rent_app/constance/Call_Functions.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import '../constance/Refactoring.dart';
import '../constance/Admin_Refactoring.dart';
import 'Car_Details.dart';


class View_Cars_Addig extends StatelessWidget {
  String from;
  String Brandid;
  View_Cars_Addig({super.key,required this.from,required this.Brandid});
  List<String>carimage=[
    "assets/ford.png",

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
    body: Column(
    children: [
    Row(
    children: [
    Padding(
    padding:  EdgeInsets.only(left: 10,top: 10),
    child: GestureDetector(onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Topbrandscars()));
    },
    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
    ),
      SizedBox(width: 40,),
      Padding(
        padding:  EdgeInsets.only(left: 90,top: 10),
        child:  Text(from,style: TextStyle(
            color: Colors.amber.shade50,
            fontSize: 20,fontWeight: FontWeight.bold),),

    ),
    ]),
      SizedBox(height: 20,),
      Expanded(
        child: Consumer<MainProvider>(
          builder: (context,value2,child) {
            return ListView.builder(
              itemCount:value2.DetailList.length,
              itemBuilder: (context, index) {
                var items=value2.DetailList[index];
              return Column(
                children: [
              value2.Getcar?Center(child: Text("No data available....",style: TextStyle(color: Colors.amber.shade50),)):Container(
                      height:400,
                      width:340,
                      decoration: BoxDecoration(

                        // color: Color(0xff000000),
                        color: Color(0xff474E5B).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:
                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                                image: DecorationImage(image: NetworkImage(items.Image),fit: BoxFit.fill)
                              ),
                              width: width,
                              // child: Image.network(items.Image,fit: BoxFit.cover,),

                            ),
                            Column(
                              children: [
                                Align(
                                  alignment:Alignment.topLeft ,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:5),
                                      child: Text(items.CarName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                                    )),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                                    Text("${items. Price}/per day",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Align(alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Icon(Icons.person,color: Color(0xffD9D9D9),),
                                            CarSB2A(items.Seats)  ,
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          height: 70,
                                          width: 3,
                                          color: Colors.amber.shade50,
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Icon(Icons.trolley,color: Color(0xffD9D9D9),),
                                            CarSB2A(items.Bags),                                  ],
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          height: 70,
                                          width: 3,
                                          color: Colors.amber.shade50,
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Icon(Icons.electric_meter,color: Color(0xffD9D9D9),),
                                            CarSB2A(items.Klm),                                  ],
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          height: 70,
                                          width: 3,
                                          color: Colors.amber.shade50,
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Image.asset("assets/gearbox.png",scale: 1.70,),
                                            Text(items.Transmission,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // SizedBox(height: ,),
                            Consumer<MainProvider>(
                              builder: (context,value,child) {

                                return Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(onTap:(){
                                        value.editCardetails(items.CarName,items.Klm,items.Image,items.Price,items.Seats,items.Bags,items.Transmission);
                                        callNext(context, CarDetails(from: from,Brandid:Brandid,pagefrom: "EDIT", editid:items.id,));
                                      },
                                          child: canceldelete("Edit")),
                                      SizedBox(width: 20,),
                                      InkWell(
                                         onTap: (){
                                           showDialog(
                                               context: context,
                                               builder: (ctx) => AlertDialog(
                                                 backgroundColor: Colors.teal.shade50,

                                                 actions: <Widget>[
                                                   Column(
                                                     crossAxisAlignment:
                                                     CrossAxisAlignment.start,
                                                     children: [
                                                       SizedBox(height: height/50,),
                                                       Container(
                                                         // height: height/5,
                                                         decoration: BoxDecoration(
                                                             borderRadius:
                                                             BorderRadius.circular(5),
                                                             color: Colors.black26),
                                                       ),
                                                       Text(
                                                         "Are you sure want to delete?",
                                                         style: TextStyle(
                                                             fontSize: 15,

                                                             color:Colors.black
                                                         ),
                                                       ),
                                                       Row(
                                                         children: [
                                                           SizedBox(width: width/3.5,),
                                                           TextButton(onPressed: (){
                                                             value.DeleteCarDetails(items.id,Brandid,context);
                                                             back(context);

                                                           }, child:Text("Yes",style: TextStyle( color: Colors.black),) ),
                                                           TextButton(onPressed: (){
                                                            back(context);

                                                           }, child:Text("No",style: TextStyle(color: Colors.red),) ),

                                                         ],
                                                       )

                                                     ],
                                                   ),
                                                 ],
                                               ),
                                               );
                                   
                                         } ,
                                          child: canceldelete("Delete")),


                                    ]
                                );
                              }
                            ),
                          ]
                      )
                  ),
                  SizedBox(height: 10,),
                ],
              );
            },);
          }
        ),
      ),

                  ],
                ),
      floatingActionButton: Consumer<MainProvider>(
        builder: (context,val,child) {
          return FloatingActionButton(
              child: Icon(Icons.add,color: Colors.amber.shade50,size:30,),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              backgroundColor: Color(0xff474E5B),
              onPressed: (){
               val.ClearDetails();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    CarDetails(from: from,Brandid: Brandid,pagefrom: "NEW", editid: '',)));
              });
        }
      ),

    ),
        ),

    );


  }
}
