import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/models/doctorlist.dart';
import 'package:detection/models/natification.dart';
import 'package:detection/models/patient%20natification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../models/models.dart';
class patientnatification extends StatefulWidget {
  const patientnatification({super.key});
  @override
  State<patientnatification> createState() => _patientnatificationState();
}

class _patientnatificationState extends State<patientnatification> {
  List<patientNotification> userDataList = [
    patientNotification(
        name: 'Dr.Mourad Ahmed',
        image:'assets/images/docter1.png',
        action: "Edite",
        content: "to 9:30"
    ),
    patientNotification(
        name: 'Dr.AhmedAli',
        image:'assets/images/doctor2.png',
        action: "cancel",
        content: "booking"
    ),
    patientNotification(
        name: 'Dr.Hany fouad',
        image:'assets/images/doctor3.png',
        action: "Edite",
        content: "to 12:30"
    ),
    patientNotification(
        name: 'Dr.Mourad Ahmed',
        image:'assets/images/doctor4.png',
        action: "Cancel",
        content: "Booking"
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
        ),
        title: Text("Natifacion", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: userDataList.isEmpty
          ? Center(
          child: Text("No natification available", style: TextStyle(color: Colors.grey, fontSize: 18))
      )
          : ListView.builder(
        itemCount: userDataList.length,
        itemBuilder: (context, index) {
          final item = userDataList[index];
          return Column(
            children: [
              Container(
                color: white,
                height: 100,
                child: Row(
                    children: [
                      smallimage(image: item.image),
                      widthsized(),
                      Expanded(
                        child:
                        Row(
                          children: [
                            text(text: item.name, color: Colors.black, size: 18, weiht: FontWeight.w500),
                            text(text: item.action, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                            text(text: item.content, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                            SizedBox(
                              width: 5,
                            ),

                          ],
                        ),

                      ),

                    ]
                ),
              ),

            ],
          );
        },
      ),
    );
  }


}
