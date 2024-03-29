import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palota_rent_app/user/Payment_page.dart';
import 'package:palota_rent_app/constance/Refactoring.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import '../Provider/my_models.dart';
import '../constance/Call_Functions.dart';
import 'Carview.dart';

class Bookingpage extends StatelessWidget {
  Bookingpage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
 MainProvider provider=Provider.of<MainProvider>(context,listen: false );
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Form(
      key: _formKey,
      child: Column(
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 10,top: 10),
              child:GestureDetector(onTap: (){
                Navigator.pop(context);
              },
                child:
              Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,),
            ),
      ),
            SizedBox(width: 40,),
            Padding(
              padding:  EdgeInsets.only(left: 50,top: 10),
              child:  Text("YOUR BOOKING",style: TextStyle(
                  color: Colors.amber.shade50,
                  fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ],
        ),
         Row(
           children: [
             Image.asset("assets/car_audi.png",scale: 2,),
             // SizedBox(width: ,),
             CarnameAndRupee("Audi RS5 Sportback","20000/perday",)
           ],
         ),
          Align(alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.only(left: 15),
                child: Text("Your proof:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
              )),
        SizedBox(height: 10,),
        InkWell(onTap: (){
          showBottomSheet(context);
        },
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return value.YourProofimg != null
                ?Container(
                height: 120,
                width: 340,
                decoration: BoxDecoration(color: Color(0xff474E5B),
                borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                    ),]
                ),
                child:Image.file(value.YourProofimg !,fit:BoxFit.fill,),
              ):
              // value.imageproof!=""?
              //     ?Container(
              //   height: 120,
              //   width: 340,
              //   decoration: BoxDecoration(color: Color(0xff474E5B),
              //       borderRadius: BorderRadius.circular(10),
              //       boxShadow: [BoxShadow(
              //         color: Colors.black38,
              //         blurRadius: 10,
              //       ),]
              //   ),
              //   child:Image.network(value.imageproof !,fit:BoxFit.fill,),
              // ):
              Container(
                height: 120,
                width: 340,
                decoration: BoxDecoration(color: Color(0xff474E5B),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                    ),]
                ),
                child: Icon(Icons.camera_alt_outlined,color: Colors.grey.shade600,size: 40,),
              );




            }
          ),
        ),
        Consumer<MainProvider>(
          builder: (context1,value,child) {
            return Visibility(
              visible: value.proof_visible,
                child: Text("Add Your Proof", style: TextStyle(color: Colors.red),));
          }
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mob.Number:",style: TextStyle(
                                      fontSize: 16,fontWeight: FontWeight.bold,
                                      color: Colors.amber.shade50),),
              Padding(
                padding: const EdgeInsets.only(right: 83.0),
                child: Text("No.Days:",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                    color: Colors.amber.shade50),),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                        SizedBox(

                          width: 140,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                           inputFormatters: [
                             LengthLimitingTextInputFormatter(10)
                           ],
                           // maxLines:10,
                            cursorColor:Colors.amber.shade50 ,
                            style: TextStyle(color: Colors.white,),
                            decoration: InputDecoration(

                              fillColor: Color(0xff474E5B),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                              // contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),

                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field is Required";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(

                            width: 140,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              //maxLines:10,
                              cursorColor:Colors.amber.shade50 ,
                              style: TextStyle(color: Colors.white,),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.zero,
                                fillColor: Color(0xff474E5B),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                // contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),

                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field is Required";
                                }
                              },
                            ),
                          ),
                        ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10),
                child: Text("Pick Location:",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                    color: Colors.amber.shade50),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 53),
                child: Text("Drop Location:",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                    color: Colors.amber.shade50),),
              ),
            ]
        ),
              SizedBox(height: 10,),
             Row(
                 children: [
                     Consumer<MainProvider>(
        builder: (context,value,child) {
          return Padding(
            padding:  EdgeInsets.only(left: 10),
            child:Autocomplete<BookingPlaces>(
              optionsBuilder:
                  (TextEditingValue textEditingValue) {
                return value.BookingPlacelist
                    .where((BookingPlaces item) => item.Place
                    .toLowerCase()

                    .contains(textEditingValue.text
                    .toLowerCase()))
                    .toList();
              },
              displayStringForOption: (BookingPlaces option) =>
              option.Place,
              fieldViewBuilder: (BuildContext context,
                  TextEditingController
                  fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) {
                  fieldTextEditingController.text =
                      value.PlaceController.text;
                });

                return SizedBox(
                  width: 140,
                  child: TextFormField(
                    // keyboardType: TextInputType.none,
                    cursorColor:Colors.amber.shade50 ,style: TextStyle(color: Colors.amber.shade50,),
                    decoration: InputDecoration(
                      fillColor: Color(0xff474E5B),
                      isCollapsed: true,
                      // contentPadding: EdgeInsets.all(8),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),

                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),

                    ),


                    onChanged: (txt) {},
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is Required";
                      } else {}
                    },
                  ),
                );
              },
              onSelected: (BookingPlaces selection) {
                value.PlaceController.text =
                    selection.Place;
                print(selection.id + "asdfg");
              },
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<BookingPlaces> onSelected,
                  Iterable<BookingPlaces> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black45
                      ),
                      width: 200,
                      // height:
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: options.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          final BookingPlaces option =
                          options.elementAt(index);

                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(option.Place,
                                      style: const TextStyle(
                                        // fontFamily:
                                        // 'PoetsenOne',
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 10),
                                ]),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),

          );
        }
    ),
                   SizedBox(width: width/10,),
                   Consumer<MainProvider>(
                       builder: (context,value,child) {
                         return Padding(
                             padding:  EdgeInsets.only(left: 10),
                             child:Autocomplete<BookingPlaces>(
                               optionsBuilder:
                                   (TextEditingValue textEditingValue) {
                                 return value.BookingPlacelist
                                     .where((BookingPlaces item) => item.Place
                                     .toLowerCase()

                                     .contains(textEditingValue.text
                                     .toLowerCase()))
                                     .toList();
                               },
                               displayStringForOption: (BookingPlaces option) =>
                               option.Place,
                               fieldViewBuilder: (BuildContext context,
                                   TextEditingController
                                   fieldTextEditingController,
                                   FocusNode fieldFocusNode,
                                   VoidCallback onFieldSubmitted) {
                                 WidgetsBinding.instance
                                     .addPostFrameCallback((_) {
                                   fieldTextEditingController.text =
                                       value.PlaceController.text;
                                 });

                                 return Padding(
                                   padding: const EdgeInsets.only(right:5),
                                   child: SizedBox(
                                     width: 140,
                                     child: TextFormField(
                                       // keyboardType: TextInputType.none,
                                       maxLines: 1,
                                       cursorColor:Colors.amber.shade50 ,style: TextStyle(color: Colors.amber.shade50,),
                                       decoration: InputDecoration(
                                         fillColor: Color(0xff474E5B),
                                         isCollapsed: true,
                                         // contentPadding: EdgeInsets.all(8),
                                         contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                         filled: true,
                                         border: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(10),
                                             borderSide: BorderSide.none),

                                       ),


                                       onChanged: (txt) {},
                                       controller: fieldTextEditingController,
                                       focusNode: fieldFocusNode,
                                       validator: (value) {
                                         if (value!.isEmpty) {
                                           return "This field is Required";
                                         }
                                       },
                                     ),
                                   ),
                                 );
                               },
                               onSelected: (BookingPlaces selection) {
                                 value.PlaceController.text =
                                     selection.Place;
                                 print(selection.id + "asdfg");
                               },
                               optionsViewBuilder: (BuildContext context,
                                   AutocompleteOnSelected<BookingPlaces> onSelected,
                                   Iterable<BookingPlaces> options) {
                                 return Align(
                                   alignment: Alignment.topLeft,
                                   child: Material(
                                     child: Container(
                                       decoration: BoxDecoration(
                                           color: Colors.black45
                                       ),
                                       width: 200,
                                       // height:
                                       child: ListView.builder(
                                         padding: const EdgeInsets.all(10.0),
                                         itemCount: options.length,
                                         itemBuilder:
                                             (BuildContext context, int index) {
                                           final BookingPlaces option =
                                           options.elementAt(index);

                                           return GestureDetector(
                                             onTap: () {
                                               onSelected(option);
                                             },
                                             child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                   Text(option.Place,
                                                       style: const TextStyle(
                                                         // fontFamily:
                                                         // 'PoetsenOne',
                                                         color: Colors.white,
                                                       )),
                                                   const SizedBox(height: 10),
                                                 ]),
                                           );
                                         },
                                       ),
                                     ),
                                   ),
                                 );
                               },
                             ));






                       }),
                ],
                 ),







        SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10),
                child: Text("Pick Date:",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                    color: Colors.amber.shade50),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 84),
                child: Text("Drop Date:",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                    color: Colors.amber.shade50),),
              ),
            ]
        ),
              SizedBox(height: 10,),
                 Row(
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(left: 10),
                       child: SizedBox(
                         width: 140,
                         child: TextFormField(
                           // enabled: true,
                           keyboardType: TextInputType.none,
                           textAlign: TextAlign.center,
                           onTap: (){
                             print("jhcbjd5665vhdbv"+provider.dateController.toString());
                             provider.selectDate(context);
                           },
                           controller: provider.dateController,
                           cursorColor:Colors.amber.shade50 ,style: TextStyle(color: Colors.amber.shade50,),
                           decoration: InputDecoration(
                             isCollapsed: true,
                             // contentPadding: EdgeInsets.all(8),
                             contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),

                             fillColor: Color(0xff474E5B),
                             filled: true,
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none),

                           ),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return "This field is Required";
                             }
                           },
                         ),
                       ),
                     ),
                     SizedBox(width: width/10,),
                     Padding(
                       padding:  EdgeInsets.only(left: 10),
                       child: SizedBox(
                         width: 140,
                         child: TextFormField(
                           // enabled: true,
                           keyboardType: TextInputType.none,
                           textAlign: TextAlign.center,
                           onTap: (){
                             print("jhcbjd5665vhdbv"+provider.dropdateController.toString());
                             provider.selectDropDate(context);
                           },
                           controller: provider.dropdateController,
                           cursorColor:Colors.amber.shade50 ,style: TextStyle(color: Colors.amber.shade50,),
                           decoration: InputDecoration(
                             isCollapsed: true,
                             // contentPadding: EdgeInsets.all(8),
                             contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),

                             fillColor: Color(0xff474E5B),
                             filled: true,
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide.none),

                           ),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return "This field is Required";
                             }
                           },
                         ),
                       ),
                     ),
                   ],
                 ),
               SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                //callNext(context, paymentpage());
                if (_formKey.currentState!.validate()) {
                  if(provider.YourProofimg != null) {
                    print("2222222222222222222222222222");
                    showDialog(
                        context: context,
                        builder: (ctx) =>
                            AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                  "Are you sure to book this car?",
                                  style: TextStyle(fontFamily: "Thamjitha",
                                      fontSize: 15)),
                              // content: Text("Are you sure?",style: GoogleFonts.marcellus()),
                              shape: Border.all(
                                  style: BorderStyle.none),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      back(context);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.grey
                                            .withOpacity(0.2),
                                      ),
                                      child: Center(
                                          child: Text("RECHECK",
                                              style: TextStyle(
                                                  fontFamily: "Thamjitha",
                                                  color: Colors
                                                      .redAccent,
                                                  fontSize: 12))),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      callNext(context, paymentpage());
                                    },

                                    child: Container(
                                      height: 40,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Color(0xff474E5B).withOpacity(
                                            1),),
                                      child: Center(
                                          child: Text("CONFIRM",
                                              style: TextStyle(
                                                  fontFamily: "Thamjitha",
                                                  color: Colors
                                                      .black, fontSize: 12))),
                                    )),
                              ],
                            )
                    );
                  }
                  else
                    {
                      print("1111111111111111111 ${provider.proof_visible}");
                      provider.proof_visiblity();
                      //showDialog(context: context, builder: (ctx1) =>)
                    }
                }

                },
                  child: Container(
                      child: Center(
                        child: Text("NEXT",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 16,color: Colors.amber.shade50),),
                      ),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10,
                            ),]
                        ),
              )
              )
      ]
      ),
    )
    )
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
                  color: Colors.grey.shade600,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getYourProofcamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.grey.shade600,),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getyourProofgallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}
