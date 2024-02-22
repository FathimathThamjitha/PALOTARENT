import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import '../constance/Refactoring.dart';
import 'Front_Page.dart';

class requestts extends StatelessWidget {
  const requestts({super.key});

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FrontPage()));
            },
                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
          ),
          SizedBox(width: 40,),
          Padding(
            padding:  EdgeInsets.only(left: 67,top: 10),
            child:  Text("REQUESTS",style: TextStyle(
                color: Colors.amber.shade50,
                fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      SizedBox(height: 10,),
            Expanded(
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return value.NamePhnList.isNotEmpty?
                  ListView.builder(
                    itemCount: value.NamePhnList.length,
                    itemBuilder: (context, index) {
                    var items=value.NamePhnList[index];

                    return Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                              height: 200,
                              width: width/1.04,
                              decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(0.60),
                                  borderRadius: BorderRadius.circular(8),
                              ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                  padding:  EdgeInsets.only(left: 10,top: 7),
                                  child: Text("Name:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                ),
                                    SizedBox(width: 10,),
                                    Padding(
                                      padding:  EdgeInsets.only(top: 8),
                                      child: Text(items.Name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: 10,top: 7),
                                      child: Text("Phone No:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                    ),
                                    SizedBox(width: 10,),
                                    Padding(
                                      padding:  EdgeInsets.only(top: 8),
                                      child: Text(items.Phone,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                               Padding(
                                 padding:  EdgeInsets.only(left: 100),
                                 child: Row(
                                   children: [
                                     InkWell(
                                       onTap: (){
                                         value.acceptRequest(items.id,items.Name,items.Phone);
                                       },
                                       child: Container(
                                          height: height/17,
                                          width: width/3.40,
                                          decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
                                          borderRadius: BorderRadius.circular(4)),
                                          child: Center(child: Text("Accept",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),)),
                                        ),
                                     ),
                                     SizedBox(width: 10,),
                                     InkWell(onTap: (){
                                       value.declineRequest(items.id);
                                     },
                                       child: Container(
                                         height: height/17,
                                         width: width/3.40,
                                         decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
                                             borderRadius: BorderRadius.circular(4)),
                                         child: Center(child: Text("Decline",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),)),
                                       ),
                                     ),
                                   ],
                                 ),
                               )
                              ],
                            ),
                    ),
                         ),
                       ],
                    );
                    },):Center(child: Text("Empty...!",style: TextStyle(color: Colors.white,fontSize: 15),));
                }
              ),
            ),
      ]
    )
    )
    )
    );
  }
}
