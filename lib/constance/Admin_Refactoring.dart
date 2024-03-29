
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';


Widget containerList(String names,dynamic height,dynamic width){

  return Column(
    children: [
      Padding(
        padding:  EdgeInsets.only(left: 60,top: 40),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xff474E5B),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(names,style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 19,color:Colors.amber.shade50),),
                SizedBox(width: 20,),
                Padding(
                  padding:  EdgeInsets.only(right: 10),
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
              ],
            ),
          ),
        ),
      )
    ],
  );
}
Widget canceldelete(String text,){
  return  Container(
    height: 40,
    width: 75,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color:  Colors.amber.shade50,
    ),
    child:  Center(
      child: Text(text,style: TextStyle(
            fontWeight: FontWeight.w500,fontSize:16,color: Colors.black),),
    ),



  );
}
Widget CarDetailsAdding(String Textname,TextEditingController controller){
  return Column(
    children: [
      Padding(
        padding:  EdgeInsets.only(left: 7),
        child: Align(alignment: Alignment.topLeft,
            child: Text(Textname,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.amber.shade50),)),
      ),
      SizedBox(height: 10,),
  SizedBox(width:350,
  height: 50,
  child: Consumer<MainProvider>(
    builder: (context,value,child) {
      return TextFormField(controller: controller,
        cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
      fillColor: Color(0xffD9D9D9).withOpacity(.10),
      filled: true,
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none),
      ),

      );
    }
  ),
  )
    ],
  );
}
Widget KeyValue (String key,String value){
  return Row(
    children: [
      Padding(
        padding:  EdgeInsets.only(left: 20,top: 7),
        child: Text(key,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
      ),
      SizedBox(width: 10,),
      Padding(
        padding:  EdgeInsets.only(top: 8),
        child: Text(value,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
      ),
    ],
  );
}
Widget CarSB2A(String detail){
  return  Text(detail,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),);

}
