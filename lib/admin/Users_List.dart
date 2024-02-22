import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import '../constance/Refactoring.dart';
import 'Front_Page.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

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
            child:  Text("USERS LIST",style: TextStyle(
                color: Colors.amber.shade50,
                fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      SizedBox(height: 20,),
            Expanded(
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return value.NamePhnList.isNotEmpty?
                    ListView.builder(shrinkWrap: true,
                    itemCount: value.NamePhnList.length,
                      itemBuilder: (context, index) {
                    var items = value.NamePhnList[index];

                    return Column(
                      children: [
                        Container(
                            height: height/6,
                            width: width/1.04,
                            decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(0.70),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(left: 80,top: 25),
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

    ]
                              ),
                            )
    ),SizedBox(height: 10,)
                      ],
                    );
                        },):Center(child: Align(alignment:Alignment.bottomCenter,
                      child: Text("Empty...!",style: TextStyle(color: Colors.white,fontSize: 15),)));
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
