import 'package:flutter/material.dart';
import 'package:palota_rent_app/user/payment_page.dart';
import 'package:palota_rent_app/user/refactoring.dart';

import 'carview.dart';

class Bookingpage extends StatelessWidget {
  const Bookingpage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
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
        child:  Icon(Icons.camera_alt_outlined,color: Colors.grey.shade600,size: 40,)),

      SizedBox(height: 20,),
      Row(
        children: [
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(right: 80),
                child: Text("Mob.Number:",style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.bold,
                                color: Colors.amber.shade50),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.only(left: 10),
                child: Container(
                  height: 40,
                  width: 190,
                  decoration: BoxDecoration(color: Color(0xff474E5B),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                      ),]
                  ),
                  child: TextField(
                    maxLines:10,
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
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              Text("No.Days:",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold,
                    color: Colors.amber.shade50),),
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.only(left: 40),
                child:
                Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(color: Color(0xff474E5B).withOpacity(1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                      ),]
                  ),
                  child: TextField(maxLines: 2,
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
          ),
        ],
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          containertextfieldbookinfpage("Pick Location:"),
          SizedBox(width: 30,),
          containertextfieldbookinfpage("Drop Location:"),
        ],
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          containertextfieldbookinfpage("Pick Date:"),
          SizedBox(width: 30,),
          containertextfieldbookinfpage("Drop Date:"),
        ],
      ),
            SizedBox(height: 30,),
            GestureDetector(onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      paymentpage()));
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
              ),
            ),



      ]
    )
    )
    )
    )
    );
  }
}
