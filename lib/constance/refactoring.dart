import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palota_rent_app/user/Carview.dart';
import 'package:palota_rent_app/user/viewall.dart';


Widget button(String name,dynamic height,dynamic width){

  return Center(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              border:
              Border.all(color: Colors.white.withOpacity(0))),
          child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
              )),
        )),
  );
}
BoxDecoration bgimg(){
  return BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/totalbgimg.png"),
  fit: BoxFit.cover,
  ),

  );
}
Widget texting(String name,dynamic Iconsname,TextEditingController controller,bool enable){

 return Padding(
   padding:  EdgeInsets.only(left: 10,right: 10),
   child: TextField(controller: controller,
     cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
  enabled: enable,
  decoration: InputDecoration(
  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),
  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),
      prefixIcon:Icon(Iconsname) ,prefixIconColor: Colors.amber.shade50,
          hintText: name,hintStyle: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w100,fontSize: 15)
      ),
    ),
 );
}
Widget textphn(String name,dynamic Iconsname,TextEditingController controller,bool enable){

  return Padding(
    padding:  EdgeInsets.only(left: 10,right: 10),
    child: TextField(controller: controller,
      keyboardType: TextInputType.number,
      enabled: enable,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),
          prefixIcon:Icon(Iconsname) ,prefixIconColor: Colors.amber.shade50,
          hintText: name,hintStyle: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w100,fontSize: 15)
      ),

    ),
  );
}
// Widget otp(){
//   return Padding(
//     padding: const EdgeInsets.only(left: 13),
//     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           height: 68,
//           width: 64,
//           child: TextFormField(
//             onChanged: (value,){
//             if (value.length == 1) {
//               FocusScope.of(context).nextFocus();
//             }
//           },
//             cursorColor: Colors.amber.shade50,
//             keyboardType: TextInputType.number,
//             textAlign: TextAlign.center,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(1),
//               FilteringTextInputFormatter.digitsOnly,
//             ],
//             style: TextStyle(color: Colors.amber.shade50,fontSize: 20),
//             decoration: InputDecoration(filled: true,fillColor: Color(0xff474E5B,),
//               // focusedBorder: UnderlineInputBorder(
//               //   borderSide: BorderSide(color:Colors.amber.shade50 ) ),
//               // enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),),
//
//
//
//         ),
//         ),
//         ),
//
//      ],
//     ),
//
//   );
//
// }
Widget search(BuildContext context){
  return Padding(
    padding:  EdgeInsets.only(left:10),
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .95,
          height: 45,
          child: TextField(cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
            decoration: InputDecoration(
              fillColor: Color(0xffD9D9D9).withOpacity(0.30),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 20,),

              hintText: 'search',hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,fontSize: 15),
              // suffixIcon: Icon(Icons.dele,color: Colors.grey.shade400,size: 20,),

            ),
          ),
        ),
      ],
    ),
  );

}
Widget texxtingss(TextEditingController controller){
  return Padding(
    padding:  EdgeInsets.only(top: 50,left: 10,right: 10),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      cursorColor: Colors.amber.shade50,style: TextStyle(color: Colors.amber.shade50),
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.amber.shade50 ) ),
          prefixIcon: Icon(Icons.call_outlined,),prefixIconColor: Colors.amber.shade50,
          hintText: 'Phone',hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,fontSize: 15)
      ),
    ),
  );
}

Widget topdealsviewall(BuildContext context){
  return  Padding(
    padding: EdgeInsets.only(left: 13),
    child: Row(
      children: [
        Text("Top Deals",style: TextStyle(fontSize: 15,
            fontWeight: FontWeight.w800,color: Colors.amber.shade50),),
        SizedBox(width: 170,),

    GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>viewall(userId: '', name: '', phone: '', profilephoto: '', CarImgs: [],)));},

             child: Container(
               child:Row(
                 children: [
                 Text("View all",style: TextStyle(fontSize: 15,
                 fontWeight: FontWeight.w800,color: Colors.amber.shade50,),),
               Icon(Icons.arrow_forward_ios_rounded,color:Colors.amber.shade50,size: 16,),
                 ],
               )
  ),
           ),
      ],
    ),
  );
}
Widget carimages(String carimage,String carname,String carprice,BuildContext context){
  return  GestureDetector(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>carview()));},
    child: Padding(
      padding:  EdgeInsets.only(left:6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height:135,
            width:170,
            decoration: BoxDecoration(
              image: DecorationImage(alignment: Alignment.topCenter,
                image: AssetImage(carimage),
                // fit: BoxFit.cover,
              ),
              // color: Color(0xff000000),
              color: Color(0xff474E5B).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
              child: Padding(
    padding:EdgeInsets.only(top: 90,left: 5),
    child:   Column(
      children: [
        Padding(
              padding:  EdgeInsets.only(right: 65),
              child: Text(carname,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
            ),
        Row(
          children: [
            Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
            Text(carprice,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
          ],
        )
      ],
    ),
),
            ),
        ],
      ),
    ),
  );
}
Widget topBrandContainer(){
  return Container(



    height:140,
      width:349,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(14),),
      child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 15,left: 10),
              child: Align(alignment: Alignment.topLeft,
                child: Text("Top Brands",style:
                TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: Colors.amber.shade50,)),
              ),
            ),


          ]
      ));
}
Widget Yourorder(String carimage,String carname,String carprice,){
  return  Padding(
    padding:  EdgeInsets.only(right: 10),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(carimage),
            SizedBox(width: 20,),
            Column(
              children: [
                Text(carname,style:TextStyle(fontWeight:FontWeight.normal,fontSize: 16,color: Colors.amber.shade50,)),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
                    Text(carprice,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
                  ],
                ),
                SizedBox(height: 7,),
                Container(
                  height: 30,
                  width: 65,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color:  Colors.amber.shade50,
                  ),
                  child: TextButton(
                    // onPressed: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
                    // },
                    onPressed: () {

                    },
                    child: Text("Cancel",style: TextStyle(
                        fontWeight: FontWeight.w400,fontSize:12,color: Colors.black),),
                  ),
                ),],),],),
        Divider(height: 1,
          color: Color(0xffD9D9D9),
          indent: 5,
          endIndent: 5,),
        SizedBox(height: 10,)
      ],
    ),

  );
}
Widget CarnameAndRupee(String carname,String carprice){
  return  Padding(
    padding:  EdgeInsets.only(left: 15),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(carname,style:TextStyle(fontWeight:FontWeight.normal,fontSize: 16,color: Colors.amber.shade50,)),
    SizedBox(height: 5,),
    Row(
    children: [
    Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
    Text(carprice,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
    ],
    ),
    ]
    ),
  );
}
Widget seatsbagskm(String seats,String bags,String kilometer,String gear){
  return Padding(
    padding:  EdgeInsets.only(left: 20),
    child: Row(
      children: [
         Column(
            children: [
              Icon(Icons.person,color: Color(0xffD9D9D9),),
              Text(seats,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),)
            ],
          ),
            SizedBox(width: 20,),
            Container(
              height: 70,
              width: 3,
              color: Colors.amber.shade50,
            ),
        SizedBox(width: 20,),
            Column(
            children: [
              Icon(Icons.trolley,color: Color(0xffD9D9D9),),
              Text(bags,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),)
            ],
          ),
        SizedBox(width: 20,),
        Container(
          height: 70,
          width: 3,
          color: Colors.amber.shade50,
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Icon(Icons.electric_meter,color: Color(0xffD9D9D9),),
            Text(kilometer,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),)
          ],
        ),
        SizedBox(width: 20,),
        Container(
          height: 70,
          width: 3,
          color: Colors.amber.shade50,
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Image.asset("assets/gearbox.png",scale: 1.70,),
            Text(gear,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),)
          ],
        ),
      ],
    ),
  );
}
Widget containertextfieldbookinfpage(String txtname){
  return  Row(
      children: [
  Column(crossAxisAlignment: CrossAxisAlignment.start,
  children: [
   Padding(
     padding:  EdgeInsets.only(left: 10),
     child: Text(txtname,style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.bold,
  color: Colors.amber.shade50),),
   ),
   SizedBox(height: 10,),

  Padding(
  padding:  EdgeInsets.only(left: 10),
  child: Container(
  height: 40,
  width: 150,
  decoration: BoxDecoration(color: Color(0xff474E5B),
  borderRadius: BorderRadius.circular(10),
  boxShadow: [BoxShadow(
  color: Colors.black38,
  blurRadius: 10,
  ),]
  ),
  child: TextField(maxLines: 20,
    cursorColor:Colors.amber.shade50 ,style: TextStyle(color: Colors.amber.shade50,),
  decoration: InputDecoration(
  fillColor: Color(0xff474E5B),
  filled: true,
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide.none),

  ),
  ),
  ),
  )
  ],
  )
  ]
  );
}
Widget priceDetails(String key,String value){
  return
    Row(
    children: [
      Text(key,style: TextStyle(fontSize: 17,
          fontWeight: FontWeight.normal,color:Colors.amber.shade50 ),),
      SizedBox(width: 190,),
      Icon(Icons.currency_rupee_sharp,color: Colors.amber.shade50,size: 13,),
      Text(value,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.amber.shade50),),
      SizedBox(height: 30,)
    ],
  );
}
Widget ProfileGroup(){
  return  Stack(children: [
    Positioned(
      child: Center(child:CircleAvatar(
      backgroundColor: Color(0xffD9D9D9),
      radius: 70,
      child: Icon(Icons.person,size: 115,color: Colors.blueGrey.shade900,),
    )),
    ),
    Positioned(bottom: 1,right: 115,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey.shade900,
            // Color(0xff74A4AE).withOpacity(.90),
            radius:15 ,
            child: Icon(Icons.add_a_photo_outlined,color: Colors.amber.shade50,size: 17,),
          ),

        ))
  ],

  );
}