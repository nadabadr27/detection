import 'dart:async';
import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:detection/models/oppinment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late Size size;
  bool showInput = true;
  double opacity = 0.0;
  bool animate = false;

  List<Map<String, dynamic>> days = [
    {
      'name': 'Saturday',
      'visible': false,
      'users': [
        userdata(name: 'Mahmoud Ahmed', imagePath: 'assets/images/01.jpg', description: '01116051428', time: "9:30 AM"),
      ],
    },
    {
      'name': 'Sunday',
      'visible': false,
      'users': [
        userdata(name: 'Mourad Ahmed', imagePath: 'assets/images/01.jpg', description: '01144469304', time: "10:30 AM"),
      ],
    },
    {
      'name': 'Monday',
      'visible': false,
      'users': [
        userdata(name: 'Mahmoud Ahmed', imagePath: 'assets/images/01.jpg', description: '01116051428', time: "9:30 AM"),
        userdata(name: 'Mourad Ahmed', imagePath: 'assets/images/01.jpg', description: '01144469304', time: "10:30 AM"),
      ],
    },
    {'name': 'Tuesday', 'visible': false, 'users': []},
    {'name': 'Wednesday', 'visible': false, 'users': []},
    {'name': 'Thursday', 'visible': false, 'users': []},
    {'name': 'Friday', 'visible': false, 'users': []},
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

  void deleteItem(int dayIndex, int userIndex) {
    setState(() {
      days[dayIndex]['users'].removeAt(userIndex);
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
                    final day = days[index];
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
                                text(text: day['name'], color: Colors.black, size: 16, weiht: FontWeight.bold),
                                Icon(
                                  day['visible'] ? Icons.expand_less : Icons.expand_more,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: day['visible'],
                          child: ListView.builder(
                            itemCount: day['users'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, userIndex) {
                              final item = day['users'][userIndex];
                              return Container(
                                color: Colors.white,
                                height: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    smallimage(image: item.imagePath),
                                    widthsized(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          text(text: item.name, color: Colors.black, size: 18, weiht: FontWeight.w500),
                                          text(text: item.description, color: Colors.black26, size: 15, weiht: FontWeight.w500),
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
                                                deleteItem(index, userIndex);
                                              }),
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
