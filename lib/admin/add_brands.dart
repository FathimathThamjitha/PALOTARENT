import 'package:flutter/material.dart';
import 'package:palota_rent_app/admin/top_brands.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
// import 'package:palota_rent_app/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';

import '../constance/refactoring.dart';
import 'front_page.dart';

class AddBrands extends StatelessWidget {

  String from;
  String bid;
   AddBrands({super.key,required this.from,required this.bid});

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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Topbrandscars()));
    },
    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
    ),
    SizedBox(width: 40,),
    Padding(
    padding:  EdgeInsets.only(left: 67,top: 10),
    child:  Text("ADD BRANDS",style: TextStyle(
    color: Colors.amber.shade50,
    fontSize: 20,fontWeight: FontWeight.bold),),
    )
    ],
    ),
      SizedBox(height: 30,),
            Container(
                height: height/3,
                width: width/1.04,
                decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(0.40),
                  borderRadius: BorderRadius.circular(8),
                ),

             child: Padding(
               padding:  EdgeInsets.only(top: 20),
               child: Column(
                  children: [
                    SizedBox(width:250,
                      height: 40,
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return TextFormField( controller: value.nameController,
                            cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Color(0xffD9D9D9).withOpacity(0.30),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: 'Brand Name',hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,fontSize: 15),
                            ),

                          );
                        }
                      ),
                    ),
                   SizedBox(height: 10,),
                   InkWell(onTap: (){
                     showBottomSheet(context);
                   },

                     child: Consumer<MainProvider>(
                       builder: (context,value,child) {
                         return value.BrandLogo !=null
                           ?Container(
                           height: 90,
                           width: 150,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                             color: Color(0xffD9D9D9).withOpacity(0.30),
                           ),
                           child:Image.file(value.BrandLogo!,fit: BoxFit.fill,)
                         ):
                         Container(
                           height: 90,
                           width: 100,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                             color: Color(0xffD9D9D9).withOpacity(0.30),
                           ),
                           child: Center(child: Text("Brand Logo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,fontSize: 15),)),
                         );
                       }
                     ),
                   ),

                    SizedBox(height: 30,),
                    Container(
                      height: 40,
                      width: 75,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color:  Colors.amber.shade50,
                      ),
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return TextButton(
                            onPressed: () {
                              if(from == "NEW"){
                                value.addBrandname("NEW",'');
                              }else{
                                value.addBrandname("EDIT",bid);

                              }

                              callNext(context, Topbrandscars());

                              },
                            child: Text("ADD",style: TextStyle(
                                fontWeight: FontWeight.w500,fontSize:16,color: Colors.black),),
                          );
                        }
                      ),
                    ),
                  ],
                ),
             ),
            ),


    ]
    )
    ),

    )
    )

    );
  }
}
void showBottomSheet(BuildContext context) {
  MainProvider provider = Provider.of<MainProvider>(context, listen: false);
  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.amber.shade50,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getLogocamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(
                  Icons.photo,
                  color: Colors.amber.shade50,
                ),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getLogogallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}
