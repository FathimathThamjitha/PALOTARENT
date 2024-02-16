import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/refactoring.dart';
import 'package:palota_rent_app/user/welcome.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';

class Crteac extends StatelessWidget {
  String userId,from;
  Crteac({super.key,required this.userId,required this.from});

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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60,left: 20),
                  child: Text("Create Account",style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w800,color: Colors.amber.shade50),),
                ),
                SizedBox(height: 30,),
                Stack(
                  children: [
                    Center(child: Consumer<MainProvider>(
                        builder: (context, val, child) {
                          return val.ProfileImg != null
                              ? CircleAvatar(
                            radius: 70,
                            backgroundImage: FileImage(val.ProfileImg!),
                          )
                              : val.imageUrl != ''
                              ? CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(val.imageUrl),
                          )
                              : CircleAvatar(
                                backgroundColor: const Color(0xffD9D9D9),
                                radius: 70,
                                child: Icon(
                                  Icons.person,
                                  size: 115,
                                  color: Colors.blueGrey.shade900,
                                ),
                              );
                        })),
                    Positioned(
                        bottom: 1,
                        right: 115,
                        child: InkWell(
                          onTap: () {
                            showBottomSheet(context);
                          },
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey.shade900,
                              radius: 15,
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.amber.shade50,
                                size: 17,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),

                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return texting("Name",Icons.person,value.nameRegcontroller,true);
                  }
                ),
                SizedBox(height: 30,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return textphn("Phone",Icons.call_outlined,value.PhoneRegcontoller ,from=="Edit"?false:true);
                  }
                ),
                SizedBox(height: 80,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: (){
                        if(from=="New") {
                          value.addProfileDetails(context,"", "New");
                          value.clearNamePhone();
                        }else
                          {
                            value.addProfileDetails(context,userId, "Edit");

                          }


                        // callNext(context, Welcome(uderId: '',));
                      },
                        child:value.loader?Center(child: CircularProgressIndicator(color: Colors.amber.shade50,)): button("Submit", height/20, width/3,));
                  }
                ),
                SizedBox(height: 15,),
                Padding(
                  padding:  EdgeInsets.only(left: 85),
                  child: Row(
                    children: [
                      Text("Already have account?",style: TextStyle(
                          fontWeight: FontWeight.normal,fontSize: 12,color: Colors.amber.shade50),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome(uderId: '',)));
                        },
                        child: Text("Log in",style: TextStyle(
                            fontWeight: FontWeight.normal,fontSize:12,color: Colors.amber.shade50,),),
                      ),
                    ],
                  ),
                ),
              ],
),
          ),

        ),
      ),
    );
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
                  {provider.getRegimagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(
                    Icons.photo,
                    color: Colors.amber.shade50,
                  ),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () =>
                  {provider.getRegimagegallery(), Navigator.pop(context)}),
            ],
          );
        });
    //ImageSource
  }

}
