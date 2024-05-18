import 'dart:async';
import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class Oppointment extends StatefulWidget {
  int index=0;
  Oppointment( {super.key});
  @override
  State<Oppointment> createState() => _OppointmentState();
}

class _OppointmentState extends State<Oppointment> {
  late Size size;
  var animate = false;
  var opacity = 0.0;

  var time = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();
    });
  }

  animator() {
    if (opacity == 0.0) {
      opacity = 1.0;
      animate = true;
    } else {
      opacity = 0.0;
      animate = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(

        body: Container(
          height: size.height,
          width: size.width,
          color: white,
          child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: animate ? 1 : 80,
                  left: 1,
                  bottom: 1,
                  right: 1,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: opacity,
                    child: Container(
                        padding: const EdgeInsets.only(top: 70),
                        height: double.infinity,
                        width: double.infinity,
                        child: Stack(
                            children: [
                              Positioned(
                                  top: 5,
                                  right: 20,
                                  left: 20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            animator();
                                            Timer(const Duration(milliseconds: 500), () {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            color: Colors.black,
                                          )),
                                      text(text: "Schedule",
                                        color: Colors.black, size: 20, weiht:  FontWeight.bold,),

                                      Container(
                                        height: 10,
                                      ),
                                    ],
                                  )),
                              Positioned(
                                  top: 70,
                                  left: 20,
                                  right: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SfDateRangePicker(
                                      selectionMode:
                                      DateRangePickerSelectionMode.single,
                                      backgroundColor:white,
                                      allowViewNavigation: true,
                                      enablePastDates: false,
                                      headerHeight: 100,
                                      selectionColor: green,
                                      toggleDaySelection: true,
                                      showNavigationArrow: true,
                                      selectionShape:
                                      DateRangePickerSelectionShape.circle,
                                      onSelectionChanged:
                                          (dateRangePickerSelectionChangedArgs) {},
                                      selectionTextStyle: const TextStyle(
                                         // color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                      headerStyle: const DateRangePickerHeaderStyle(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                      maxDate: DateTime.now(),
                                    ),
                                  )),
                              Positioned(
                                  top: 380,
                                  left: 30,
                                  child:text(text: "Time", color: Colors.black, size: 20,
                                      weiht:FontWeight.bold)
                              ),
                              Positioned(
                                top: 400,
                                left: 10,
                                right: 10,
                                child: Container(
                                  height: 180, // Set the container height big enough to contain both rows
                                  child: ListView(
                                    physics: NeverScrollableScrollPhysics(), // Prevent scrolling if you want to keep it static like before
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: List.generate(3, (index) { // Generate 3 slots for the first row
                                          return buildTimeSlot(index, changer, time);
                                        }),
                                      ),
                                      SizedBox(height: 10), // Space between the rows
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: List.generate(3, (index) { // Generate 3 slots for the second row, adjust index properly
                                          return buildTimeSlot(index + 3, changer, time);
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end, // دفع الزر إلى الأسفل
                                    children: [
                                      matrialbuttom(text: "Book an appointment", width: double.infinity, size: 20, wight: FontWeight.w500,function: (){}),
                                    ] ),
                              )])
                    )
                    ,
                  ),
                )]),)
    );
  }

  void changer(int ind) {
    for (int i = 0; i < 6; i++) {
      if (i == ind) {
        time[i] = true;
      } else {
        time[i] = false;
      }
    }
    setState(() {});
  }
}