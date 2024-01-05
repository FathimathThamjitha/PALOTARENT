import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:provider/provider.dart';

import '../constance/provider/main_provider.dart';
import '../user/refactoring.dart';
import 'admin_refactoring.dart';
import 'View_Cars_Addig.dart';

class CarDetails extends StatefulWidget {
  String from;
  String Brandid;
   CarDetails({super.key,required this.from,required this.Brandid});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  String? type;


  @override
  Widget build(BuildContext context) {
    // String dropdownValue ='Audi';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child: Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Consumer<MainProvider>(
      builder: (context,value,child) {
        return Column(
        children: [
        Row(
        children: [
        Padding(
        padding:  EdgeInsets.only(left: 10,top: 10),
        child: GestureDetector(onTap: (){

        callNext(context, View_Cars_Addig(from: widget.from,Brandid: widget.Brandid,));
},
        child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
        ),
        SizedBox(width: 40,),
        Padding(
        padding:  EdgeInsets.only(left: 67,top: 10),
        child:  Text("CAR DETAILS",style: TextStyle(
        color: Colors.amber.shade50,
        fontSize: 20,fontWeight: FontWeight.bold),),
        )
        ],
        ),
          SizedBox(height: 30,),
          CarDetailsAdding("Car Name:",value.CarNameController),
          SizedBox(height: 10,),
          CarDetailsAdding("Kilometer:",value.KlmController),

          SizedBox(height: 10,),

          Padding(
            padding:  EdgeInsets.only(left: 7),
            child: Align(alignment: Alignment.topLeft,
                child: Text("Image:",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.amber.shade50),)),
          ),
          SizedBox(height: 10,),
          InkWell(onTap: (){
            showBottomSheet(context);
          },
            child: Consumer<MainProvider>(

              builder: (context,value,child) {
                return value.CarImages!= null
                  ? Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.all(Radius.circular(4)),
                    color: Color(0xff474E5B).withOpacity(.10),
                  ),

                  child: Image.file(value.CarImages!,fit: BoxFit.fill,),
                ):value.imageUrl!=""?Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color(0xff474E5B).withOpacity(.10),
                  ),

                  child: Image.network(value.imageUrl!,fit: BoxFit.fill,),
                ):Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color(0xff474E5B).withOpacity(.10),
                  ),

                  child: Icon(Icons.camera_alt_outlined,color: Colors.amber.shade50,size: 30,),
                );
              }
            ),
          ),
          SizedBox(height: 10,),
          CarDetailsAdding("Price:",value.PriceController),
          SizedBox(height: 10,),
          CarDetailsAdding("Seats:",value.SeatsController),
          SizedBox(height: 10,),
          CarDetailsAdding("Bags:",value.BagsController),
          SizedBox(height: 10,),

          Padding(
            padding:  EdgeInsets.only(left: 6),
            child: Row(
              children: [
                Text("Transmission:",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.amber.shade50),),
              ],
            ),
          ),

          Consumer<MainProvider>(
            builder: (context,val,child) {
              return Row(
                  children: [
                    Radio(
                        value: "Automatic ",
                        groupValue: val.checkvalue,
                        onChanged: (value) {
                           val.checkvalue = value.toString();
                           val.notifyListeners();


                        }),
                    Text("Automatic",style: TextStyle(color: Colors.amber.shade50),),
                    Radio(
                        value: "Manual",
                        groupValue: val.checkvalue,
                        onChanged: (value) {
                          val.checkvalue = value.toString();
                          val.notifyListeners();

                        }),
                    Text("Manual",style: TextStyle(color: Colors.amber.shade50),),
                  ],
              );
            }
          ),

          SizedBox(height: 20,),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return InkWell(onTap: (){
                value.addBrandDetails(widget.from,widget.Brandid);
                callNext(context, View_Cars_Addig(from: widget.from,Brandid: widget.Brandid));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AudiCarAddig()));
                // callNext(context, AudiCarAddig());
              },
                child: Container(
                  height: height/20,
                  width: width/3,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      border:
                      Border.all(color: Colors.white.withOpacity(0))),
                  child: Center(
                      child: Text("ADD",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      )),
                )
              );
            }
          ),
          SizedBox(height: 40,),
                ]
        );
      }
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
                  color: Colors.amber.shade50,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.amber.shade50,),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}

