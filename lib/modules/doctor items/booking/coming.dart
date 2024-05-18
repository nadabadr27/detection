import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/models/booking.dart';
import 'package:detection/modules/doctor%20items/booking/Cancel.dart';
import 'package:detection/modules/doctor%20items/booking/done.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../models/models.dart';
class coming extends StatefulWidget {
  const coming({super.key});
  @override
  State<coming> createState() => _comingState();
}

class _comingState extends State<coming> {
  late final List<booking> deletedUserDataList;
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
  void addReview(UserData userData) {
    setState(() {
      userDataList.add(booking as booking);
    });
  }

  void deleteBooking(int index) {
    setState(() {
      deletedUserDataList.add(userDataList[index]);
      userDataList.removeAt(index);
    });
  }
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
        title: Text("Comming", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
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
                    MaterialPageRoute(builder: (context) =>done( ),),
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
          child: Text("No appinment is available", style: TextStyle(color: Colors.grey, fontSize: 18))
      )
          : ListView.builder(
        itemCount: userDataList.length,
        itemBuilder: (context, index) {
          final item = userDataList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: white,
                height: 120,
                child: Row(
                  children: [
                    smallimage(image: item.imagePath),
                    widthsized(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(text: item.name, color: Colors.black, size: 18, weiht: FontWeight.w500),
                          text(text: item.date, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                          text(text: item.time, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              textBottom(text: "Edit", color: green, function: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              height: 56,
                                              decoration: BoxDecoration(

                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: TextFormField(
                                                decoration: InputDecoration(labelText: "Date",
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green)),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: green),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            hightsized(),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    text(text: " Start time", color: Colors.black26, size: 15, weiht: FontWeight.w500),
                                                    text(text: " End time", color: Colors.black26, size: 15, weiht: FontWeight.w500),
                                                  ],
                                                ),

                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 56,
                                                        width:150,
                                                        decoration: BoxDecoration(

                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(labelText: 'Start time',
                                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green)),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: green),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      widthsized(),
                                                      Container(
                                                        height: 56,
                                                        width:150,
                                                        decoration: BoxDecoration(

                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(labelText: 'End Time',
                                                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green)),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: green),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                            hightsized(),
                                            hightsized(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor:green, backgroundColor: Colors.white, // Text color
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  // إضافة الوظيفة المناسبة
                                                  child:text(text: "Cancel", color: green, size: 15, weiht: FontWeight.w500),

                                                ),
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor: Colors.white, backgroundColor: green, // Text color
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  // إضافة الوظيفة المناسبة
                                                  child:text(text: "Save", color: white, size: 15, weiht: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }),
                              textBottom(text: "Delete", color: green, function: () {
                                deleteBooking(index);
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              hightsized(),
            ],
          );
        },
      ),
    );
  }


}