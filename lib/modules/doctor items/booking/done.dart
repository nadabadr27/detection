import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/models/booking.dart';
import 'package:detection/modules/doctor%20items/booking/coming.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../models/models.dart';
class done extends StatefulWidget {
  const done({super.key});
  @override
  State<done> createState() => _doneState();
}

class _doneState extends State<done> {
  List<booking> userDataList = [
    booking(
        name: 'Mahmoud Ahmed',
        imagePath: 'assets/images/01.jpg',
        time: '9:30',
        date: "12/2/2024"

    ),
    booking(
        name: 'Mourad Ahmed',
        imagePath: 'assets/images/01.jpg',
        time: '12:40',
        date: "12/3/2024"
    ),
    booking(
        name: 'Mourad Ahmed',
        imagePath: 'assets/images/01.jpg',
        time: '1:50',
        date: "12/4/2024"
    ),
    booking(
        name: 'Mourad Ahmed',
        imagePath: 'assets/images/01.jpg',
        time: '2:30',
        date: "12/5/2024"
    ),
    booking(
        name: 'Mourad Ahmed',
        imagePath: 'assets/images/01.jpg',
        time: '5:45',
        date: "12/6/2024"

    ),
    // Add more items as needed
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
        title: Text("Done", style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle item selection
              switch (result) {
                case 'Item 1':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => coming()),
                  );
                  break;
                case 'Item 2':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => done()),
                  );
                  break;
                case 'Item 3':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => done()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Item 1',
                child: Text('Comming'),
              ),
              const PopupMenuItem<String>(
                value: 'Item 2',
                child: Text('Done'),
              ),
              const PopupMenuItem<String>(
                value: 'Item 3',
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
      body: userDataList.isEmpty
          ? Center(
          child: Text("No Done apponiment available",
              style: TextStyle(color: Colors.grey, fontSize: 18))
      )
          : ListView.builder(
          itemCount: userDataList.length,
          itemBuilder: (context, index) {
            final item = userDataList[index];
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 130,
                  child: Row(
                    children: [
                      smallimage(image: item.imagePath),
                      widthsized(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(text: item.name,
                                color: Colors.black,
                                size: 18,
                                weiht: FontWeight.w500),
                            SizedBox(height: 5),
                            text(text: item.date,
                                color: Colors.black26,
                                size: 15,
                                weiht: FontWeight.w500),
                            text(text: item.time,
                                color: Colors.black26,
                                size: 15,
                                weiht: FontWeight.w500),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),


    );
  }}