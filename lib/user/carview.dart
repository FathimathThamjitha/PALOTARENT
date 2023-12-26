import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:palota_rent_app/constance/call_functions.dart';
import 'package:palota_rent_app/user/refactoring.dart';
import 'package:palota_rent_app/user/viewall.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constance/provider/main_provider.dart';
import 'bookingpage.dart';


class carview extends StatefulWidget {
  const carview({super.key});

  @override
  State<carview> createState() => _carviewState();
}

class _carviewState extends State<carview> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
        height: height,width: width,
        decoration: bgimg(),
    child:Scaffold(
    backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10,top: 10),
          child: Row(
            children: [
              GestureDetector(onTap: (){
Navigator.pop(context);
              },
                  child: Icon(Icons.arrow_back_ios_rounded,color: Colors.amber.shade50,)),
              SizedBox(width: 280,),
              Image.asset("assets/shareicon.png",scale: 1.30,),
            ],
          ),
        ),
    Consumer<MainProvider>(builder: (context, valu, child) {
                            return Column(
                              children: [
                                CarouselSlider.builder(
                                  itemCount:4 ,
                                  itemBuilder: (context, index, realIndex) {
                                    valu.Carosuelimg[index];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(valu.Carosuelimg[index],

                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      height: 220,
                                      viewportFraction: 1 ,
                                      autoPlay: false,
                                      pageSnapping: true,
                                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                                      enlargeCenterPage: true,
                                      autoPlayInterval: const Duration(seconds: 4),
                                      onPageChanged: (index, reason) {
                                        valu.activeIndex(index);
                                        // print("activvgvg"+Activeindex.toString());
                                      }),
                                ),
                                buildIndiCator(
                                    valu.Carosuelimg.length, context, valu.Activeindex),
                              ],
                            );
             }),



    SizedBox(height: 10,),
    CarnameAndRupee("Audi RS5 Sportback","20000/perday",),
    SizedBox(height: 20,),
    Divider(height: 1,
      color: Color(0xffD9D9D9),
      indent: 5,
      endIndent: 5,),
    SizedBox(height: 10,),
    seatsbagskm("5 Seats","4 Bags","295 KM","Auto"),


    SizedBox(height: 300,
        child: InkWell(
            onTap: (){
              callNext(context, Bookingpage());
            },
            child: button("BUY NOW", height/20, width/3, ))),
       ],
    )
    )
    ),

    )
    );

  }
}
buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");


  return Center(
      child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: AnimatedSmoothIndicator(
            activeIndex: activeindex,
            count: count,
            effect: const JumpingDotEffect(
                dotWidth: 7,
                dotHeight: 7,
                strokeWidth: 1,
                paintStyle: PaintingStyle.stroke,
                activeDotColor: Colors.grey,
                dotColor: Colors.white),
          ),
          ),
      );
}
