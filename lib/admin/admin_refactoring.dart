import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/provider/main_provider.dart';
import 'package:provider/provider.dart';


Widget containerList(String names,){
  return Column(
    children: [
      Padding(
        padding:  EdgeInsets.only(left: 80,top: 40),
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Color(0xff474E5B),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(names,style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 14,color:Colors.amber.shade50),),
                SizedBox(width: 76,),
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color(0xffD9D9D9),
                  ),
                  child:Icon(Icons.arrow_forward_ios_rounded,size: 15,color: Colors.black,),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
// Widget Requests(){
//   return  Container(
//     height: height/5,
//     width: width/1.04,
//     decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(0.20),
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: Column(
//       children: [
//         Row(
//           children: [
//
//
//             Padding(
//               padding:  EdgeInsets.only(left: 10,top: 7),
//               child: Text("Name:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
//             ),
//             SizedBox(width: 10,),
//             Padding(
//               padding:  EdgeInsets.only(top: 8),
//               child: Text("Thamjitha",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Padding(
//               padding:  EdgeInsets.only(left: 10,top: 7),
//               child: Text("Phone No:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
//             ),
//             SizedBox(width: 10,),
//             Padding(
//               padding:  EdgeInsets.only(top: 8),
//               child: Text("9074552753",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),),
//             ),
//           ],
//         ),
//         SizedBox(height: 20,),
//         Padding(
//           padding:  EdgeInsets.only(left: 100),
//           child: Row(
//             children: [
//               Container(
//                 height: height/17,
//                 width: width/3.40,
//                 decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
//                     borderRadius: BorderRadius.circular(4)),
//                 child: Center(child: Text("Accept",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),)),
//               ),
//               SizedBox(width: 10,),
//               Container(
//                 height: height/17,
//                 width: width/3.40,
//                 decoration: BoxDecoration(color: Color(0xffD9D9D9).withOpacity(0.40),
//                     borderRadius: BorderRadius.circular(4)),
//                 child: Center(child: Text("Decline",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.amber.shade50),)),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
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
