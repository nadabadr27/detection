import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/layout/detect/detect.dart';
import 'package:detection/modules/doctor%20items/booking/coming.dart';
import 'package:detection/modules/doctor%20items/updateprofile/updateprofile.dart';
import 'package:flutter/material.dart';
import '../doctor items/doctor_item/doctor.dart';


class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}
class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold  (
        body: Drawer(
          backgroundColor: green,
          width: 250,
          child: Container(
child: Padding(
  padding: const EdgeInsets.only(top: 50),
  child:   Column(
    children: [
      Row(
          children: [
            logoimage(image: 'assets/images/Logo.png'),
            text(text: 'Alza', color: darkyellow, size: 30, weiht: FontWeight.w700,),
text(text: 'himer', color: white, size: 30, weiht: FontWeight.w700)
          ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         image(image: 'assets/images/01.jpg'),
        hightsized(),
       text(text: 'Alex Smith', color: white, size: 18, weiht: FontWeight.w500),
       hightsized(),
Container(
  height: .5,
  color: white,
),
           hightsized(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        icon(icon: Icons.account_circle),
                        widthsized(),
                        textBottom(text: 'Detection ', color: white,function: (){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Detect(
    ),) ,);
                        }
                        )
                      ],
                    ),
                    Row(
                      children: [
                        icon(icon: Icons.person),
                        widthsized(),
                        textBottom(text: 'Doctor ', color: white,function:(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> DoctorList(
    ),) ,);})
                      ],
                    ),
                    Row(
                      children: [
                        icon(icon: Icons.label_outline_rounded),
                        widthsized(),
                        textBottom(text: 'updateprofile ', color: white,function: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateProfileDoctor(
                          ),) ,);})
                      ],
                    ),
                    Row(
                      children: [
                        icon(icon: Icons.label_outline_rounded),
                        widthsized(),
                        textBottom(text: 'updateprofile ', color: white,function: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>coming(
                          ),) ,);})
                      ],
                    ),

                    Row(
                      children: [
                        icon(icon: Icons.logout),
                        widthsized(),
                        textBottom(text: 'Log out ', color: white)
                      ],
                    ),
                  ],
                ),
              ),
        ],
      ),
    ],
  ),
),
),
        ),
    );
  }
}

