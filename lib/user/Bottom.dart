import 'package:flutter/material.dart';
import 'package:palota_rent_app/user/urdetails.dart';
import 'package:provider/provider.dart';

import '../Provider/main_provider.dart';
import 'Home.dart';
class Bottombar extends StatefulWidget {
  String userId;
  String phone;
  String name;
  String profilephoto;
  Bottombar({super.key,required this.userId,required this.phone,required this.name,required this.profilephoto});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;


  @override
  void _itemTapped(int index){
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen:false);

    setState(() {
      selectedIndex = index;
      print(selectedIndex.toString()+"ppkk"); 

      if(selectedIndex==1){
        mainProvider.getProfiledetails(widget.userId);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      home(),
      urdetails(userId: widget.userId,profilephoto: widget.profilephoto,name: widget.name,phone: widget.phone,)
      // Appointment(),
      // ProfilePage()
    ];


    print(selectedIndex.toString()+"ijkjkj");
    return Scaffold(
        body:
        pages[selectedIndex],
        extendBody: true,
        bottomNavigationBar:  BottomNavigationBar(

        // margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
        // enableFloatingNavBar: true,
            backgroundColor:  Color(0xff474E5B),
        unselectedItemColor: Color(0xffD9D9D9),
    selectedItemColor: Colors.white,
    // backgroundColor: Colors.black.withOpacity(0.7),
            currentIndex: selectedIndex,

            onTap: _itemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                  label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.edit_calendar),
              //
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                  label: 'Profile',
                  // backgroundColor: Color(0xffD9D9D9)

              ),
            ],
        ),);
  }
}