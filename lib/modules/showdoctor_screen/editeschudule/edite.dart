import 'dart:async';
import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/models/oppinment.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class eSchedule extends StatefulWidget {
  const eSchedule({super.key});

  @override
  State<eSchedule> createState() => _eScheduleState();
}

class _eScheduleState extends State<eSchedule> {
  late Size size;
  double opacity = 0.0;
  bool animate = false;
  List<userdata> userDataList = [
    userdata(name: 'Mahmoud Ahmed', imagePath: 'assets/images/01.jpg', description: '01116051428.', time: "9:30 AM"),
    userdata(name: 'Mourad Ahmed', imagePath: 'assets/images/01.jpg', description: '01144469304', time: "10:30 AM"),
  ];
  List<Map<String, dynamic>> days = [
    {'name': 'Saturday', 'visible': false},
    {'name': 'Sunday', 'visible': false},
    {'name': 'Monday', 'visible': false},
    {'name': 'Tuesday', 'visible': false},
    {'name': 'Wednesday', 'visible': false},
    {'name': 'Thursday', 'visible': false},
    {'name': 'Friday', 'visible': false},
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        opacity = 1.0;
        animate = true;
      });
    });
  }

  void toggleVisibility(int index) {
    setState(() {
      days[index]['visible'] = !days[index]['visible'];
    });
  }



  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: text(text: "Schedule", color: Colors.black, size: 20, weiht: FontWeight.bold),

            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              initialDisplayDate: DateTime.now().subtract(
                Duration(days: DateTime.now().weekday - 1),
              ),
              initialSelectedDate: DateTime.now(),
              selectionMode: DateRangePickerSelectionMode.single,
              backgroundColor: white,
              headerHeight: 60,
              selectionColor: green,
              toggleDaySelection: true,
              showNavigationArrow: true,
              selectionShape: DateRangePickerSelectionShape.circle,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                // Handle date selection changes
              },
            ),
            Expanded(
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 400),
                child: ListView.builder(
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => toggleVisibility(index),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: white,
                              border: Border.all(
                                color: white,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text(text: days[index]['name'], color: Colors.black, size: 16, weiht: FontWeight.bold),
                                Icon(
                                  days[index]['visible'] ? Icons.expand_less : Icons.expand_more,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: days[index]['visible'],
                          child: ListView.builder(
                            itemCount: userDataList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, userIndex) {
                              final item = userDataList[userIndex];
                              return Container(
                                color: Colors.white,
                                height: 150,
                                child: Row(
                                  children: [
                                    smallimage(image: item.imagePath),
                                    widthsized(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          text(text: item.name, color: Colors.black, size: 18, weiht: FontWeight.w500),
                                          SizedBox(height: 5),
                                          text(text: item.description, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                                          text(text: item.time, color: Colors.black26, size: 15, weiht: FontWeight.w500),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end ,
                                            children: [
                                              textBottom(text: "Edite", color: green,function: (){

                                              }),
                                              textBottom(text: "Delete", color: green,function: (){}),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
