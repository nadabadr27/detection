import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/models/doctorlist.dart';
import 'package:detection/models/natification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../models/models.dart';
class natification extends StatefulWidget {
  const natification({super.key});
  @override
  State<natification> createState() => _natificationState();
}

class _natificationState extends State<natification> {
  List<doctorNotification> userDataList = [
    doctorNotification(
      name: 'Mourad Ahmed',
      image:'assets/images/01.jpg',
      action: "Edite",
      content: "to 9:30"
    ),
    doctorNotification(
        name: 'AhmedAli',
        image:'assets/images/01.jpg',
        action: "cancel",
        content: "booking"
    ),
    doctorNotification(
        name: 'Hany fouad',
        image:'assets/images/01.jpg',
        action: "Edite",
        content: "to 12:30"
    ),
    doctorNotification(
        name: 'Mourad Ahmed',
        image:'assets/images/01.jpg',
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
