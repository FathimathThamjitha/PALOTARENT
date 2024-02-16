import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/user/palota_start.dart';
import 'package:palota_rent_app/constance/refactoring.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import 'CreateAccount.dart';

class urdetails extends StatelessWidget {
  String userId;
  String name;
  String phone;
  String profilephoto;

   urdetails({super.key,required this.userId,required this.name,required this.phone,required this.profilephoto});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider provider= Provider.of<MainProvider>(context,listen: false);
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: bgimg(),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                 
                  Padding(
                    padding:  EdgeInsets.only(right: 10),
                    child: Align(alignment: Alignment.topRight,
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return InkWell(
                            onTap: (){
                             value.editProfile(userId);
                             callNext(context, Crteac(userId: userId,from: "Edit",));
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffD9D9D9).withOpacity(0.30),
                              ),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.amber.shade50),
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      Center(child: Consumer<MainProvider>(
                          builder: (context, val, child) {
                            return val.ProfileImg != null
                                ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(val.ProfileImg!),
                            )
                                : profilephoto != ''
                                ? CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(profilephoto),
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
                              // showBottomSheet(context);
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



                  SizedBox(height: 20,),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              // value.nameRegcontroller.text=value.name;
              return texting("Name",Icons.person,value.nameRegcontroller,false);
            }
          ),
                  SizedBox(height: 20,),
                  Consumer<MainProvider>(
                      builder: (context,value,child) {
                        // value.PhoneRegcontoller.text=phone;
                        return textphn("Phone",Icons.call_outlined,value.PhoneRegcontoller,false );

                      }
                  ),
                   // SizedBox(height: 20,),

                  // Consumer<MainProvider>(
                  //   builder: (context,value,child) {
                  //     return value.ProfileImg != null||value.nameRegcontroller.text!=name? Container(
                  //       height: 30,
                  //       width: 90,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         color: Color(0xffD9D9D9).withOpacity(0.30),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           "Save",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 17,
                  //               color: Colors.amber.shade50),
                  //         ),
                  //       ),
                  //     ):SizedBox();
                  //   }
                  // ),

                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Start(userId: '',)));

                        // showDialog(
                        //   context: context,
                        //   builder: (ctx) => AlertDialog(
                        //     backgroundColor: Color(0xffD9D9D9),
                        //
                        //     content:Text("Are you sure want to edit or delete?",
                        //       style: TextStyle(
                        //         fontSize: 15,
                        //         // fontFamily: 'Futura',
                        //         color:  Color(0xff35103B),
                        //       ),),
                        //     actions: [
                        //       Row(
                        //         children: [
                        //           Consumer<MainProvider>(
                        //               builder: (context,value,child) {
                        //                 return TextButton(
                        //                     onPressed: () {
                        //                       finish(context);
                        //                       value.editBrandName(value.NameList[index].id );
                        //                       print(value.NameList[index].id+"kjjjj");
                        //                       callNext(context, AddBrands(from: 'EDIT',
                        //                         bid:value.NameList[index].id ,));
                        //
                        //                     },
                        //                     child: Text("EDIT",
                        //                       style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                        //                       ),));
                        //               }
                        //           ),
                        //           TextButton(
                        //             onPressed: () {
                        //               finish(context);
                        //               provider.DeleteBrandName(value.NameList[index].id, context);
                        //             },
                        //
                        //             child: Text("DELETE",
                        //               style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                        //               ),),
                        //           ),
                        //
                        //         ],
                        //       ),
                        //     ],
                        //
                        //
                        //
                        //   ),
                        // );
                      },


                    child: Container(
                      height: 45,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffD9D9D9).withOpacity(0.30),
                      ),
                      child: Center(
                        child: Text(
                          "Log out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.amber.shade50),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            )),
      ),
    );
  }
}

// void showBottomSheet(BuildContext context) {
//   MainProvider provider = Provider.of<MainProvider>(context, listen: false);
//   showModalBottomSheet(
//       elevation: 10,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           )),
//       context: context,
//       builder: (BuildContext bc) {
//         return Wrap(
//           children: <Widget>[
//             ListTile(
//                 leading: Icon(
//                   Icons.camera_enhance_sharp,
//                   color: Colors.amber.shade50,
//                 ),
//                 title: const Text(
//                   'Camera',
//                 ),
//                 onTap: () =>
//                 {provider.getRegimagecamera(), Navigator.pop(context)}),
//             ListTile(
//                 leading: Icon(
//                   Icons.photo,
//                   color: Colors.amber.shade50,
//                 ),
//                 title: const Text(
//                   'Gallery',
//                 ),
//                 onTap: () =>
//                 {provider.getRegimagegallery(), Navigator.pop(context)}),
//           ],
//         );
//       });
//   //ImageSource
// }

