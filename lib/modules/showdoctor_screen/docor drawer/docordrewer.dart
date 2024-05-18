import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/layout/detect/detect.dart';
import 'package:detection/modules/showdoctor_screen/natification/natifaction.dart';
import 'package:detection/modules/showdoctor_screen/reviewdoctor/reveiw%20doctor.dart';
import 'package:flutter/material.dart';
import '../schdule/schdule.dart';
class drawerdoctor extends StatefulWidget {
  @override
  _drawerdoctorState createState() => _drawerdoctorState();
}
class _drawerdoctorState extends State<drawerdoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        backgroundColor: green,
        width: 250,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    logoimage(image: 'assets/images/Logo.png'),
                    text(text: 'Alza',
                      color: darkyellow,
                      size: 30,
                      weiht: FontWeight.w700,),
                    text(text: 'himer',
                        color: white,
                        size: 30,
                        weiht: FontWeight.w700)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    image(image: 'assets/images/01.jpg'),
                    hightsized(),
                    text(text: 'Alex Smith',
                        color: white,
                        size: 18,
                        weiht: FontWeight.w500),
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
                              textBottom(text: 'Detection ',
                                  color: white,
                                  function: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          Detect(
                                          ),),);
                                  }
                              )
                            ],
                          ),
                          Row(
                            children: [
                              icon(icon: Icons.schedule),
                              widthsized(),
                              textBottom(text: 'Schedule ',
                                  color: white,
                                  function: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          Schedule(
                                          ),),);
                                  }),
                            ],
                          ),
                          Row(
                            children: [
                              icon(icon: Icons.edit),
                              widthsized(),
                              textBottom(text: 'Reveiw ',
                                  color: white,
                                  function: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          reveiew(
                                          ),),);
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              icon(icon: Icons.notification_add),
                              widthsized(),
                              textBottom(text: 'Notification ',
                                  color: white,
                                  function: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          natification (
                                          ),),);
                                  }
                              )
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
