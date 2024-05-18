import 'package:detection/layout/detect/detect.dart';
import 'package:detection/modules/doctor%20items/doctor/doctors%20screen.dart';
import 'package:detection/modules/doctor%20items/doctorinformation.dart';
import 'package:detection/modules/doctor%20items/updateprofile/updateprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/modules/drawer/drawer.dart';
import 'package:flutter/gestures.dart';
class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  var opacity = 0.0;
  bool position=false;
  final List<Map<String, dynamic>> doctors = [
    {"name": "Dr. John Doe", "image": AssetImage('assets/images/doctor2.png')},
    {"name": "Dr. Jane Smith", "image": AssetImage('assets/images/doctor3.png')},
    {"name": "Dr. Sam Brown", "image": AssetImage('assets/images/doctor4.png')},
    {"name": "Dr. Doogie Howser", "image": AssetImage('assets/images/doctor5.png')},
    {"name": "Dr. Gregory", "image": AssetImage('assets/images/doctor6.png')},

  ];
  final List<Map<String, dynamic>>otherdoctors = [
  {"name": "Dr. Gregory", "image": AssetImage('assets/images/doctor6.png')},
{"name": "Dr. Jane Smith", "image": AssetImage('assets/images/doctor5.png')},
{"name": "Dr. Doogie Howser", "image": AssetImage('assets/images/doctor4.png')},
{"name": "Dr. John Dorian", "image": AssetImage('assets/images/doctor3.png')},
{"name": "Dr. Gregory", "image": AssetImage('assets/images/doctor2.png')}];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();

      setState(() {

      });
    });
  }
  animator() {
    if (opacity == 1) {
      opacity = 0;
      position=false;
    } else {
      opacity = 1;
      position=true;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        actions: [
          coloricon(color:Colors.black26,icon: Icons.sunny )
        ],
      ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
          child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 30, left: 0, right:0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
              children: [
              AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              top: position ? 1 : 100,
              right: 20,
              left: 20,
              child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: opacity,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(text: "Hello Smith", color:Colors.black , size: 20, weiht:  FontWeight.bold),
              text(text: "How are you feeling today?", color:Colors.black26, size: 15, weiht:  FontWeight.bold)
              ],
              ),
              ],
              ),
              ),
              ),
                AnimatedPositioned(
          top: position ? 80 : 140,
          left: 20,
          right: 20,
          duration: const Duration(milliseconds: 400),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: opacity,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: coloricon(color: Colors.black.withOpacity(.5),icon: Icons.search ),
                    hintText: "   Search"),
              ),
            ),
          ),
                ),
              AnimatedPositioned(
              top: position? 150 : 220,
              left: 15,
              right: 15,
              duration: const Duration(milliseconds: 400),
              child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: opacity,
              child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              category("assets/images/doctor.jpeg", "Doctor",5,context),
              category("assets/images/detect.jpg", "detection",10,context),
              category("assets/images/update.jpg", "UpDate",10,context),
              ],
              ),
              ),
              )),
                AnimatedPositioned(
            top: position?260:390,
            left: 20,
            right: 20, duration: const Duration(milliseconds: 400),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: opacity,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(text: "Top Rate", color: Colors.black, size: 18, weiht: FontWeight.bold),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     TextButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>DoctorsScreen (
    ),) ,);
    },

                         child: text(text: "See all", color: Colors.black26, size: 15, weiht: FontWeight.bold)),
                  ],
              )

                  ],
                ),
              ),
            )),
                AnimatedPositioned(
          duration: Duration(seconds: 1), // مدة التحريك
          top:  position? 290: 420, // استخدام الحالة للتحكم بالموضع
          left: 20,
          right:20,
          child: Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: otherdoctors.length,
              itemBuilder: (BuildContext context, int index) {
                return doctorCard(doctors[index]['name'], doctors[index]['image'],context);
              },
            ),
          ),
                ),
                AnimatedPositioned(
            top: position?500:650,
            left: 20,
            right: 20, duration: const Duration(milliseconds: 400),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: opacity,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(text: "OtherDoctor", color: Colors.black, size: 18, weiht: FontWeight.bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton (onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>DoctorsScreen (
                          ),) ,);
                        },
                            child: text(text: "See all", color: Colors.black26, size: 15, weiht: FontWeight.bold)),
                      ],
                    )

                  ],
                ),
              ),
            )),

                AnimatedPositioned(
          duration: Duration(seconds: 1), // مدة التحريك
          top:  position? 535: 700, // استخدام الحالة للتحكم بالموضع
          left: 20,
          right:20,
          child: Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctors.length,
              itemBuilder: (BuildContext context, int index) {
                return doctorCard(otherdoctors[index]['name'], otherdoctors[index]['image'],context);
              },
            ),
          ),
                ),

                //
              ],
              )
              )
              ),
        )
    );
  }
}
Widget category(String asset,String txt,double padding,BuildContext context) {
  return Column(
      children: [
        InkWell(
          onTap: (){

              // Navigation logic based on category name
              switch (txt) {
                case "Doctor":
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorList()));
                  break;
                case "detection":
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Detect ()));
                  break;
                case "UpDate":
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>UpdateProfileDoctor()));
                  break;
              }

          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color:white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image(
                  image:
                  AssetImage(asset),
                ),
              ),
            ),
          ),)
      ]);
}
Widget doctorCard(String name, AssetImage imagePath,BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DocInfoPage()));
    },
    child: Card(
        elevation: 5,  // أضفت تأثير الظل للبطاقة
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Container(
            color: white,
            child: Column(
                children: [
                  hightsized(),
                  Container(
                    color: green,
                    child: Column(
                      children: [
                        Image(image: imagePath,width: double.infinity,height: 85,),
                      ],
                    ),
                  ),
                  hightsized(),
                  text(text:name , color:Colors.black , size: 15, weiht: FontWeight.bold),
                  SizedBox(height: 5),
                  text(text:"Neurology", color:Colors.black , size: 15, weiht: FontWeight.bold),
                   SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      coloricon(color: darkyellow,icon:Icons.star ),
    
                      Text("(4.5)"),
                    ],
                  ),
                  Spacer(),
                ]
            ),
          ),
        )
    ),
  );
}

