import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/constance/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../user/refactoring.dart';
import 'add_brands.dart';
import 'View_Cars_Addig.dart';
import 'front_page.dart';

class Topbrandscars extends StatelessWidget {

  const Topbrandscars({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FrontPage()));
            },
                child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
          ),
          SizedBox(width: 40,),
          Padding(
            padding:  EdgeInsets.only(left: 67,top: 10),
            child:  Text("TOP BRANDS",style: TextStyle(
                color: Colors.amber.shade50,
                fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return Container(width: 200,
                  child: ListView.builder(shrinkWrap: true,
                    itemCount: value.NameList.length,
                    itemBuilder: (context, index) {

                    return GestureDetector(
                    onTap: (){
                      value.getBrandDetails(value.NameList[index].id);

                      callNext(context, View_Cars_Addig(from: value.NameList[index].Name,Brandid: value.NameList[index].id,));

    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AudiCarAddig()));
      },
                      onLongPress: (){
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Color(0xffD9D9D9),

                              content:Text("Are you sure want to edit or delete?",
                                style: TextStyle(
                                  fontSize: 15,
                                  // fontFamily: 'Futura',
                                  color:  Color(0xff35103B),
                                ),),
                              actions: [
                                Row(
                                  children: [
                                    Consumer<MainProvider>(
                                        builder: (context,value,child) {
                                          return TextButton(
                                              onPressed: () {
                                                finish(context);
                                                value.editBrandName(value.NameList[index].id );
                                                print(value.NameList[index].id+"kjjjj");
                                                callNext(context, AddBrands(from: 'EDIT',
                                                  bid:value.NameList[index].id ,));

                                              },
                                              child: Text("EDIT",
                                                style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                                                ),));
                                        }
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        finish(context);
                                        provider.DeleteBrandName(value.NameList[index].id, context);
                                      },

                                      child: Text("DELETE",
                                        style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                                        ),),
                                    ),

                                  ],
                                ),
                              ],



                            ),
                        );
                      },

                      child: Container(margin: EdgeInsets.all(5),
                        height: 50,width: 100,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  color: Color(0xff474E5B).withOpacity(0.30),
                                ),
                              child:  Center(
                                child: Text(value.NameList[index].Name,style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 17,color:Colors.amber.shade50),),
                              ),

                      ),
                    );
                  },),
                );
              }
            )


      ]
    )
    ),
      floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
          child: Icon(Icons.add,color: Colors.amber.shade50,size:30,),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                backgroundColor: Color(0xff474E5B).withOpacity(0.40),
                onPressed: (){

            value.Clearfn();
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBrands()));
                  callNext(context, AddBrands(from: "NEW",bid: "",));

                });
        }
      ),
    )
    )

    );
  }
}
